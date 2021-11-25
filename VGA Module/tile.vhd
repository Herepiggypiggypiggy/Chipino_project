library IEEE;
use IEEE.std_logic_1164.all;  

entity tile_driver is
port(
	clk		: in  std_logic;
	reset		: in  std_logic;

	tile_address	: in  std_logic_vector(4 downto 0);
	row		: in  std_logic_vector(4 downto 0);
	column		: in  std_logic_vector(4 downto 0);

	color_address	: out std_logic_vector(3 downto 0)
);
end tile_driver
	
 
architecture behavioural of tile_driver is 
	
	constant black 		: std_logic_vector(3 downto 0) := "0000";
	constant white		: std_logic_vector(3 downto 0) := "0001";
	constant bg_red		: std_logic_vector(3 downto 0) := "0011";
	constant dark_grey 	: std_logic_vector(3 downto 0) := "0100";

	constant light_gray	: std_logic_vector(3 downto 0) := "0101";
	constant orange		: std_logic_vector(3 downto 0) := "0110";
	constant yellow 	: std_logic_vector(3 downto 0) := "0111";
	constant denim_blue	: std_logic_vector(3 downto 0) := "1000";

	constant mole_brown	: std_logic_vector(3 downto 0) := "1001";
	constant diamond 	: std_logic_vector(3 downto 0) := "1010";
	constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";
	constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";

	constant -- **Placeholder** -- 	: std_logic_vector(3 downto 0) := "0000";
	constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";
	constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";
	constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";

begin 
process (clk, reset, tile_address, row, column) 
begin 
-- If reset is high, always select **Placeholer** -- 
if (reset = '1') then 
	color_address <= "0000"; 
else 
	-- Select color address depending on the tile address, and the row and column  
	-- The player tile and number tiles are native 8 x 8 textures and are upscaled to 24 x 24  
	-- All other tiles are native 4 x 4 textures, and are also upscaled to 24 x 24  
	case tile_address is 
		-- Player -- 
		when "00000" => 
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
		when "00001" => 
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
		when "00010" => 
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
		when "00011" => 
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
		when "00100" => 
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
		when "00101" => 
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
		when "00110" => 
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
		when "00111" => 
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
		when "01000" => 
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
		when "01001" => 
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
		when "01010" => 
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
		when "01011" => 
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
		when "01100" => 
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
		when "01101" => 
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
		when "01110" => 
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
		when "01111" => 
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

		-- Number: 0 --
		when "10000" =>
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if;

		-- Number: 1 --
		when "10001" =>
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if;

		-- Number: 2 --
		when "10010" =>
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= white;		-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if;	

		-- Number: 3 --
		when "10011" =>
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= white;		-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if;

		-- Number: 4 --
		when "10100" =>
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= white;		-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if; 

		-- Number: 5 --
		when "10101" =>
			if 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 0 - 2, column 0 - 2
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 0 - 2, column 3 - 5
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 0 - 2, column 6 - 8
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 0 - 2, column 9 - 11
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 0 - 2, column 12 - 14
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 0 - 2, column 15 - 17
			elsif	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 0 - 2, column 18 - 20
			elsif 	(row(4 downto 1) = "0000" or row(4 downto 0) = "00010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 0 - 2, column 21 - 23 

			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 3 - 5, column 0 - 2
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 3 - 5, column 3 - 5
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 3 - 5, column 6 - 8
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 3 - 5, column 9 - 11
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 3 - 5, column 12 - 14
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 3 - 5, column 15 - 17
			elsif	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 3 - 5, column 18 - 20
			elsif 	(row(4 downto 0) = "00011" or row(4 downto 1) = "0010") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 3 - 5, column 21 - 23  

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 6 - 8, column 0 - 2
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 6 - 8, column 3 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 6 - 8, column 6 - 8
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 6 - 8, column 9 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 6 - 8, column 12 - 14
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 6 - 8, column 15 - 17
			elsif	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 6 - 8, column 18 - 20
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 0) = "01000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 6 - 8, column 21 - 23 

			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 9 - 11, column 0 - 2
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 9 - 11, column 3 - 5
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 9 - 11, column 6 - 8
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 9 - 11, column 9 - 11
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 9 - 11, column 12 - 14
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 9 - 11, column 15 - 17
			elsif	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 9 - 11, column 18 - 20
			elsif 	(row(4 downto 0) = "01001" or row(4 downto 1) = "0101") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= black;		-- row 9 - 11, column 21 - 23 

			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= white;		-- row 12 - 14, column 0 - 2
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 12 - 14, column 3 - 5
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 12 - 14, column 6 - 8
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 12 - 14, column 9 - 11
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 12 - 14, column 12 - 14
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 12 - 14, column 15 - 17
			elsif	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 12 - 14, column 18 - 20
			elsif 	(row(4 downto 1) = "0110" or row(4 downto 0) = "01110") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 12 - 14, column 21 - 23 

			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 15 - 17, column 0 - 2
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 15 - 17, column 3 - 5
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 15 - 17, column 6 - 8
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 15 - 17, column 9 - 11
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 15 - 17, column 12 - 14
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 15 - 17, column 15 - 17
			elsif	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 15 - 17, column 18 - 20
			elsif 	(row(4 downto 0) = "01111" or row(4 downto 1) = "1000") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 15 - 17, column 21 - 23    

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 18 - 20, column 0 - 2
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= black;		-- row 18 - 20, column 3 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= black;		-- row 18 - 20, column 6 - 8
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= black;		-- row 18 - 20, column 9 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= black;		-- row 18 - 20, column 12 - 14
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= black;		-- row 18 - 20, column 15 - 17
			elsif	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= black;		-- row 18 - 20, column 18 - 20
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 0) = "10100") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 18 - 20, column 21 - 23

			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0000" or column(4 downto 0) = "00010") then	color_address <= black;		-- row 21 - 23, column 0 - 2
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "00011" or column(4 downto 1) = "0010") then	color_address <= white;		-- row 21 - 23, column 3 - 5
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0011" or column(4 downto 0) = "01000") then	color_address <= white;		-- row 21 - 23, column 6 - 8
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01001" or column(4 downto 1) = "0101") then	color_address <= white;		-- row 21 - 23, column 9 - 11
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "0110" or column(4 downto 0) = "01110") then	color_address <= white;		-- row 21 - 23, column 12 - 14
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "01111" or column(4 downto 1) = "1000") then	color_address <= white;		-- row 21 - 23, column 15 - 17
			elsif	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 1) = "1001" or column(4 downto 0) = "10100") then	color_address <= white;		-- row 21 - 23, column 18 - 20
			elsif 	(row(4 downto 0) = "10101" or row(4 downto 1) = "1011") and (column(4 downto 0) = "10101" or column(4 downto 1) = "1011") then	color_address <= white;		-- row 21 - 23, column 21 - 23    

			else																     	color_address <= "0000";
	
			end if;		 
 
		when others => 
			color_address <= "0000"; 
	end case; 
end if; 
end process; 
end behavioural;

