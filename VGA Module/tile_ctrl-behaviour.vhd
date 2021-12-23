architecture behavioural of tile_ctrl is 
	
	constant black 			: std_logic_vector(4 downto 0) := "00000";
	constant white			: std_logic_vector(4 downto 0) := "00001";
	constant magenta	 	: std_logic_vector(4 downto 0) := "00010";
	constant bg_red			: std_logic_vector(4 downto 0) := "00011";

	constant dark_grey 		: std_logic_vector(4 downto 0) := "00100";
	constant grey			: std_logic_vector(4 downto 0) := "00101";
	constant orange			: std_logic_vector(4 downto 0) := "00110";
	constant yellow 		: std_logic_vector(4 downto 0) := "00111";

	constant denim_blue		: std_logic_vector(4 downto 0) := "01000";
	constant mole_brown		: std_logic_vector(4 downto 0) := "01001";
	constant diamond 		: std_logic_vector(4 downto 0) := "01010";
	constant light_grey		: std_logic_vector(4 downto 0) := "01011";

	constant light_yellow	: std_logic_vector(4 downto 0) := "01100";
	constant light_blue	 	: std_logic_vector(4 downto 0) := "01101";
	constant dark_diamond	: std_logic_vector(4 downto 0) := "01110";
	constant light_orange	: std_logic_vector(4 downto 0) := "01111";

	constant swamp_green	: std_logic_vector(4 downto 0) := "10000";
	constant spirit_blue	: std_logic_vector(4 downto 0) := "10001";
	constant caustic_green	: std_logic_vector(4 downto 0) := "10010";
	constant lavender		: std_logic_vector(4 downto 0) := "10011";
	
	constant ice			: std_logic_vector(4 downto 0) := "10100";
	constant lava			: std_logic_vector(4 downto 0) := "10101";
	constant lightest_grey	: std_logic_vector(4 downto 0) := "10110";
	constant beige			: std_logic_vector(4 downto 0) := "10111";

	constant green			: std_logic_vector(4 downto 0) := "11000";
	constant dark_green		: std_logic_vector(4 downto 0) := "11001";

	signal bg : std_logic_vector(4 downto 0);

begin
	
process (bg_select)
begin
	case bg_select is
		when "000" => 	bg <= black;
		when "001" => 	bg <= bg_red;
		when "010" => 	bg <= swamp_green;
		when "011" => 	bg <= ice;
		when "100" => 	bg <= caustic_green;
		when "101" => 	bg <= lava;
		when "110" => 	bg <= lavender;
		when "111" => 	bg <= magenta;
		when others => 	bg <= magenta;
	end case;
end process;
	
	
process (clk, reset, tile_address, row, column) 
begin 
-- If reset is high, always select magenta -- 
if (reset = '1') then 
	color_address <= magenta; 
