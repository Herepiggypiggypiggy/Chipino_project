library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of spi_v2_mosi is

signal SCLK_counter : std_logic_vector (2 downto 0);
signal SCLK_internal,	SCLK_fall, SCLK_rise:	std_logic;
signal MOSI_shift, MOSI_shift_next : std_logic_vector (15 downto 0);
signal MOSI_count, MOSI_count_next : std_logic_vector (4 downto 0);
signal sending, hold_send, hold_send_next : std_logic;

begin

-- scaled clock generator
process (clk)
begin
	if (rising_edge(clk)) then

		-- counter to devide clk
		if ((SCLK_counter = "111" or reset = '1')) then
		 	SCLK_counter <= "000";
		else
			SCLK_counter <= std_logic_vector(unsigned(SCLK_counter) + '1');
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
end process;

-- set mosi output
MOSI <= MOSI_shift(15);

-- clocked process for MOSI output / shift register
process (clk)
begin
	if (rising_edge(clk)) then
		-- shift
		MOSI_shift <= MOSI_shift_next;
	end if;
end process;

-- MOSI output / shift register process

process (MOSI_data, send, SCLK_internal, SCLK_rise, SCLK_fall, MOSI_count, MOSI_shift)
begin
	-- if statement to determine MOSI_shift_next
	if (send = '1') then

		-- read input
		MOSI_shift_next <= MOSI_data;
	elsif (SCLK_fall = '1' and sending = '1') then

		-- shift on falling edge
		MOSI_shift_next(15 downto 1) <= MOSI_shift(14 downto 0);
		MOSI_shift_next(0) <= '0';
	else
		MOSI_shift_next <= MOSI_shift;
	end if;
	
end process;

-- slave select and sending, clocked proccess
process(clk)
begin
	if rising_edge(clk) then
		MOSI_count <= MOSI_count_next;
		hold_send <= hold_send_next;
	end if;
end process;

-- slave select and sending, combinatorial proccess
process (MOSI_count, send, hold_send, SCLK_fall)
begin

	-- implementation of hold send signal that holds the send signal untill the next falling edge of the SCLK
	-- this ensures that the timing of when we send the data to be consistent.
	if (send = '1') then
		hold_send_next <= '1';
	elsif (SCLK_fall = '1') then
		hold_send_next <= '0';
	else
		hold_send_next <= hold_send;
	end if;

	-- Counter that counts how many bits have been sent
	if (SCLK_fall = '1') then
		if (hold_send = '1') then 
			MOSI_count_next <= "00001";
		elsif (MOSI_count = "00000") then
			MOSI_count_next <= "00000";
		elsif (MOSI_count = "10000") then -- reset count when we get to a certain point
			MOSI_count_next <= "00000";
		else
			MOSI_count_next <= std_logic_vector(unsigned(MOSI_count) + '1');
		end if;
	else
		MOSI_count_next <= MOSI_count;
	end if;
end process;

end behaviour;

