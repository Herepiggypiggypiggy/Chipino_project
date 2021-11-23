library IEEE;
use IEEE.std_logic_1164.all;

entity tile_driver is
port (
	clk 		: in std_logic;
	reset 		: in std_logic;

	tile_address 	: in std_logic_vector(3 downto 0);
	row		: in std_logic_vector(2 downto 0);
	column		: in std_logic_vector(2 downto 0);

	color_address  	: out std_logic_vector(3 downto 0)

);
end tile_driver;

architecture behavioural of tile_driver is

	signal position : std_logic_vector(5 downto 0);

begin
process (clk, reset, tile_address, row, column)
begin
-- If reset is high, always select **Placeholer** --
if (reset = '1') then
	color_address <= "0000";
else
	-- Concatenate the row and column 3 bit vectors into a 6 bit vector called position
	-- Done so that the row and column can be used in a switch statement
	-- Example: 101 & 011 = 101011
	position <= row & column;

	-- Select color address depending on the tile address, and the row and column 
	-- Player tile is a native 8 x 8 texture 
	-- All other tiles are native 4 x 4 textures, and are upscaled to 8 x 8 
	case tile_address is
		-- Player --
		when "0000" =>
			case position is
				-- Row 0
				when "000000" => color_address <= "0000"; -- Column 0
				when "000001" => color_address <= "0000"; -- Column 1
				when "000010" => color_address <= "0000"; -- Column 2
				when "000011" => color_address <= "0000"; -- Column 3
				when "000100" => color_address <= "0000"; -- Column 4
				when "000101" => color_address <= "0000"; -- Column 5
				when "000110" => color_address <= "0000"; -- Column 6
				when "000111" => color_address <= "0000"; -- Column 7

				-- Row 1
				when "001000" => color_address <= "0000"; -- Column 0
				when "001001" => color_address <= "0000"; -- Column 1
				when "001010" => color_address <= "0000"; -- Column 2
				when "001011" => color_address <= "0000"; -- Column 3
				when "001100" => color_address <= "0000"; -- Column 4
				when "001101" => color_address <= "0000"; -- Column 5
				when "001110" => color_address <= "0000"; -- Column 6
				when "001111" => color_address <= "0000"; -- Column 7

				-- Row 2
				when "010000" => color_address <= "0000"; -- Column 0
				when "010001" => color_address <= "0000"; -- Column 1
				when "010010" => color_address <= "0000"; -- Column 2
				when "010011" => color_address <= "0000"; -- Column 3
				when "010100" => color_address <= "0000"; -- Column 4
				when "010101" => color_address <= "0000"; -- Column 5
				when "010110" => color_address <= "0000"; -- Column 6
				when "010111" => color_address <= "0000"; -- Column 7

				-- Row 3
				when "011000" => color_address <= "0000"; -- Column 0
				when "011001" => color_address <= "0000"; -- Column 1
				when "011010" => color_address <= "0000"; -- Column 2
				when "011011" => color_address <= "0000"; -- Column 3
				when "011100" => color_address <= "0000"; -- Column 4
				when "011101" => color_address <= "0000"; -- Column 5
				when "011110" => color_address <= "0000"; -- Column 6
				when "011111" => color_address <= "0000"; -- Column 7

				-- Row 4
				when "100000" => color_address <= "0000"; -- Column 0
				when "100001" => color_address <= "0000"; -- Column 1
				when "100010" => color_address <= "0000"; -- Column 2
				when "100011" => color_address <= "0000"; -- Column 3
				when "100100" => color_address <= "0000"; -- Column 4
				when "100101" => color_address <= "0000"; -- Column 5
				when "100110" => color_address <= "0000"; -- Column 6
				when "100111" => color_address <= "0000"; -- Column 7

				-- Row 5
				when "101000" => color_address <= "0000"; -- Column 0
				when "101001" => color_address <= "0000"; -- Column 1
				when "101010" => color_address <= "0000"; -- Column 2
				when "101011" => color_address <= "0000"; -- Column 3
				when "101100" => color_address <= "0000"; -- Column 4
				when "101101" => color_address <= "0000"; -- Column 5
				when "101110" => color_address <= "0000"; -- Column 6
				when "101111" => color_address <= "0000"; -- Column 7

				-- Row 6
				when "110000" => color_address <= "0000"; -- Column 0
				when "110001" => color_address <= "0000"; -- Column 1
				when "110010" => color_address <= "0000"; -- Column 2
				when "110011" => color_address <= "0000"; -- Column 3
				when "110100" => color_address <= "0000"; -- Column 4
				when "110101" => color_address <= "0000"; -- Column 5
				when "110110" => color_address <= "0000"; -- Column 6
				when "110111" => color_address <= "0000"; -- Column 7

				-- Row 7
				when "111000" => color_address <= "0000"; -- Column 0
				when "111001" => color_address <= "0000"; -- Column 1
				when "111010" => color_address <= "0000"; -- Column 2
				when "111011" => color_address <= "0000"; -- Column 3
				when "111100" => color_address <= "0000"; -- Column 4
				when "111101" => color_address <= "0000"; -- Column 5
				when "111110" => color_address <= "0000"; -- Column 6
				when "111111" => color_address <= "0000"; -- Column 7

				
				when others => color_address <= "0000";
			end case;
		
		-- **Placeholder** --
		when "0001" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "0010" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "0011" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "0100" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "0101" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "0110" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "0111" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1000" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1001" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1010" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1011" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1100" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1101" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1110" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
			end case;

		-- **Placeholder** --
		when "1111" =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
		end case;

		-- Exception --
		when others =>
			case position is
				when "000000" | "000001" | "001000" | "001001" => color_address <= "0000";  	-- Row: 0, 1 & Column: 0,1
				when "010000" | "010001" | "011000" | "011001" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 0,1
				when "100000" | "100001" | "101000" | "101001" => color_address <= "0001";	-- Row: 4, 5 & Column: 0,1
				when "110000" | "110001" | "111000" | "111001" => color_address <= "0001";	-- Row: 6, 7 & Column: 0,1

				when "000010" | "000011" | "001010" | "001011" => color_address <= "0000";  	-- Row: 0, 1 & Column: 2,3
				when "010010" | "010011" | "011010" | "011011" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 2,3
				when "100010" | "100011" | "101010" | "101011" => color_address <= "0001";	-- Row: 4, 5 & Column: 2,3
				when "110010" | "110011" | "111010" | "111011" => color_address <= "0001";	-- Row: 6, 7 & Column: 2,3

				when "000100" | "000101" | "001100" | "001101" => color_address <= "0000";  	-- Row: 0, 1 & Column: 4,5
				when "010100" | "010101" | "011100" | "011101" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 4,5
				when "100100" | "100101" | "101100" | "101101" => color_address <= "0001";	-- Row: 4, 5 & Column: 4,5
				when "110100" | "110101" | "111100" | "111101" => color_address <= "0001";	-- Row: 6, 7 & Column: 4,5

				when "000110" | "000111" | "001110" | "001111" => color_address <= "0000";  	-- Row: 0, 1 & Column: 6,7
				when "010110" | "010111" | "011110" | "011111" => color_address <= "0001"; 	-- Row: 2, 3 & Column: 6,7
				when "100110" | "100111" | "101110" | "101111" => color_address <= "0001";	-- Row: 4, 5 & Column: 6,7
				when "110110" | "110111" | "111110" | "111111" => color_address <= "0001";	-- Row: 6, 7 & Column: 6,7

				
				when others => color_address <= "0000";
		end case;

	end case;
end if;
end process;
end behavioural;
