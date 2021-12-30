library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of not_arduino is

type n_arduino_state is (SS_state, read_state, shift_state, processing_state);
signal state, state_next : n_arduino_state;

type map_data is array (0 to 14, 0 to 14) of std_logic_vector(2 downto 0);
signal full_map, map_next : map_data;
signal MISO_shift, MISO_shift_next : std_logic_vector(72 downto 0);
signal MOSI_shift, MOSI_shift_next : std_logic_vector(16 downto 0);
signal SCLK_edge : std_logic_vector(1 downto 0);
signal SCLK_rise, SCLK_fall : std_logic;

signal bit_counter, bit_counter_next : std_logic_vector(3 downto 0);

signal x_pos, y_pos : integer;
signal level : integer;
signal request_map : std_logic;

begin



-- combanatorial stuff
SCLK_rise <= SCLK_edge(0) and (not SCLK_edge(1));
SCLK_fall <= SCLK_edge(1) and (not SCLK_edge(0));

request_map <= MOSI_shift(14);
level <= to_integer(unsigned(MOSI_shift(13 downto 9)));
y_pos <= to_integer(unsigned(MOSI_shift(8 downto 5)));
x_pos <= to_integer(unsigned(MOSI_shift(4 downto 1)));

MISO <= MISO_shift(72);

