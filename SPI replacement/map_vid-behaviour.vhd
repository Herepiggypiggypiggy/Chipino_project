library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

architecture behaviour of map_vid is
signal fake_counter, fake_counter_next : std_logic_vector(2 downto 0);
begin

process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			fake_counter <= (others => '0');
		else
			fake_counter <= fake_counter_next;
		end if;
	end if;
end process;

process (moved, dir_mined)
begin
	if (moved = '1' or dir_mined(2) = '1') then
		if (fake_counter = "111") then
			fake_counter_next <= "000";
		else
			fake_counter_next <= std_logic_vector(unsigned(fake_counter) + 1);
		end if;
	else
		fake_counter_next <= fake_counter;
	end if;
end process;

process (fake_counter)
begin
case fake_counter is
	when "000" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "011";  -- 5
	map_data(17 downto 15) <= "010";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "000";  -- 8
	map_data(26 downto 24) <= "011";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "011";  -- 11
	map_data(35 downto 33) <= "000";  -- 12 -- special
	map_data(38 downto 36) <= "000";  -- 13
	map_data(41 downto 39) <= "011";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "011";  -- 16
	map_data(50 downto 48) <= "001";  -- 17
	map_data(53 downto 51) <= "000";  -- 18
	map_data(56 downto 54) <= "111";  -- 19
	map_data(59 downto 57) <= "011";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when "001" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "011";  -- 5
	map_data(17 downto 15) <= "011";  -- 6
	map_data(20 downto 18) <= "010";  -- 7
	map_data(23 downto 21) <= "000";  -- 8
	map_data(26 downto 24) <= "000";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "011";  -- 11
	map_data(35 downto 33) <= "011";  -- 12 -- special
	map_data(38 downto 36) <= "000";  -- 13
	map_data(41 downto 39) <= "000";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "011";  -- 16
	map_data(50 downto 48) <= "011";  -- 17
	map_data(53 downto 51) <= "001";  -- 18
	map_data(56 downto 54) <= "000";  -- 19
	map_data(59 downto 57) <= "111";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when "010" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "011";  -- 5
	map_data(17 downto 15) <= "011";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "000";  -- 8
	map_data(26 downto 24) <= "000";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "011";  -- 11
	map_data(35 downto 33) <= "011";  -- 12 -- special
	map_data(38 downto 36) <= "000";  -- 13
	map_data(41 downto 39) <= "000";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "011";  -- 16
	map_data(50 downto 48) <= "011";  -- 17
	map_data(53 downto 51) <= "001";  -- 18
	map_data(56 downto 54) <= "000";  -- 19
	map_data(59 downto 57) <= "111";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when "011" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "011";  -- 5
	map_data(17 downto 15) <= "011";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "000";  -- 8
	map_data(26 downto 24) <= "000";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "011";  -- 11
	map_data(35 downto 33) <= "011";  -- 12 -- special
	map_data(38 downto 36) <= "000";  -- 13
	map_data(41 downto 39) <= "000";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "011";  -- 16
	map_data(50 downto 48) <= "011";  -- 17
	map_data(53 downto 51) <= "000";  -- 18
	map_data(56 downto 54) <= "000";  -- 19
	map_data(59 downto 57) <= "111";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when "100" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "011";  -- 5
	map_data(17 downto 15) <= "000";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "000";  -- 8
	map_data(26 downto 24) <= "011";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "011";  -- 11
	map_data(35 downto 33) <= "000";  -- 12 -- special
	map_data(38 downto 36) <= "000";  -- 13
	map_data(41 downto 39) <= "011";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "011";  -- 16
	map_data(50 downto 48) <= "000";  -- 17
	map_data(53 downto 51) <= "000";  -- 18
	map_data(56 downto 54) <= "111";  -- 19
	map_data(59 downto 57) <= "011";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when "101" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "000";  -- 5
	map_data(17 downto 15) <= "000";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "011";  -- 8
	map_data(26 downto 24) <= "011";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "000";  -- 11
	map_data(35 downto 33) <= "000";  -- 12 -- special
	map_data(38 downto 36) <= "011";  -- 13
	map_data(41 downto 39) <= "011";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "000";  -- 16
	map_data(50 downto 48) <= "000";  -- 17
	map_data(53 downto 51) <= "111";  -- 18
	map_data(56 downto 54) <= "011";  -- 19
	map_data(59 downto 57) <= "011";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when "110" =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "000";  -- 5
	map_data(17 downto 15) <= "000";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "011";  -- 8
	map_data(26 downto 24) <= "011";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "000";  -- 11
	map_data(35 downto 33) <= "000";  -- 12 -- special
	map_data(38 downto 36) <= "011";  -- 13
	map_data(41 downto 39) <= "011";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "000";  -- 16
	map_data(50 downto 48) <= "000";  -- 17
	map_data(53 downto 51) <= "101";  -- 18
	map_data(56 downto 54) <= "011";  -- 19
	map_data(59 downto 57) <= "011";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	when others =>
	map_data(2 downto 0) <= "011";  -- 1
	map_data(5 downto 3) <= "011";  -- 2
	map_data(8 downto 6) <= "011";  -- 3
	map_data(11 downto 9) <= "011";  -- 4
	map_data(14 downto 12) <= "011";  -- 5
	map_data(17 downto 15) <= "010";  -- 6
	map_data(20 downto 18) <= "000";  -- 7
	map_data(23 downto 21) <= "000";  -- 8
	map_data(26 downto 24) <= "011";  -- 9
	map_data(29 downto 27) <= "011";  -- 10
	map_data(32 downto 30) <= "011";  -- 11
	map_data(35 downto 33) <= "000";  -- 12 -- special
	map_data(38 downto 36) <= "000";  -- 13
	map_data(41 downto 39) <= "011";  -- 14
	map_data(44 downto 42) <= "011";  -- 15
	map_data(47 downto 45) <= "011";  -- 16
	map_data(50 downto 48) <= "001";  -- 17
	map_data(53 downto 51) <= "000";  -- 18
	map_data(56 downto 54) <= "111";  -- 19
	map_data(59 downto 57) <= "011";  -- 20
	map_data(62 downto 60) <= "011";  -- 21
	map_data(65 downto 63) <= "011";  -- 22
	map_data(68 downto 66) <= "011";  -- 23
	map_data(71 downto 69) <= "011";  -- 24
	
end case;
end process;
end behaviour;

