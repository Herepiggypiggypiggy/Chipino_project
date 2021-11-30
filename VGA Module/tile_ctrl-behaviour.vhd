architecture behavioural of tile_ctrl is 
	
	constant black 			: std_logic_vector(3 downto 0) := "0000";
	constant white			: std_logic_vector(3 downto 0) := "0001";
	--constant -- **Placeholder** -- 	: std_logic_vector(3 downto 0) := "0010";
	constant bg_red			: std_logic_vector(3 downto 0) := "0011";
	constant dark_grey 		: std_logic_vector(3 downto 0) := "0100";

	constant light_grey		: std_logic_vector(3 downto 0) := "0101";
	constant orange			: std_logic_vector(3 downto 0) := "0110";
	constant yellow 		: std_logic_vector(3 downto 0) := "0111";
	constant denim_blue		: std_logic_vector(3 downto 0) := "1000";

	constant mole_brown		: std_logic_vector(3 downto 0) := "1001";
	constant diamond 		: std_logic_vector(3 downto 0) := "1010";
	--constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";
	--constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";

	--constant -- **Placeholder** -- 	: std_logic_vector(3 downto 0) := "0000";
	--constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";
	--constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";
	--constant -- **Placeholder** --	: std_logic_vector(3 downto 0) := "0000";

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
			if 	(row = "000" and column = "000") then	color_address <= bg_red;	-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= bg_red;	-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= mole_brown;	-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= mole_brown;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= bg_red;	-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= bg_red;	-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= bg_red;	-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= bg_red;	-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= bg_red;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= yellow;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= denim_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= denim_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= denim_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= denim_blue;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= denim_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= denim_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= yellow;	-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= mole_brown;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= mole_brown;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= denim_blue;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= denim_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= denim_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= orange;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;	-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= mole_brown;	-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= mole_brown;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= denim_blue;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= denim_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= bg_red;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= orange;	-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= yellow;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= mole_brown;	-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= mole_brown;	-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= denim_blue;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= denim_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= denim_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= orange;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;	-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= mole_brown;	-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= mole_brown;	-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= denim_blue;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= bg_red;	-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= orange;	-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= denim_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= denim_blue;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= denim_blue;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= bg_red;	-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= bg_red;	-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= mole_brown;	-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= mole_brown;	-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= bg_red;	-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= bg_red;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= bg_red;	-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= bg_red;	-- row 7, column 7  

			else						color_address <= white;
	
			end if;
		 
		-- Background Red -- 
		when "00001" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= bg_red;	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= bg_red;	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= bg_red;	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= bg_red;	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= bg_red;	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= bg_red;	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= bg_red;	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= bg_red;	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 18 - 23, column 18 - 23

			else																     	color_address <= white;
	
			end if;
 
		-- Normal Rock -- 
		when "00010" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= dark_grey;	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= light_grey;	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= dark_grey;	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= light_grey;	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= light_grey;	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= light_grey;	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 18 - 23, column 18 - 23

			else																     	color_address <= white;
	
			end if;
 
		-- Gold Ore -- 
		when "00011" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= yellow;	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= yellow;	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= dark_grey;	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= light_grey;	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= light_grey;	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= yellow;	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 18 - 23, column 18 - 23

			else																     	color_address <= white;
	
			end if;
 
		-- Diamond Ore -- 
		when "00100" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= diamond;	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= diamond;	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= dark_grey;	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= light_grey;	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= light_grey;	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= light_grey;	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= diamond;	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= bg_red;	-- row 18 - 23, column 18 - 23

			else																     	color_address <= white;
	
			end if; 
 
		-- Ladder -- 
		when "00101" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= orange;	-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= orange;	-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= orange;	-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= orange;	-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= black;		-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= orange;	-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= black;		-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= bg_red;	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= black;		-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= orange;	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= black;	 	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= orange;	-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= orange;	-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= orange;	-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= orange;	-- row 18 - 23, column 18 - 23

			else																     	color_address <= white;
	
			end if; 
 
		-- Boundary -- 
		when "00110" => 
			if 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= black;		-- row 0 - 5, column 0 - 5
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= black;		-- row 0 - 5, column 6 - 11
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= black;		-- row 0 - 5, column 12 - 17
			elsif 	(row(4 downto 2) = "000" or row(4 downto 1) = "0010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= black;		-- row 0 - 5, column 18 - 23

			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= dark_grey;	-- row 6 - 11, column 0 - 5
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= dark_grey;	-- row 6 - 11, column 6 - 11
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= black;		-- row 6 - 11, column 12 - 17
			elsif 	(row(4 downto 1) = "0011" or row(4 downto 2) = "010") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 6 - 11, column 18 - 23

			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= dark_grey;	-- row 12 - 17, column 0 - 5
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= black;		-- row 12 - 17, column 6 - 11
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= dark_grey;	-- row 12 - 17, column 12 - 17
			elsif 	(row(4 downto 2) = "011" or row(4 downto 1) = "1000") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= dark_grey;	-- row 12 - 17, column 18 - 23

			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "000" or column(4 downto 1) = "0010") then 	color_address <= black;		-- row 18 - 23, column 0 - 5
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "0011" or column(4 downto 2) = "010") then 	color_address <= black;		-- row 18 - 23, column 6 - 11
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 2) = "011" or column(4 downto 1) = "1000") then 	color_address <= black;		-- row 18 - 23, column 12 - 17
			elsif 	(row(4 downto 1) = "1001" or row(4 downto 2) = "101") and (column(4 downto 1) = "1001" or column(4 downto 2) = "101") then 	color_address <= black;		-- row 18 - 23, column 18 - 23

			else																     	color_address <= "0000";
	
			end if; 
 
		-- V -- 
		when "00111" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= white;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- L -- 
		when "01000" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= white;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if; 

		-- G -- 
		when "01001" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- R -- 
		when "01010" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= white;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if; 
 
		-- E -- 
		when "01011" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;
 
		-- N -- 
		when "01100" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= white;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;
 
		-- O -- 
		when "01101" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;
 
		-- C -- 
		when "01110" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;
 
		-- S -- 
		when "01111" => 
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 0 --
		when "10000" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 1 --
		when "10001" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= white;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 2 --
		when "10010" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 3 --
		when "10011" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 4 --
		when "10100" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 5 --
		when "10101" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 6 --
		when "10110" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 7 --
		when "10111" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 8 --
		when "11000" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;

		-- Number: 9 --
		when "11001" =>
			if 	(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;		-- row 7, column 7  

			else						color_address <= white;
	
			end if;
 
		when others => 
			color_address <= "0000"; 
	end case; 
end if; 
end process; 
end behavioural;
