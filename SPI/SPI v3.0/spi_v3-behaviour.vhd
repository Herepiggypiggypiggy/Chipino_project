library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of spi_v3 is

type spi_state is (reset_state, sclk_0_state, sclk_1_state, pause_state);
signal state, next_state : spi_state;
signal MISO_shift, MISO_shift_next: std_logic_vector(72 downto 0);
signal map_data_next, map_data_internal: std_logic_vector(71 downto 0);
signal MOSI_shift, MOSI_shift_next : std_logic_vector(15 downto 0);
signal byte_count, byte_count_next, bit_count, bit_count_next : std_logic_vector(3 downto 0);
signal pause_count, pause_count_next : std_logic_vector(2 downto 0);
signal SCLK_count, SCLK_count_next : std_logic_vector(2 downto 0);
signal request_map, SCLK_internal : std_logic;
signal send_in0, send_in1, send_rise : std_logic;

begin

-- rising edge detector for send
process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			send_in0 <= '0';
			send_in1 <= '0';
		else
			send_in0 <= send;
			send_in1 <= send_in0;
		end if;
	end if;
end process;

send_rise <= not send_in1 and send_in0;

request_map <= mosi_data(13);
MOSI <= MOSI_shift(15);
map_data_volatile <= map_data_internal;

process(clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			state <= reset_state;

			byte_count <= (others => '0');
			bit_count <= (others => '0');
			pause_count <= (others => '0');
			SCLK_count <= (others => '0');

			MISO_shift <= (others => '0');
			MOSI_shift <= (others => '0');

			map_data_internal <= (others => '0');
		else
			state <= next_state;

			byte_count <= byte_count_next;
			bit_count <= bit_count_next;
			pause_count <= pause_count_next;
			SCLK_count <= SCLK_count_next;

			MISO_shift <= MISO_shift_next;
			MOSI_shift <= MOSI_shift_next;

			map_data_internal <= map_data_next;
		end if;
	end if;
end process;

process(state, send_rise, request_map, SCLK_count, bit_count, byte_count, pause_count, MOSI_data, MOSI_shift, MISO, MISO_shift, map_data_internal)
begin

case state is
	when reset_state =>
		-- determine next state
		if (send_rise = '1') then
			next_state <= sclk_0_state;
		else
			next_state <= reset_state;
		end if;

		-- state dependent outputs
		SCLK_internal <= '0';
		SS <= '1';
		map_data_next <= map_data_internal ;

		-- counters
		byte_count_next <= (others => '0');
		bit_count_next <= (others => '0');
		pause_count_next <= (others => '0');
		SCLK_count_next <= (others => '0');

		-- shift registers
		MISO_shift_next <= (others => '0');
		MOSI_shift_next <= MOSI_data;
		

	when sclk_0_state =>
		-- determine next state
		if (byte_count = "1011") then
			next_state <= reset_state;

			MISO_shift_next(0) <= MISO_shift(0);
			map_data_next <= MISO_shift(72 downto 1);
		elsif (byte_count = "0010" and request_map = '0') then
			next_state <= reset_state;

			MISO_shift_next(0) <= MISO_shift(0);
			map_data_next <= map_data_internal;
		elsif (bit_count = "1000" and SCLK_count = "111") then
			next_state <= pause_state;

			MISO_shift_next(0) <= MISO_shift(0);
			map_data_next <= map_data_internal ;
		elsif (SCLK_count =  "111") then
			next_state <= sclk_1_state;

			MISO_shift_next(0) <= MISO; -- read on rise
			map_data_next <= map_data_internal ;
		else
			next_state <= sclk_0_state;

			MISO_shift_next(0) <= MISO_shift(0);
			map_data_next <= map_data_internal ;
		end if;

		-- state dependent outputs
		SCLK_internal <= '0';
		ss <= '0';

		-- shift registers
		MISO_shift_next(72 downto 1) <= MISO_shift (72 downto 1);
		MOSI_shift_next <= MOSI_shift;

		-- counters
		if (SCLK_count = "111") then
			SCLK_count_next <= (others => '0');

			if (bit_count = "1000") then
				bit_count_next <= (others => '0');
			else
				bit_count_next <= std_logic_vector(unsigned(bit_count) + 1);
			end if;
		else
			SCLK_count_next <= std_logic_vector(unsigned(SCLK_count) + 1);
			bit_count_next <= bit_count;
		end if;

		byte_count_next <= byte_count;
		pause_count_next <= pause_count;

	when sclk_1_state =>
		-- determine next state
		if (SCLK_count = "111") then
			next_state <= sclk_0_state;
			MISO_shift_next(72 downto 1) <= MISO_shift(71 downto 0); -- shift on falling edge
			MOSI_shift_next(15 downto 1) <= MOSI_shift(14 downto 0); -- shift on falling edge
		else
			next_state <= sclk_1_state;
			MISO_shift_next(72 downto 1) <= MISO_shift(72 downto 1);
			MOSI_shift_next(15 downto 1) <= MOSI_shift(15 downto 1);
		end if;

		-- state dependent outputs
		SCLK_internal <= '1';
		ss <= '0';
		map_data_next <= map_data_internal ;

		-- shift registers
		MISO_shift_next(0) <= MISO_shift(0);
		MOSI_shift_next(0) <= MOSI_shift(0);

		-- counters
		if (SCLK_count = "111") then
			SCLK_count_next <= (others => '0');
		else
			SCLK_count_next <= std_logic_vector(unsigned(SCLK_count) + 1);
		end if;
		byte_count_next <= byte_count;
		bit_count_next <= bit_count;
		pause_count_next <= pause_count;

	when pause_state =>
		-- determine next state
		if (pause_count = "100" and SCLK_count = "111") then
			next_state <= sclk_0_state;
		else
			next_state <= pause_state;
		end if;

		-- state dependent outputs
		SCLK_internal <= '0';
		ss <= '0';
		map_data_next <= map_data_internal ;

		-- shift registers
		MISO_shift_next <= MISO_shift;
		MOSI_shift_next <= MOSI_shift;

		-- counters
		if (SCLK_count = "111") then
			SCLK_count_next <= (others => '0');

			if (pause_count = "100") then
				pause_count_next <= (others => '0');

				if (byte_count = "1011") then
					byte_count_next <= (others => '0');
				elsif (byte_count = "0010" and request_map = '0') then
					byte_count_next <= (others => '0');
				else
					byte_count_next <= std_logic_vector(unsigned(byte_count) + 1);
				end if;
			else
				pause_count_next <= std_logic_vector(unsigned(pause_count) + 1);
				byte_count_next <= byte_count;
			end if;
		else
			SCLK_count_next <= std_logic_vector(unsigned(SCLK_count) + 1);
			pause_count_next <= pause_count;
			byte_count_next <= byte_count;
		end if;

		bit_count_next <= bit_count;

	when others =>
		next_state <= reset_state;

		-- state dependent outputs
		SCLK_internal <= '0';
		ss <= '1';
		map_data_next <= map_data_internal ;

		-- shift registers
		MISO_shift_next <= MISO_shift;
		MOSI_shift_next <= MOSI_shift;

		-- counters
		byte_count_next <= byte_count;
		bit_count_next <= bit_count;
		pause_count_next <= pause_count;
		SCLK_count_next <= SCLK_count;
end case;

end process;

-- set internal signals as output
SCLK <= SCLK_internal;

end behaviour;
