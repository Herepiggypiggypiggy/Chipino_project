library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of spi_v2_mosi is

signal SCLK_counter : std_logic_vector (2 downto 0);
signal SCLK_internal,	SCLK_fall, SCLK_rise:	std_logic;
signal MOSI_shift, MOSI_shift_next : std_logic_vector (15 downto 0);
signal MISO_shift, MISO_shift_next, map_data_next, map_data_internal : std_logic_vector (71 downto 0);
signal SS_count, SS_count_next : std_logic_vector (6 downto 0);
signal SS_internal, hold_send, hold_send_next, request_map, request_map_next : std_logic;
signal send_in0, send_in1, send_rise : std_logic;

begin

-- rising edge detector for send
process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '0') then
			send_in0 <= '0';
			send_in1 <= '0';
		else
			send_in0 <= send;
			send_in1 <= send_in0;
		end if;
	end if;
end process;

send_rise <= not send_in1 and send_in0;

-- set SCLK to be equal to SCLK_internal
SCLK <= SCLK_internal;

-- scaled clock generator
process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			SCLK_counter <= "000";
			SCLK_internal <= '0';
			SCLK_rise <= '0';
			SCLK_fall <= '0';
		else
			-- counter to devide clk
			if ((SCLK_counter = "111" or reset = '1')) then
				SCLK_counter <= "000";
			else
				SCLK_counter <= std_logic_vector(unsigned(SCLK_counter) + 1);
			end if;

			-- set internal SCLK values depending on counter
			if (SCLK_counter(2) = '0') then
				SCLK_internal <= '0';
			else 
				SCLK_internal <= '1';
			end if;

			-- output rise and fall signals for when to read and when to write
			if (SCLK_counter = "000") then
				SCLK_fall <= '1';
				SCLK_rise	<= '0';
			elsif (SCLK_counter = "100") then
				SCLK_fall <= '0';
				SCLK_rise <= '1';
			else 
				SCLK_fall <= '0';
				SCLK_rise <= '0';
			end if;	
		end if;
	end if;
end process;

-- set mosi output
MOSI <= MOSI_shift(15);

-- clocked process for MOSI output / shift register
process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			MOSI_shift <= (others => '0');
		else
			-- shift
			MOSI_shift <= MOSI_shift_next;
		end if;
	end if;
end process;

-- MOSI output / shift register process

process (MOSI_data, send_rise, SCLK_internal, SCLK_rise, SCLK_fall, SS_count, MOSI_shift, SS_internal)
begin
	-- if statement to determine MOSI_shift_next
	if (send_rise = '1') then

		-- read input
		MOSI_shift_next <= MOSI_data;
	elsif (SCLK_fall = '1' and SS_internal = '0') then

		-- shift on falling edge
		MOSI_shift_next(15 downto 1) <= MOSI_shift(14 downto 0);
		MOSI_shift_next(0) <= '0';
	else
		MOSI_shift_next <= MOSI_shift;
	end if;
	
end process;

-- Set slave select to be when NOT sending, because it's an active low signal
SS <= SS_internal;

-- slave select and sending, clocked proccess
process(clk)
begin
	if rising_edge(clk) then
		if (reset = '1') then
			SS_count <= (others => '0');
			hold_send <= '0';
			request_map <= '0';
		else
			SS_count <= SS_count_next;
			hold_send <= hold_send_next;
			request_map <= request_map_next;
		end if;
	end if;
end process;

-- slave select and sending, combinatorial proccess
process (SS_count, send_rise, hold_send, SCLK_fall, request_map, MOSI_data)
begin

	-- a signal that remembers if the player moved or mined
	-- we use this signal to extend the SS_count in case of move,
	-- since we need to keep SS_count going if we are receving new data
	if (send_rise = '1') then
		request_map_next <= MOSI_data(13);
	else
		request_map_next <= request_map;
	end if;

	-- implementation of hold send signal that holds the send signal untill the next falling edge of the SCLK
	-- this ensures that the timing of when we send the data to be consistent.
	if (send_rise = '1') then
		hold_send_next <= '1';
	elsif (SCLK_fall = '1') then
		hold_send_next <= '0';
	else
		hold_send_next <= hold_send;
	end if;

	-- Counter that counts how many bits have been sent
	if (SCLK_fall = '1') then
		if (hold_send = '1') then 
			SS_count_next <= "0000001";
		elsif (SS_count = "0000000") then
			SS_count_next <= "0000000";
		elsif (SS_count = "0001111" and request_map = '0') then -- reset count when we get to a certain point
			SS_count_next <= "0000000";
		elsif (SS_count = "1010111" and request_map = '1') then -- if we are requesting data, count 88 times (16 send 72 recieve)
			SS_count_next <= "0000000";
		else
			SS_count_next <= std_logic_vector(unsigned(SS_count) + 1);
		end if;
	else
		SS_count_next <= SS_count;
	end if;

	-- combinatorial statement to get the sending signal
	if (SS_count = "0000000") then
		SS_internal <= '1';
	else
		SS_internal <= '0';
	end if;

end process;

-- set map data to be equal to map data internal
map_data <= map_data_internal;

-- clocked process for MISO
process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			MISO_shift <= (others => '0');
			map_data_internal <= (others => '0');
		else
			MISO_shift <= MISO_shift_next;
			map_data_internal	<= map_data_next;
		end if;
	end if;
end process;

-- combinatorial process for MISO
process (MISO_shift, MISO, SCLK_rise, SCLK_fall, SS_count, map_data_internal)
begin
	if (SCLK_rise = '1') then -- check if SS_count is greater than 15 (in that case we are done sending)
		MISO_shift_next(0) <= MISO;
	else
		MISO_shift_next(0) <= MISO_shift(0);
	end if;

	if (SCLK_fall = '1') then -- check if SS_count is greater than 15 (in that case we are done sending)
		MISO_shift_next(71 downto 1) <= MISO_shift(70 downto 0);
	else 
		MISO_shift_next(71 downto 1) <= MISO_shift(71 downto 1);
	end if;

	if (SCLK_rise = '1' and SS_count = "1011000") then
		map_data_next <= MISO_shift;
	else
		map_data_next <= map_data_internal;
	end if;
end process;

end behaviour;