else 
	-- Select color address depending on the tile address, and the row and column  
	case tile_address is 
		-- Empty floor tile / Background red
		when "000000" =>
			color_address <= bg;
	
		-- Rocks or Normal Rock
		when "000001" =>
			case row is
				when "000" =>																		-- Row 0
					case column is
						when "000" | "001" | "010" | "011" |"111" 	=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7
						when "100" 									=> color_address <= light_grey; -- Column 4
						when "101" | "110"		 					=> color_address <= grey; 		-- Column 5 and 6
						when others 								=> color_address <= magenta;
					end case;
					
				when "001" =>														-- Row 1
					case column is
						when "000" | "001" | "010" 	=> color_address <= bg; 		-- Column 0, 1 and 2
						when "011" | "100" 			=> color_address <= light_grey; -- Column 3 and 4
						when "101" | "110" 			=> color_address <= grey; 		-- Column 5 and 6
						when "111" 					=> color_address <= dark_grey; 	-- Column 7
						when others 				=> color_address <= magenta;
					end case;
					
				when "010" =>														-- Row 2
					case column is
						when "000" | "001" 			=> color_address <= bg; 		-- Column 0 and 1
						when "010" | "011" | "100" 	=> color_address <= light_grey; -- Column 2, 3 and 4
						when "101" 					=> color_address <= grey; 		-- Column 5
						when "110" | "111" 			=> color_address <= dark_grey; 	-- Column 6 and 7
						when others 				=> color_address <= magenta;
					end case;
					
				when "011" =>														-- Row 3
					case column is
						when "000" 					=> color_address <= bg; 		-- Column 0
						when "001" | "010" | "011" 	=> color_address <= light_grey; -- Column 1, 2 and 3
						when "100" | "101" 			=> color_address <= grey;		-- Column 4 and 5
						when "110" | "111" 			=> color_address <= dark_grey;	-- Column 6 and 7	
						when others					=> color_address <= magenta;			
					end case;	
						
				when "100" =>														-- Row 4
					case column is
						when "000" 					=> color_address <= bg; 		-- Column 0
						when "001" | "010" 			=> color_address <= light_grey; -- Column 1 and 2
						when "011" | "100" | "101" 	=> color_address <= grey; 		-- Column 3, 4 and 5
						when "110" | "111" 			=> color_address <= dark_grey; 	-- Column 6 and 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "101" =>														-- Row 5
					case column is
						when "000"					=> color_address <= bg; 		-- Column 0
						when "001" 					=> color_address <= light_grey; -- Column 1
						when "010" | "011" | "100" 	=> color_address <= grey; 		-- Column 2, 3 and 4
						when "101" | "110" | "111" 	=> color_address <= dark_grey; 	-- Column 5, 6 and 7
						when others					=> color_address <= magenta;			
					end case;
	
				when "110" =>														-- Row 6
					case column is
						when "000"											=> color_address <= bg; 		-- Column 0
						when "001"											=> color_address <= grey; 		-- Column 1
						when "010" | "011" | "100" | "101" | "110" | "111"	=> color_address <= dark_grey; 	-- Column 2, 3, 4, 5, 6 and 7
						when others											=> color_address <= magenta;			
					end case;

				when "111" =>														-- Row 7
					case column is
						when "000" | "001" | "010" | "011" | "111" 	=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7
						when "100" | "101" | "110" 					=> color_address <= dark_grey;	-- Column 4, 5 and 6
						when others									=> color_address <= magenta;			
					end case;
			
				when others => color_address <= magenta;			
			end case;			
		
		-- Gold Ore
		when "000010" =>
			case row is
				when "000" => 														-- Row 0
					case column is
						when "000" | "001" | "010" | "011" | "111" 	=> color_address <= bg; 			-- Column 0, 1, 2, 3 and 7
						when "100" 									=> color_address <= light_grey; 	-- Column 4
						when "101" | "110" 							=> color_address <= grey;		 	-- Column 5 and 6
						when others									=> color_address <= magenta;			
					end case;
			
			
				when "001" =>														-- Row 1
					case column is
						when "000" | "001" | "010" 	=> color_address <= bg; 			-- Column 0, 1 and 2
						when "011" 					=> color_address <= light_grey; 	-- Column 3
						when "100" 					=> color_address <= light_yellow; 	-- Column 4
						when "101" 					=> color_address <= yellow; 		-- Column 5
						when "110" 					=> color_address <= grey; 			-- Column 6
						when "111" 					=> color_address <= dark_grey; 		-- Column 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "010" =>														-- Row 2
					case column is
						when "000" | "001" 			=> color_address <= bg; 		-- Column 0 and 1
						when "010" | "011" | "100" 	=> color_address <= light_grey; -- Column 2, 3 and 4
						when "101" 					=> color_address <= orange; 	-- Column 5
						when "110" | "111" 			=> color_address <= dark_grey; 	-- Column 6 and 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "011" =>														-- Row 3
					case column is
						when "000" 				=> color_address <= bg; 			-- Column 0
						when "001" | "011" 		=> color_address <= light_grey; 	-- Column 1 and 3
						when "010" 				=> color_address <= light_yellow; 	-- Column 2
						when "100" | "101" 		=> color_address <= grey; 			-- Column 4 and 5
						when "110" | "111" 		=> color_address <= dark_grey; 		-- Column 6 and 7
						when others				=> color_address <= magenta;			
					end case;
				
				when "100" => 														-- Row 4
					case column is
						when "000" 				=> color_address <= bg; 			-- Column 0
						when "001" 				=> color_address <= light_grey; 	-- Column 1
						when "010" | "011" 		=> color_address <= yellow; 		-- Column 2 and 3
						when "100" | "101" 		=> color_address <= grey; 			-- Column 4 and 5
						when "110" | "111" 		=> color_address <= dark_grey; 		-- Column 6 and 7
						when others				=> color_address <= magenta;			
					end case;
					
				when "101" => 														-- Row 5
					case column is
						when "000" 				=> color_address <= bg; 			-- Column 0
						when "001" 				=> color_address <= light_grey; 	-- Column 1
						when "010" | "100" 		=> color_address <= grey; 			-- Column 2 and 4
						when "011"				=> color_address <= orange; 		-- Column 3
						when "101" 				=> color_address <= light_yellow; 	-- Column 5
						when "110" 				=> color_address <= yellow; 		-- Column 6
						when "111" 				=> color_address <= dark_grey; 		-- Column 7
						when others				=> color_address <= magenta;			
					end case;
					
				when "110" => 														-- Row 6
					case column is
						when "000" 					=> color_address <= bg; 		-- Column 0
						when "001" 					=> color_address <= grey; 		-- Column 1
						when "010" | "011" | "100" 	=> color_address <= dark_grey; 	-- Column 2, 3 and 4
						when "101" 					=> color_address <= yellow; 	-- Column 5
						when "110" 					=> color_address <= orange; 	-- Column 6
						when "111" 					=> color_address <= dark_grey; 	-- Column 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "111" => 														-- Row 7
					case column is
						when "000" | "001" | "010" | "011" | "111" 	=> color_address <= bg; 		-- Column 0, 1, 2 and 3
						when "100" | "101" | "110" 					=> color_address <= dark_grey; 	-- Column 1
						when others									=> color_address <= magenta;			
					end case;
					
				when others					=> color_address <= magenta;			
			end case;

		-- Boundary
		when "000011" =>
			case row is
				when "000" =>														-- Row 0
					case column is
						when "000" | "011" | "100" | "101" | "110" 	=> color_address <= dark_grey; 	-- Column 0, 3, 4, 5 and 6
						when "001" 									=> color_address <= light_grey; -- Column 1
						when "010" | "111" 							=> color_address <= grey; 		-- Column 2 and 7
						when others									=> color_address <= magenta;			
					end case;
					
				when "001" => 														-- Row 1
					case column is
						when "000" | "001" | "010" | "011" | "101" 	=> color_address <= light_grey; -- Column 0, 1, 2, 3 and 5
						when "100" 									=> color_address <= dark_grey; 	-- Column 4
						when "110" | "111" 							=> color_address <= grey; 		-- Column 6 and 7
						when others									=> color_address <= magenta;			
					end case;
					
				when "010" => 														-- Row 2
					case column is
						when "000" | "001" | "010" | "100" | "101" 	=> color_address <= dark_grey; 	-- Column 0, 1, 2, 4 and 5
						when "011" | "110"							=> color_address <= black;		-- Column 3 and 6
						when "111"									=> color_address <= grey;		-- Column 7
						when others									=> color_address <= magenta;			
					end case;
					
				when "011" =>														-- Row 3
					case column is
						when "000" | "110" 							=> color_address <= light_grey; -- Column 0 and 6
						when "001" | "011" | "100" | "101" | "111" 	=> color_address <= grey; 		-- Column 1, 3, 4, 5 and 7
						when "010" 									=> color_address <= black; 		-- Column 3
						when others									=> color_address <= magenta;			
					end case;
					
				when "100" => 														-- Row 4
					case column is
						when "000" | "001" | "010" | "011" | "100" 	=> color_address <= dark_grey;	-- Column 0, 1, 2, 3 and 4
						when "101" | "110" 							=> color_address <= light_grey;	-- Column 5 and 6
						when "111"									=> color_address <= grey;		-- Column 7
						when others									=> color_address <= magenta;			
					end case;
					
				when "101" =>														-- Row 5
					case column is
						when "000" | "001" | "010" | "110" | "111" => color_address <= dark_grey; 	-- Column 0, 1, 2, 6 and 7
						when "011" | "100" | "101" 					=> color_address <= grey;  		-- Column 3, 4 and 5
						when others									=> color_address <= magenta;			
					end case;

				when "110" =>														-- Row 6
					case column is
						when "000" | "001" | "100" | "110" | "111" 	=> color_address <= light_grey; -- Column 0, 1, 4, 6 and 7
						when "010" 									=> color_address <= dark_grey; 	-- Column 2
						when "011" 									=> color_address <= grey; 		-- Column 3
						when "101" 									=> color_address <= black; 		-- Column 5
						when others									=> color_address <= magenta;			
					end case;
					
				when "111" => 														-- Row 7
					case column is
						when "000" | "001" | "010" | "011" | "100" 	=> color_address <= dark_grey;	-- Column 0, 1, 2, 3 and 4
						when "101" | "110" | "111" 					=> color_address <= grey; 		-- Column 5, 6 and 7
						when others									=> color_address <= magenta;			
					end case;
					
				when others									=> color_address <= magenta;			
			end case;

		-- Diamond Ore
		when "000100" =>
			case row is
				when "000" => 														-- Row 0
					case column is
						when "000" | "001" | "010" | "011" | "111" 	=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7
						when "100" 									=> color_address <= light_grey; -- Column 4
						when "101" | "110" 							=> color_address <= grey; 		-- Column 5 and 6
						when others									=> color_address <= magenta;			
					end case;
					
				when "001" =>														-- Row 1
					case column is
						when "000" | "001" | "010" 	=> color_address <= bg;			-- Column 0, 1 and 2
						when "011" 					=> color_address <= light_grey; -- Column 3
						when "100" | "101" 			=> color_address <= diamond;	-- Column 4 and 5
						when "110" 					=> color_address <= grey; 		-- Column 6
						when "111" 					=> color_address <= dark_grey; 	-- Column 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "010" => 														-- Row 2
					case column is
						when "000" | "001" 			=> color_address <= bg; 			-- Column 0 and 1
						when "010" | "011" | "100" 	=> color_address <= light_grey; 	-- Column 2, 3 and 4
						when "101" 					=> color_address <= dark_diamond; 	-- Column 5
						when "110" | "111" 			=> color_address <= dark_grey; 		-- Column 6 and 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "011" => 														-- Row 3
					case column is
						when "000" 					=> color_address <= bg; 		-- Column 0
						when "001" | "011" 			=> color_address <= light_grey; -- Column 1 and 3
						when "010" 					=> color_address <= diamond; 	-- Column 2
						when "100" | "101" 			=> color_address <= grey;		-- Column 4 and 5
						when "110" | "111" 			=> color_address <= dark_grey; 	-- Column 6 and 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "100" =>														-- Row 4
					case column is
						when "000" 				=> color_address <= bg; 			-- Column 0
						when "001" 				=> color_address <= light_grey; 	-- Column 1
						when "010" 				=> color_address <= diamond; 		-- Column 2
						when "011" 				=> color_address <= dark_diamond; 	-- Column 3
						when "100" | "101" 		=> color_address <= grey; 			-- Column 4 and 5
						when "110" | "111" 		=> color_address <= dark_grey; 		-- Column 6 and 7
						when others					=> color_address <= magenta;			
					end case;
				
				when "101" =>														-- Row 5
					case column is
						when "000" 				=> color_address <= bg; 			-- Column 0
						when "001" 				=> color_address <= light_grey; 	-- Column 1
						when "010" | "100" 		=> color_address <= grey; 			-- Column 2 and 4
						when "011" 				=> color_address <= dark_diamond; 	-- Column 3
						when "101" | "110" 		=> color_address <= diamond; 		-- Column 5 and 6
						when "111" 				=> color_address <= dark_grey;		-- Column 7
						when others				=> color_address <= magenta;			
					end case;
					
				when "110" => 														-- Row 6
					case column is
						when "000" 							=> color_address <= bg; 			-- Column 0
						when "001" 							=> color_address <= grey;			-- Column 1
						when "010" | "011" | "100" | "111" 	=> color_address <= dark_grey; 		-- Column 2, 3, 4 and 7
						when "101" 							=> color_address <= diamond; 		-- Column 5
						when "110" 							=> color_address <= dark_diamond; 	-- Column 6
						when others							=> color_address <= magenta;			
					end case;
					
				when "111" =>														-- Row 7
					case column is
						when "000" | "001" | "010" | "011" | "111" 	=> color_address <= bg; 		-- Column 0, 1, 2 and 3
						when "100" | "101" | "110" 					=> color_address <= dark_grey; 	-- Column 4, 5 and 6
						when others									=> color_address <= magenta;			
					end case;
					
				when others	=> color_address <= magenta;			
			end case;

		-- Ladder
		when "000101" =>
			case row is
				when "000" | "111" =>												-- Row 0 and 7
					case column is
						when "000" | "111" 									=> color_address <= bg; 	-- Column 0 and 7
						when "001" | "010" | "011" | "100" | "101" | "110" 	=> color_address <= black; 	-- Column 1, 2, 3, 4, 5 and 6
						when others											=> color_address <= magenta;			
					end case;
					
				when "001" => 														-- Row 1
					case column is
						when "000" 					=> color_address <= black; 			-- Column 0
						when "001" | "010" | "011" 	=> color_address <= light_orange; 	-- Column 1, 2 and 3
						when "100" | "101" 			=> color_address <= yellow; 		-- Column 4 and 5
						when "110" | "111" 			=> color_address <= orange; 		-- Column 6 and 7
						when others					=> color_address <= magenta;			
					end case;
					
				when "010" | "011" | "100" | "101" =>								-- Row 2, 3, 4 and 5
					case column is
						when "000" | "001" | "011" | "101" | "111"	=> color_address <= black; 			-- Column 0, 1, 3, 5 and 7
						when "010" 									=> color_address <= light_orange; 	-- Column 2
						when "100" 									=> color_address <= yellow; 		-- Column 4
						when "110" 									=> color_address <= orange; 		-- Column 6
						when others									=> color_address <= magenta;			
					end case;
			
				when "110" =>														-- Row 6
					case column is
						when "000" 					=> color_address <= black; 			-- Column 0
						when "001" 					=> color_address <= light_orange; 	-- Column 1
						when "010" | "011" | "100" 	=> color_address <= yellow; 		-- Column 2, 3 and 4
						when "101" | "110" | "111" 	=> color_address <= orange; 		-- Column 5, 6 and 7
						when others					=> color_address <= magenta;			
					end case;
					
				when others	=> color_address <= magenta;			
			end case;
					
		-- R - Light Blue --
		when "000110" =>
			case row is
				when "000" => 														-- Row 0
					case column is
						when "000" | "001" | "101" | "110" 	=> color_address <= spirit_blue; 	-- Column 0, 1, 5 and 6
						when "010" | "011" | "100" | "111" 	=> color_address <= white;			-- Column 2, 3, 4 and 7
						when others							=> color_address <= magenta;			
					end case;
					
				when "001" =>														-- Row 1
					case column is
						when "000" | "101" 									=> color_address <= spirit_blue; 	-- Column 0 and 5
						when "001" | "010" | "011" | "100" | "110" | "111"	=> color_address <= white; 			-- Column 1, 2, 3, 4, 6 and 7
						when others											=> color_address <= magenta;			
					end case;	
					
				when "010" =>														-- Row 2
					case column is
						when "000" | "011" 									=> color_address <= spirit_blue; 	-- Column 0 and 3
						when "001" | "010" | "100" | "101" | "110" | "111"	=> color_address <= white; 			-- Column 1, 2, 4, 5, 6 and 7
						when others											=> color_address <= magenta;			
					end case;	
					
				when "011" => 														-- Row 3
					case column is
						when "000" | "011" | "111" 					=> color_address <= spirit_blue; 	-- Column 0, 3 and 7
						when "001" | "010" | "100" | "101" | "110" 	=> color_address <= white; 			-- Column 1, 2, 4, 5 and 6
						when others									=> color_address <= magenta;			
					end case;
					
				when "100" =>														-- Row 4
					case column is
						when "000" | "011" | "110" | "111" 	=> color_address <= spirit_blue; 	-- Column 0, 3, 6 and 7
						when "001" | "010" | "100" | "101" 	=> color_address <= white; 			-- Column 1, 2, 4 and 5
						when others							=> color_address <= magenta;			
					end case;
					
				when "101" | "110" =>												-- Row 5 and 6
					case column is
						when "000" 													=> color_address <= spirit_blue; 	-- Column 0
						when "001" | "010" | "011" | "100" | "101" | "110" | "111" 	=> color_address <= white; 			-- Column 1, 2, 3, 4, 5, 6 and 7
						when others													=> color_address <= magenta;			
					end case;
	
				when "111" => 														-- Row 7
					color_address <= spirit_blue; 

				when others	=> color_address <= magenta;			
			end case;

		-- O - Light Blue --
		when "000111" =>
			if 	(row = "000" and column = "000") then	color_address <= spirit_blue;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= spirit_blue;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= spirit_blue;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= spirit_blue;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= spirit_blue;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= spirit_blue;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= spirit_blue;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= spirit_blue;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= spirit_blue;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= spirit_blue;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
	
		-- N - Light Blue --
		when "001000" =>	
	if 		(row = "000" and column = "000") then	color_address <= spirit_blue;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= spirit_blue;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= spirit_blue;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= spirit_blue;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= spirit_blue;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= spirit_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= spirit_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= white;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= spirit_blue;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= spirit_blue;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= spirit_blue;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= spirit_blue;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= spirit_blue;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= spirit_blue;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= spirit_blue;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;

	

		-- L - Light Blue--
		when "001001" =>
			if 		(row = "000" and column = "000") then	color_address <= spirit_blue;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= spirit_blue;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= spirit_blue;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= spirit_blue;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= spirit_blue;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= spirit_blue;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= spirit_blue;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= spirit_blue;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= spirit_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= spirit_blue;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= spirit_blue;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= spirit_blue;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= spirit_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= spirit_blue;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= spirit_blue;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= spirit_blue;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= spirit_blue;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= spirit_blue;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= spirit_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= spirit_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= spirit_blue;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= spirit_blue;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= spirit_blue;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= white;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= spirit_blue;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= spirit_blue;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= spirit_blue;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= spirit_blue;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= spirit_blue;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= spirit_blue;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= spirit_blue;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;


		-- Black Tile --
		when "001010" =>
			if 		(row = "000" and column = "000") then	color_address <= black;	-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;	-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;	-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;	-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;	-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;	-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;	-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;	-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;	-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;	-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;	-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;	-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;	-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;	-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;	-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;	-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;	-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;	-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;	-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;	-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;	-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;	-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;	-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;	-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;	-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;	-- row 7, column 7  

			else											color_address <= magenta;
	
			end if; 

		-- C --
		when "001011" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else						                    color_address <= magenta;
	
			end if;

		-- E --
		when "001100" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- G --
		when "001101" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- L --
		when "001110" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- N --
		when "001111" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 0 --
		when "010000" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 1 --
		when "010001" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 2 --
		when "010010" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 3 --
		when "010011" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 4 --
		when "010100" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 5 --
		when "010101" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 6 --
		when "010110" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 7 --
		when "010111" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 8 --
		when "011000" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Number: 9 --
		when "011001" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- O -- 
		when "011010" => 
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- R -- 
		when "011011" => 
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- S -- 
		when "011100" => 
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- V -- 
		when "011101" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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

			else											color_address <= magenta;
	
			end if;

		-- Y --
		when "011110" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= white;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
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
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
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

			else											color_address <= magenta;
	
			end if;
		
		-- A
		when "011111" =>
			if 	    (row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;		-- row 0, column 1
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
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
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
			elsif 	(row = "110" and column = "001") then	color_address <= black;		-- row 6, column 1
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

			else											color_address <= magenta;
	
			end if;
		
		-- M
		when "100000" =>
			if 	    (row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
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
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= white;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
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
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
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

			else						                    color_address <= magenta;
	
			end if;
		
		-- I
		when "100001" =>
			if 	    (row = "000" and column = "000") then	color_address <= spirit_blue;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= spirit_blue;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= spirit_blue;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= spirit_blue;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= spirit_blue;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= spirit_blue;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= spirit_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= white;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= white;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= white;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= white;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= spirit_blue;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= spirit_blue;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= spirit_blue;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= spirit_blue;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= spirit_blue;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= spirit_blue;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
				
		-- DeathAnimation1 (second player frame) (GREY)
		when "100010" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= grey;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= grey;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_yellow;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= grey;			-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= yellow;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= grey;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= grey;			-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_blue;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= grey;			-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= yellow;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= grey;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= grey;			-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_blue;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;			-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= orange;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= yellow;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= grey;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= grey;			-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= light_blue;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= denim_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;			-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= orange;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= grey;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= grey;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= grey;			-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= denim_blue;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= grey;			-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= orange;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= light_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= denim_blue;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= grey;			-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= grey;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= grey;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;			-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
				
		-- DeathAnimation2 (third player frame) (LIGHTEST GREY)
		when "100011" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= lightest_grey;	-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= lightest_grey;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_yellow;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= lightest_grey;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= yellow;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= lightest_grey;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= lightest_grey;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_blue;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= lightest_grey;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= yellow;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= lightest_grey;	-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= lightest_grey;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_blue;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;			-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= orange;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= yellow;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= lightest_grey;	-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= lightest_grey;	-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= light_blue;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= denim_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;			-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= orange;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= lightest_grey;	-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= lightest_grey;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= lightest_grey;	-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= denim_blue;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= lightest_grey;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= orange;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= light_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= denim_blue;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= lightest_grey;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= lightest_grey;	-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= lightest_grey;	-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;			-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
				
		-- DeathAnimation3 (third player frame) (ICE)
		when "100100" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= ice;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= ice;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_yellow;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= ice;			-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= yellow;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= ice;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= ice;			-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_blue;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= ice;			-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= yellow;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= ice;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= ice;			-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_blue;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;			-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= orange;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= yellow;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= ice;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= ice;			-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= light_blue;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= denim_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;			-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= orange;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= ice;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= ice;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= ice;			-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= denim_blue;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= ice;			-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= orange;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= light_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= denim_blue;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= ice;			-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= ice;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= ice;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;			-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
				
		-- DeathAnimation4 (poof1)
		when "100101" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= ice;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= ice;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_yellow;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= ice;			-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;			-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= light_yellow;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;			-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;			-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;			-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= orange;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= yellow;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= light_yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;			-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;			-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= denim_blue;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= orange;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= yellow;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= ice;			-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;			-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= light_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= denim_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= yellow;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;			-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;			-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= orange;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= light_blue;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= ice;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= ice;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;			-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
				
		-- DeathAnimation5 (poof2)
		when "100110" =>
			if 		(row = "000" and column = "000") then	color_address <= ice;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= light_blue;	-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= ice;			-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;			-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_yellow;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;			-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;			-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_yellow;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;			-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= ice;			-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= yellow;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_yellow;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= light_blue;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;			-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= yellow;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= yellow;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= light_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= light_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= orange;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= yellow;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= light_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= ice;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= orange;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= denim_blue;	-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= denim_blue;	-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
		-- DeathAnimation6 (poof3)
		when "100111" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= ice;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= light_blue;	-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;			-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;			-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_yellow;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;			-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_diamond;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= dark_diamond;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_yellow;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_diamond;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= dark_diamond;	-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= diamond;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= diamond;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= yellow;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_yellow;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= light_blue;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_diamond;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= diamond;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= yellow;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= yellow;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= light_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= light_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= ice;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= orange;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= yellow;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= light_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= ice;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= orange;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= denim_blue;	-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= denim_blue;	-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
		-- DeathAnimation7 (poof4)
		when "101000" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= light_blue;	-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= ice;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;			-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;			-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_yellow;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= dark_diamond;	-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= diamond;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_yellow;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_diamond;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;			-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= diamond;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= yellow;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_yellow;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= light_blue;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;			-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= yellow;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= yellow;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= light_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= light_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= orange;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= yellow;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= light_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= ice;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= orange;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= denim_blue;	-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= denim_blue;	-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;

		-- DeathAnimation7 (soul1)
		when "101001" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= ice;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;			-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;			-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= dark_diamond;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_diamond;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;			-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;			-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;			-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= dark_diamond;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black;			-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= dark_diamond;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= dark_diamond;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;			-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;			-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_diamond;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= dark_diamond;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= dark_diamond;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= dark_diamond;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;			-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= ice;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= dark_diamond;	-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;			-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_diamond;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= dark_diamond;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;			-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= dark_diamond;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= dark_diamond;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;			-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= ice;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;			-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;			-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;			-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= ice;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;			-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
		
		-- DeathAnimation8 (soul2)
		when "101010" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= dark_diamond;	-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= dark_diamond;	-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_diamond;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= dark_diamond;	-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= ice;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_diamond;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= dark_diamond;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_diamond;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= dark_diamond;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;			-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;			-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= dark_diamond;	-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_diamond;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= dark_diamond;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= dark_diamond;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= dark_diamond;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= dark_diamond;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= dark_diamond;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;			-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_diamond;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;			-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= dark_diamond;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_diamond;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= dark_diamond;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= diamond;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;			-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_diamond;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= dark_diamond;	-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= dark_diamond;	-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= diamond;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= dark_diamond;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= diamond;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;			-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;			-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= diamond;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= diamond;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;			-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= ice;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= diamond;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;			-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= ice;			-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= diamond;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= black;			-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;

		-- DeathAnimation9 (poof5)
		when "101011" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;			-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;			-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;			-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= light_blue;	-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= ice;			-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;			-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;			-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_yellow;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;			-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;			-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;			-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_yellow;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;			-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;			-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= ice;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= yellow;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_yellow;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= light_blue;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;			-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;			-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= yellow;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= yellow;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= light_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= light_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= orange;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= yellow;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= light_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= ice;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= orange;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= ice;			-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= denim_blue;	-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= denim_blue;	-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
	-- DeathAnimation8 (soul3)
		when "101100" =>
			if 		(row = "000" and column = "000") then	color_address <= black;			-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= black;			-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= dark_diamond;	-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_diamond;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= dark_diamond;	-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= dark_diamond;	-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= black;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= black;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= dark_diamond;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;			-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;			-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_diamond;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= dark_diamond;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_diamond;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= black;			-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;			-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_diamond;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= dark_diamond;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= dark_diamond;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= dark_diamond;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= dark_diamond;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= dark_diamond;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= dark_diamond;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;			-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= dark_diamond;	-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;			-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_diamond;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= dark_diamond;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= dark_diamond;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= dark_diamond;	-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;			-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;			-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= dark_diamond;	-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= dark_diamond;	-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= dark_diamond;	-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= diamond;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_diamond;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= diamond;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;			-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;			-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;			-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;			-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;			-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;			-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= diamond;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= diamond;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= black;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= ice;			-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;			-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;			-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;			-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= diamond;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= diamond;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= black;			-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= black;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;			-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;			-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= diamond;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= black;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= ice;			-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
			-- footsteps1
		when "101101" =>
			if 	(row = "000" and column = "000") then	color_address <= bg;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= bg;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= bg;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= bg;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= bg;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= bg;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= bg;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= bg;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= bg;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= bg;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= bg;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= bg;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= beige;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= beige;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= bg;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= bg;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= bg;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= bg;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= bg;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= bg;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= beige;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= beige; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= bg;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= bg;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= bg;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= bg;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= bg;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= bg;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= bg;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= bg;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= bg;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= bg;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= bg;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= bg;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= bg;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= bg;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= bg;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= bg;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= bg;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= bg;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= bg;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= bg;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= bg;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= bg;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= bg;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= beige;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= beige;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= bg;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= bg;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= bg;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= bg;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= bg;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= bg;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= beige;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= beige;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= bg;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= bg;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= bg;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= bg;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= bg;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= bg;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= bg;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= bg;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= bg;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
			
		 	-- Sky
		when "101110" =>
			if 	(row = "000" and column = "000") then	color_address <= spirit_blue;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= spirit_blue;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= spirit_blue;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= spirit_blue;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= spirit_blue;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= spirit_blue;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= spirit_blue;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= spirit_blue;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= spirit_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= spirit_blue;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= spirit_blue;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= spirit_blue;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= spirit_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= spirit_blue;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= spirit_blue;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= spirit_blue;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= spirit_blue;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= spirit_blue;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= spirit_blue;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= spirit_blue; 		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= spirit_blue;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= spirit_blue;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= spirit_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= spirit_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= spirit_blue;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= spirit_blue;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= spirit_blue;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= spirit_blue;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= spirit_blue;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= spirit_blue;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= spirit_blue;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= spirit_blue;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= spirit_blue;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= spirit_blue;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= spirit_blue;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= spirit_blue;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= spirit_blue;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= spirit_blue;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= spirit_blue;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= spirit_blue;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= spirit_blue;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= spirit_blue;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= spirit_blue;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= spirit_blue;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= spirit_blue;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= spirit_blue;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= spirit_blue;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= spirit_blue;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= spirit_blue;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= spirit_blue;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
-- Grass
when "101111" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= green;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= dark_green;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_yellow;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= green;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_green;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= green;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_green;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= dark_green;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= dark_green; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= green;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= dark_green;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_green;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= green;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= green;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= light_yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_green;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= green;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= magenta;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= green;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= green;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_green;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= green;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= green;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= green;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= magenta;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_green;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= magenta;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= dark_green;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= green;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= lava;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= dark_green;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= green;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= dark_green;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= magenta;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= dark_green;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= lava;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= dark_green;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= lava;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= green;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= green;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= dark_green;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;

-- Start 1_1
when "110000" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= mole_brown;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= green;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= dark_green;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_yellow;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_yellow;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= green;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_green;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= dark_green;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_yellow; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= mole_brown;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_green;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= green;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= green;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= light_yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= yellow;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= yellow;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= mole_brown;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= green;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_green;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= green;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= green;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= orange;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= yellow;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= mole_brown;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= dark_green;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= green;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= lava;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= dark_green;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= orange;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= orange;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= mole_brown;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= mole_brown;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= lava;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= dark_green;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= lava;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= green;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= orange;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= light_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= light_blue;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= mole_brown;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
	
				
	-- Start 1_2
		when "110001" =>
			if 	(row = "000" and column = "000") then	color_address <= mole_brown;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= light_blue;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= mole_brown;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= green;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_green;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= mole_brown;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_blue;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_blue;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= mole_brown;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= dark_green; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= green;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= dark_green;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= mole_brown;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= light_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= light_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= light_yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_green;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= green;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= magenta;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= green;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= mole_brown;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= light_blue;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= denim_blue;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= green;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= green;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= magenta;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_green;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= magenta;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= mole_brown;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= denim_blue;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= denim_blue;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= green;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= dark_green;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= magenta;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= dark_green;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= denim_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= denim_blue;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= denim_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= mole_brown;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= green;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= green;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= dark_green;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= mole_brown;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;

		-- Start 2_2
		when "110010" =>
			if 	(row = "000" and column = "000") then	color_address <= mole_brown;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= light_blue;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= mole_brown;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_green;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= mole_brown;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_blue;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_blue;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= mole_brown;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= dark_green; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= green;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= dark_green;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= mole_brown;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= light_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= light_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_green;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= green;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= magenta;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= green;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= mole_brown;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= light_blue;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= denim_blue;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= magenta;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_green;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= magenta;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= mole_brown;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= denim_blue;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= denim_blue;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= green;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= magenta;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= dark_green;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= denim_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= denim_blue;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= denim_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= mole_brown;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= green;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= green;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= dark_green;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= mole_brown;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
	
		-- Start 3_2
		when "110011" =>
			if 	(row = "000" and column = "000") then	color_address <= mole_brown;	-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= light_blue;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= mole_brown;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_green;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= mole_brown;	-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_blue;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_blue;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= mole_brown;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= green;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= dark_green;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= mole_brown;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= light_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= light_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= green;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= magenta;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= green;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= mole_brown;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= light_blue;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= denim_blue;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_green;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= magenta;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= mole_brown;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= denim_blue;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= denim_blue;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= dark_green;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= dark_green;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= denim_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= denim_blue;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= denim_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= mole_brown;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= green;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= mole_brown;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;			
	
		-- Start 4_1
		when "110100" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= mole_brown;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= mole_brown;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= green;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= dark_green;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_yellow;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= green;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_green;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= light_yellow;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= mole_brown; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= mole_brown;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_blue;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_green;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= green;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= yellow;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= mole_brown;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= mole_brown;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= light_blue;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= green;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_green;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= orange;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= yellow;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= mole_brown;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= mole_brown;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= light_blue;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= dark_green;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= green;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= orange;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= orange;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= mole_brown;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= mole_brown;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= mole_brown;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= denim_blue;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= lava;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= dark_green;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= orange;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= light_blue;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= light_blue;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= mole_brown;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= mole_brown;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;	
	
-- Start 4_2
when "110101" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= black;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= light_blue;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= mole_brown;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= dark_green;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_green;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= light_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= mole_brown;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= green;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= light_blue;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= green;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= denim_blue;	-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= dark_green;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= magenta;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= denim_blue;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= mole_brown;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= dark_green;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= denim_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= mole_brown;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= green;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= black;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;			

		-- Start 5_1
		when "110110" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= mole_brown;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= mole_brown;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_yellow;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= mole_brown;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= yellow;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= mole_brown;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= mole_brown;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_blue; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= mole_brown;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= yellow;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= mole_brown;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= mole_brown;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_blue;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= green;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= orange;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= yellow;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= mole_brown;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= mole_brown;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= light_blue;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= denim_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= dark_green;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= orange;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= mole_brown;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= mole_brown;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= denim_blue;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= mole_brown;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= orange;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= light_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= denim_blue;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= mole_brown;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= mole_brown;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= mole_brown;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
	-- Start 5_2
when "110111" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= black;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= black;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= black;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= black;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= black;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= black;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
	
-- Start 6_1
when "111000" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= mole_brown;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= mole_brown;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= green;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= dark_green;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_yellow;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_yellow;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_blue;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= green;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_green;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= yellow;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= mole_brown;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= mole_brown;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_green;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= green;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= green;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= yellow;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= mole_brown;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= mole_brown;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= green;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_green;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= green;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= orange;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= yellow;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= mole_brown;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= mole_brown;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= dark_green;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= green;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= lava;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= orange;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= orange;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= mole_brown;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= mole_brown;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= mole_brown;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= lava;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= dark_green;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= lava;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= orange;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= light_blue;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= light_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= denim_blue;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= mole_brown;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= mole_brown;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
			
-- Start 6_2
when "111001" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= light_blue;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= mole_brown;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= light_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_blue;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= mole_brown;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= light_blue;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= light_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= black;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= light_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= denim_blue;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= denim_blue;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= denim_blue;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= mole_brown;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= black;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= denim_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= denim_blue;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= mole_brown;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
-- Start 7_1
when "111010" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= green;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= dark_green;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= green;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= green;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= green;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= dark_green;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_yellow;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= dark_green;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= green;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= dark_green;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= light_yellow;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= green;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= dark_green;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= dark_green;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= light_yellow;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= dark_green; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= yellow;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= light_yellow;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= dark_green;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= green;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= green;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= light_yellow;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= dark_green;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= green;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= yellow;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= yellow;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= green;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= dark_green;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= green;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= green;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= green;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= magenta;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= orange;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= yellow;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= dark_green;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= green;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= lava;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= dark_green;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= green;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= dark_green;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= orange;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= orange;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= lava;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= dark_green;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= lava;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= green;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= green;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= dark_green;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= orange;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= lava;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= green;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= green;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= dark_green;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
	
		-- Start 7_2
		when "111011" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= mole_brown;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= mole_brown;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= light_blue;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_blue;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= black;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= mole_brown;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= mole_brown;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= light_blue;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= black;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= mole_brown;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= black;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= mole_brown;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= light_blue;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= mole_brown;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= mole_brown;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= light_blue;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= black;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= mole_brown;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= mole_brown;	-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= mole_brown;	-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= denim_blue;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= black;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= light_blue;	-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= light_blue;	-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= denim_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= black;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= mole_brown;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= mole_brown;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
-- Start 8_2
when "111100" =>
			if 	(row = "000" and column = "000") then	color_address <= green;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= green;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= black;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= black;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= black;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= black;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= green;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= green;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= dark_green;	-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= black;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_yellow;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= black;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= black;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= black;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= green;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= black;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= light_yellow;	-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= black;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= mole_brown;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= black; 	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= black;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= black;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= black;	-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= yellow;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= mole_brown;	-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= black;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= black;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= black;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= black;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= black;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= orange;	-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= yellow;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= black;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= mole_brown;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= black;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= black;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= black;	-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= black;	-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= orange;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= mole_brown;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= black;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= black;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= black;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= green;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= black;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= orange;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= black;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= black;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= black;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= green;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= green;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= green;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= black;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= black;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= black;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= black;	-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= green;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= green;		-- row 7, column 7  

			else											color_address <= magenta;
				
			end if;
				
		--Continue until address "111111"
			
				
				-- E Light Blue--
		when "111101" =>
			if 		(row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= spirit_blue;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= spirit_blue;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= spirit_blue;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= spirit_blue;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= spirit_blue;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= spirit_blue;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= white;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= spirit_blue;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= spirit_blue;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= white;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= white;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= white;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= white;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= spirit_blue;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= spirit_blue;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= white;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= white;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= white;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= spirit_blue;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= spirit_blue;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= white;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= white;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;
				
	-- M Light Blue --
		when "111110"=>
				if 	    (row = "000" and column = "000") then	color_address <= black;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") then	color_address <= white;		-- row 0, column 1
			elsif 	(row = "000" and column = "010") then	color_address <= white;		-- row 0, column 2
			elsif	(row = "000" and column = "011") then	color_address <= white;		-- row 0, column 3
			elsif 	(row = "000" and column = "100") then	color_address <= white;		-- row 0, column 4
			elsif 	(row = "000" and column = "101") then	color_address <= white;		-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= white;		-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= white;		-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= spirit_blue;		-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= white;		-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= white;		-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= white;		-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= white;		-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= white;		-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= white;		-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= white;		-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= spirit_blue;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= spirit_blue;		-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= white;		-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= white;		-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= white;		-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= spirit_blue;		-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= spirit_blue;		-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= spirit_blue;		-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= spirit_blue;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= spirit_blue;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= spirit_blue;		-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= white;		-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= white;		-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= white;		-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= spirit_blue;		-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= spirit_blue;		-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= spirit_blue;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= spirit_blue;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= white;		-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= white;		-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= white;		-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= spirit_blue;		-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= spirit_blue;		-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= spirit_blue;		-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= spirit_blue;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= white;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= white;		-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= white;		-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= white;		-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= white;		-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= white;		-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= white;		-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= spirit_blue;		-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= white;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= white;		-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= white;		-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= white;		-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= white;		-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= white;		-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= white;		-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= spirit_blue;		-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= spirit_blue;		-- row 7, column 1
			elsif 	(row = "111" and column = "010") then	color_address <= spirit_blue;		-- row 7, column 2
			elsif	(row = "111" and column = "011") then	color_address <= spirit_blue;		-- row 7, column 3
			elsif 	(row = "111" and column = "100") then	color_address <= spirit_blue;		-- row 7, column 4
			elsif 	(row = "111" and column = "101") then	color_address <= spirit_blue;		-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= spirit_blue;		-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= spirit_blue;		-- row 7, column 7  

			else						                    color_address <= magenta;
	
			end if;
				
		-- Player -- 
		when "111111" => 
			if 		(row = "000" and column = "000") 		then	color_address <= bg;		-- row 0, column 0
			elsif 	(row = "000" and column = "001") 	then	color_address <= bg;	-- row 0, column 1
			elsif 	(row = "000" and column = "010") 	then							-- row 0, column 2 --p1
				if 		(timer1(5)='1') then 	color_address <= mole_brown;
				elsif 	(timer1(5)='0') then 	color_address <= bg;
				else 							color_address <= magenta;
				end if;
				
			elsif	(row = "000" and column = "011") then	color_address <= mole_brown;	-- row 0, column 3
			elsif 	(row = "000" and column = "100") then									-- row 0, column 4 --p2
				if 		(timer1(5)='1') then 	color_address <= bg;
				elsif 	(timer1(5)='0') then 	color_address <= mole_brown;
				else 							color_address <= magenta;
				end if;				
				
			elsif 	(row = "000" and column = "101") then	color_address <= bg;			-- row 0, column 5
			elsif	(row = "000" and column = "110") then	color_address <= bg;			-- row 0, column 6
			elsif 	(row = "000" and column = "111") then	color_address <= bg;			-- row 0, column 7

			elsif	(row = "001" and column = "000") then	color_address <= bg;			-- row 1, column 0
			elsif 	(row = "001" and column = "001") then	color_address <= light_yellow;	-- row 1, column 1
			elsif 	(row = "001" and column = "010") then	color_address <= light_blue;	-- row 1, column 2
			elsif	(row = "001" and column = "011") then	color_address <= light_blue;	-- row 1, column 3
			elsif 	(row = "001" and column = "100") then	color_address <= light_blue;	-- row 1, column 4
			elsif 	(row = "001" and column = "101") then	color_address <= light_blue;	-- row 1, column 5
			elsif	(row = "001" and column = "110") then	color_address <= light_blue;	-- row 1, column 6
			elsif 	(row = "001" and column = "111") then	color_address <= mole_brown;	-- row 1, column 7 
			
			elsif	(row = "010" and column = "000") then	color_address <= yellow;		-- row 2, column 0
			elsif 	(row = "010" and column = "001") then	color_address <= light_yellow;	-- row 2, column 1
			elsif 	(row = "010" and column = "010") then	color_address <= black;			-- row 2, column 2
			elsif	(row = "010" and column = "011") then	color_address <= mole_brown;	-- row 2, column 3
			elsif 	(row = "010" and column = "100") then	color_address <= mole_brown;	-- row 2, column 4
			elsif 	(row = "010" and column = "101") then	color_address <= light_blue;	-- row 2, column 5
			elsif	(row = "010" and column = "110") then	color_address <= light_blue;	-- row 2, column 6
			elsif 	(row = "010" and column = "111") then	color_address <= mole_brown;	-- row 2, column 7

			elsif	(row = "011" and column = "000") then	color_address <= yellow;		-- row 3, column 0
			elsif 	(row = "011" and column = "001") then	color_address <= yellow;		-- row 3, column 1
			elsif 	(row = "011" and column = "010") then	color_address <= mole_brown;	-- row 3, column 2
			elsif	(row = "011" and column = "011") then	color_address <= black;			-- row 3, column 3
			elsif 	(row = "011" and column = "100") then	color_address <= mole_brown;	-- row 3, column 4
			elsif 	(row = "011" and column = "101") then	color_address <= light_blue;	-- row 3, column 5
			elsif	(row = "011" and column = "110") then	color_address <= light_blue;	-- row 3, column 6
			elsif 	(row = "011" and column = "111") then	color_address <= bg;			-- row 3, column 7

			elsif	(row = "100" and column = "000") then	color_address <= orange;		-- row 4, column 0
			elsif 	(row = "100" and column = "001") then	color_address <= yellow;		-- row 4, column 1
			elsif 	(row = "100" and column = "010") then	color_address <= black;			-- row 4, column 2
			elsif	(row = "100" and column = "011") then	color_address <= mole_brown;	-- row 4, column 3
			elsif 	(row = "100" and column = "100") then	color_address <= mole_brown;	-- row 4, column 4
			elsif 	(row = "100" and column = "101") then	color_address <= light_blue;	-- row 4, column 5
			elsif	(row = "100" and column = "110") then	color_address <= denim_blue;	-- row 4, column 6
			elsif 	(row = "100" and column = "111") then	color_address <= bg;			-- row 4, column 7
	
			elsif	(row = "101" and column = "000") then	color_address <= orange;		-- row 5, column 0
			elsif 	(row = "101" and column = "001") then	color_address <= orange;		-- row 5, column 1
			elsif 	(row = "101" and column = "010") then	color_address <= mole_brown;	-- row 5, column 2
			elsif	(row = "101" and column = "011") then	color_address <= mole_brown;	-- row 5, column 3
			elsif 	(row = "101" and column = "100") then	color_address <= mole_brown;	-- row 5, column 4
			elsif 	(row = "101" and column = "101") then	color_address <= denim_blue;	-- row 5, column 5
			elsif	(row = "101" and column = "110") then	color_address <= denim_blue;	-- row 5, column 6
			elsif 	(row = "101" and column = "111") then	color_address <= mole_brown;	-- row 5, column 7 

			elsif	(row = "110" and column = "000") then	color_address <= bg;			-- row 6, column 0
			elsif 	(row = "110" and column = "001") then	color_address <= orange;		-- row 6, column 1
			elsif 	(row = "110" and column = "010") then	color_address <= light_blue;	-- row 6, column 2
			elsif	(row = "110" and column = "011") then	color_address <= light_blue;	-- row 6, column 3
			elsif 	(row = "110" and column = "100") then	color_address <= denim_blue;	-- row 6, column 4
			elsif 	(row = "110" and column = "101") then	color_address <= denim_blue;	-- row 6, column 5
			elsif	(row = "110" and column = "110") then	color_address <= denim_blue;	-- row 6, column 6
			elsif 	(row = "110" and column = "111") then	color_address <= mole_brown;	-- row 6, column 7   

			elsif	(row = "111" and column = "000") then	color_address <= bg;			-- row 7, column 0
			elsif 	(row = "111" and column = "001") then	color_address <= bg;			-- row 7, column 1
			elsif 	(row = "111" and column = "010") then									-- row 7, column 2 --p2
				if 		(timer1(5)='1') then 	color_address <= bg;
				elsif 	(timer1(5)='0') then 	color_address <= mole_brown;
				else 							color_address <= magenta;
				end if;		
					
			elsif	(row = "111" and column = "011") then	color_address <= mole_brown;	-- row 7, column 3
			elsif 	(row = "111" and column = "100") then									-- row 7, column 4 --p1
				if 		(timer1(5)='1') then 	color_address <= mole_brown;
				elsif 	(timer1(5)='0') then 	color_address <= bg;
				else 							color_address <= magenta;
				end if;
					
			elsif 	(row = "111" and column = "101") then	color_address <= bg;			-- row 7, column 5
			elsif	(row = "111" and column = "110") then	color_address <= bg;			-- row 7, column 6
			elsif 	(row = "111" and column = "111") then	color_address <= bg;			-- row 7, column 7  

			else											color_address <= magenta;
	
			end if;	
					
		when others => 
															color_address <= magenta; 
	end case; 
end if;
end process; 
end behavioural;


