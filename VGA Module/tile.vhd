library IEEE;
use IEEE.std_logic_1164.all;  
 
architecture behavioural of tile is 
begin 
process (clk, reset, tile_address, row, column) 
begin 
-- If reset is high, always select **Placeholer** -- 
if (reset = '1') then 
	color_address <= "0000"; 
else 
	-- Select color address depending on the tile address, and the row and column  
	-- Player tile is a native 8 x 8 texture and is upscaled to 24 x 24  
	-- All other tiles are native 4 x 4 textures, and are also upscaled to 24 x 24  
	case tile_address is 
		-- Player -- 
		when "0000" => 
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= "0000";	-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= "0000";	-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= "0000";	-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= "0000";	-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= "0000";	-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= "0000";	-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= "0000";	-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= "0000";	-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if;
		 
		-- **Placeholder** -- 
		when "0001" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "0010" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "0011" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "0100" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "0101" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "0110" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "0111" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "1000" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "1001" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1010" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1011" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23
			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1100" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1101" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "1110" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1111" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0000";	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0000";	-- row 18 - 23, column 18 - 23
			else																     	color_address <= "0000";
	
			end if;		 
 
		when others => 
			color_address <= "0000"; 
	end case; 
end if; 
end process; 
end behavioural;

