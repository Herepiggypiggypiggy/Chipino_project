library IEEE;
use IEEE.std_logic_1164.all;  
 
architecture behavioural of tile is 
 
	signal position : std_logic_vector(9 downto 0); 
 
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
	-- Player tile is a native 24 x 24 texture and is upscaled to 24 x 24  
	-- All other tiles are native 4 x 4 textures, and are also upscaled to 24 x 24  
	case tile_address is 
		-- Player -- 
		when "0000" => 
			-- Subject to change --
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if;
		 
		-- **Placeholder** -- 
		when "0001" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0110";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1010";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0000";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1101";

			else																     color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "0010" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0101";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0110";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1010";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0110";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "0011" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0011";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0001";

			else																     color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "0100" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1111";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0000";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1011";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0001";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "0101" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1100";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0010";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "0110" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0110";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0101";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1010";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0111";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "0111" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "1000" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "1001" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1010" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1011" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1100" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1101" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if;
 
		-- **Placeholder** -- 
		when "1110" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if; 
 
		-- **Placeholder** -- 
		when "1111" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0100";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1000";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1100";

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "1110";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1111";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0110";

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0010";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "0001";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1100";
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "1110";

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= "0011";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= "1001";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= "1101";
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= "0101";

			else																     color_address <= "0000";
	
			end if;		 
 
		when others => 
			color_address <= "0000"; 
	end case; 
end if; 
end process; 
end behavioural;