process(clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then

			full_map <= (		("011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011"), 
					("011", "100", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "111", "011"),
					("011", "100", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "010", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "100", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "001", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "011"),
					("011", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "001", "000", "011"),
					("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "001", "001", "000", "011"),
					("011", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
					("011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011"));

			MISO_shift <= (others => '0');
			MOSI_shift <= (others => '0');
			SCLK_edge <= (others => '0');
			state <= SS_state;

			bit_counter <= (others => '0');
		else

			full_map <= map_next;

			MISO_shift <= MISO_shift_next;
			MOSI_shift <= MOSI_shift_next;
			SCLK_edge(0) <= SCLK;
			SCLK_edge(1) <= SCLK_edge(0);
			state <= state_next;

			bit_counter <= bit_counter_next;
		end if;
	end if;
end process;

process(SCLK_rise, SCLK_fall, MISO_shift, MOSI_shift, SS, MOSI, full_map, state, bit_counter)
begin

case state is
	when SS_state =>
		if (SS = '1') then
			state_next <= SS_state;
		else
			state_next <= read_state;
		end if;
		MISO_shift_next <= (others => '0');
		MOSI_shift_next <= (others => '0');
		bit_counter_next <= (others => '0');

		map_next <= (		("011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011"), 
				("011", "100", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "111", "011"),
				("011", "100", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "010", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "100", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "001", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "000", "011"),
				("011", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "001", "000", "011"),
				("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "000", "000", "000", "000", "000", "000", "001", "000", "000", "001", "001", "000", "011"),
				("011", "000", "000", "000", "001", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "011"),
				("011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011", "011"));

	when read_state =>
		if (SS = '1') then
			state_next <= SS_state;
			MISO_shift_next <= MISO_shift;
			MOSI_shift_next <= MOSI_shift;
		elsif (bit_counter = "1000") then
			state_next <= processing_state;
			MISO_shift_next <= MISO_shift;
			MOSI_shift_next <= MOSI_shift;
		elsif (SCLK = '1') then
			state_next <= shift_state;
			MISO_shift_next <= MISO_shift;
			MOSI_shift_next(16 downto 1) <= MOSI_shift(16 downto 1);
			MOSI_shift_next(0) <= MOSI;
		else
			state_next <= read_state;
			MISO_shift_next <= MISO_shift;
			MOSI_shift_next <= MOSI_shift;
		end if;

		bit_counter_next <= bit_counter;

		map_next <= full_map;

	when shift_state =>
		if (SS = '1') then
			state_next <= SS_state;
			MISO_shift_next <= MISO_shift;
			MOSI_shift_next <= MOSI_shift;
			bit_counter_next <= bit_counter;
		elsif (SCLK = '0') then
			state_next <= read_state;
			MISO_shift_next(72 downto 1) <= MISO_shift(71 downto 0);
			MOSI_shift_next(16 downto 1) <= MOSI_shift(15 downto 0);
			MOSI_shift_next(0) <= '0';

			if (bit_counter = "1111") then
				bit_counter_next <= bit_counter;
			else
				bit_counter_next <= std_logic_vector(unsigned(bit_counter)+1);
			end if;
		else
			state_next <= shift_state;
			MISO_shift_next <= MISO_shift;
			MOSI_shift_next <= MOSI_shift;
			bit_counter_next <= bit_counter;
		end if;

		map_next <= full_map;

	when processing_state =>
		if (request_map = '1') then
			-- set MISO_shift to be equal to the tiles.

			-- tile 1
			if (x_pos > 2) then 
				MISO_shift_next(72 downto 70) <= full_map(y_pos, (x_pos - 3));
			else
				MISO_shift_next(72 downto 70) <= "011";
			end if;

			-- tile 2
			if (x_pos > 1 and y_pos > 0) then 
				MISO_shift_next(69 downto 67) <= full_map((y_pos - 1), (x_pos - 2));
			else
				MISO_shift_next(69 downto 67) <= "011";
			end if;

			-- tile 3
			if (x_pos > 1) then 
				MISO_shift_next(66 downto 64) <= full_map(y_pos, (x_pos - 2));
			else
				MISO_shift_next(66 downto 64) <= "011";
			end if;

			-- tile 4
			if (x_pos > 1 and y_pos < 15) then 
				MISO_shift_next(63 downto 61) <= full_map((y_pos + 1), (x_pos - 2));
			else
				MISO_shift_next(63 downto 61) <= "011";
			end if;

			-- tile 5
			if (x_pos > 0 and y_pos > 1) then 
				MISO_shift_next(60 downto 58) <= full_map((y_pos - 2), (x_pos - 1));
			else
				MISO_shift_next(60 downto 58) <= "011";
			end if;

			-- tile 6
			if (x_pos > 0 and y_pos > 0) then 
				MISO_shift_next(57 downto 55) <= full_map((y_pos - 1), (x_pos - 1));
			else
				MISO_shift_next(57 downto 55) <= "011";
			end if;

			-- tile 7
			if (x_pos > 0) then 
				MISO_shift_next(54 downto 52) <= full_map(y_pos, (x_pos - 1));
			else
				MISO_shift_next(54 downto 52) <= "011";
			end if;

			-- tile 8
			if (x_pos > 0 and y_pos < 15) then 
				MISO_shift_next(51 downto 49) <= full_map((y_pos + 1), (x_pos - 1));
			else
				MISO_shift_next(51 downto 49) <= "011";
			end if;

			-- tile 9
			if (x_pos > 0 and y_pos < 14) then 
				MISO_shift_next(48 downto 46) <= full_map((y_pos + 2), (x_pos - 1));
			else
				MISO_shift_next(48 downto 46) <= "011";
			end if;

			-- tile 10
			if (y_pos > 2) then 
				MISO_shift_next(45 downto 43) <= full_map((y_pos - 3), x_pos);
			else
				MISO_shift_next(45 downto 43) <= "011";
			end if;

			-- tile 11
			if (y_pos > 1) then 
				MISO_shift_next(42 downto 40) <= full_map((y_pos - 2), x_pos);
			else
				MISO_shift_next(42 downto 40) <= "011";
			end if;

			-- tile 12
			if (y_pos > 0) then 
				MISO_shift_next(39 downto 37) <= full_map((y_pos - 1), x_pos);
			else
				MISO_shift_next(39 downto 37) <= "011";
			end if;

			-- tile 13
			if (y_pos < 15) then 
				MISO_shift_next(36 downto 34) <= full_map((y_pos + 1), x_pos);
			else
				MISO_shift_next(36 downto 34) <= "011";
			end if;

			-- tile 14
			if (y_pos < 14) then 
				MISO_shift_next(33 downto 31) <= full_map((y_pos + 2), x_pos);
			else
				MISO_shift_next(33 downto 31) <= "011";
			end if;

			-- tile 15
			if (y_pos < 13) then 
				MISO_shift_next(30 downto 28) <= full_map((y_pos + 3), x_pos);
			else
				MISO_shift_next(30 downto 28) <= "011";
			end if;

			-- tile 16
			if (x_pos < 15 and y_pos > 1) then 
				MISO_shift_next(27 downto 25) <= full_map((y_pos - 2), (x_pos + 1));
			else
				MISO_shift_next(27 downto 25) <= "011";
			end if;

			-- tile 17
			if (x_pos < 15 and y_pos > 0) then 
				MISO_shift_next(24 downto 22) <= full_map((y_pos - 1), (x_pos + 1));
			else
				MISO_shift_next(24 downto 22) <= "011";
			end if;

			-- tile 18
			if (x_pos < 15) then 
				MISO_shift_next(21 downto 19) <= full_map(y_pos, (x_pos + 1));
			else
				MISO_shift_next(21 downto 19) <= "011";
			end if;

			-- tile 19
			if (x_pos < 15 and y_pos < 15) then 
				MISO_shift_next(18 downto 16) <= full_map((y_pos + 1), (x_pos + 1));
			else
				MISO_shift_next(18 downto 16) <= "011";
			end if;

			-- tile 20
			if (x_pos < 15 and y_pos < 14) then 
				MISO_shift_next(15 downto 13) <= full_map((y_pos + 2), (x_pos + 1));
			else
				MISO_shift_next(15 downto 13) <= "011";
			end if;

			-- tile 21
			if (x_pos < 14 and y_pos > 0) then 
				MISO_shift_next(12 downto 10) <= full_map((y_pos - 1), (x_pos + 2));
			else
				MISO_shift_next(12 downto 10) <= "011";
			end if;

			-- tile 22
			if (x_pos < 14) then 
				MISO_shift_next(9 downto 7) <= full_map(y_pos, (x_pos + 2));
			else
				MISO_shift_next(9 downto 7) <= "011";
			end if;

			-- tile 23
			if (x_pos < 14 and y_pos < 15) then 
				MISO_shift_next(6 downto 4) <= full_map((y_pos + 1), (x_pos + 2));
			else
				MISO_shift_next(6 downto 4) <= "011";
			end if;

			-- tile 24
			if (x_pos < 13) then 
				MISO_shift_next(3 downto 1) <= full_map(y_pos, (x_pos + 3));
			else
				MISO_shift_next(3 downto 1) <= "011";
			end if;

			MISO_shift_next(0) <= '0';

			-- avoid latches
			map_next <= full_map;
		else
			-- change the map data
			for i in full_map'range(1) loop
				for j in full_map'range(2) loop
					if (i = y_pos and j = x_pos) then
						if (full_map(i,j) = "111") then
							map_next(i,j) <= "101";
						else
							map_next(i,j) <= "000";
						end if;
					else
						map_next(i,j) <= full_map(i,j);
					end if;
				end loop;
			end loop;

			-- avoid latches
			MISO_shift_next <= MISO_shift;

		end if;

		state_next <= read_state;
		MOSI_shift_next <= MOSI_shift;
		bit_counter_next <= bit_counter;

	when others =>
		state_next <= SS_state;
		MISO_shift_next <= MISO_shift;
		MOSI_shift_next <= MOSI_shift;
		bit_counter_next <= bit_counter;

		map_next <= full_map;
end case;
	
end process;

end behaviour;

