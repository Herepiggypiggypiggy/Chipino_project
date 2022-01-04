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
	
	
process (clk, reset, tile_address, row, column, bg, timer1) 
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
				when "000" =>	-- Row 0
					case column is 
						when "100" 			=> color_address <= light_grey; -- Column 4
						when "101" | "110"	=> color_address <= grey; 		-- Column 5 and 6
						when others 		=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is 
						when "011" | "100" 	=> color_address <= light_grey; -- Column 3 and 4
						when "101" | "110" 	=> color_address <= grey; 		-- Column 5 and 6
						when "111" 			=> color_address <= dark_grey; 	-- Column 7
						when others 		=> color_address <= bg; 		-- Column 0, 1 and 2
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "001" 	=> color_address <= bg; 		-- Column 0 and 1
						when "101" 			=> color_address <= grey; 		-- Column 5
						when "110" | "111"	=> color_address <= dark_grey; 	-- Column 6 and 7
						when others 		=> color_address <= light_grey; -- Column 2, 3 and 4
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" 			=> color_address <= bg; 		-- Column 0 
						when "100" | "101" 	=> color_address <= grey;		-- Column 4 and 5
						when "110" | "111" 	=> color_address <= dark_grey;	-- Column 6 and 7	
						when others			=> color_address <= light_grey; -- Column 1, 2 and 3			
					end case;	
						
				when "100" =>	-- Row 4
					case column is
						when "000" 			=> color_address <= bg; 		-- Column 0
						when "001" | "010" 	=> color_address <= light_grey; -- Column 1 and 2
						when "110" | "111" 	=> color_address <= dark_grey; 	-- Column 6 and 7
						when others			=> color_address <= grey; 		-- Column 3, 4 and 5		
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000"					=> color_address <= bg; 		-- Column 0
						when "001" 					=> color_address <= light_grey; -- Column 1
						when "010" | "011" | "100" 	=> color_address <= grey; 		-- Column 2, 3 and 4
						when others					=> color_address <= dark_grey; 	-- Column 5, 6 and 7			
					end case;
	
				when "110" =>	-- Row 6
					case column is
						when "000"	=> color_address <= bg; 		-- Column 0
						when "001"	=> color_address <= grey; 		-- Column 1
						when others	=> color_address <= dark_grey; 	-- Column 2, 3, 4, 5, 6 and 7			
					end case;

				when others =>	-- Row 7
					case column is 
						when "100" | "101" | "110" 	=> color_address <= dark_grey;	-- Column 4, 5 and 6
						when others					=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7			
					end case;			
			end case;			
		
		-- Gold Ore
		when "000010" =>
			case row is
				when "000" => 	-- Row 0
					case column is 
						when "100" 			=> color_address <= light_grey; 	-- Column 4
						when "101" | "110" 	=> color_address <= grey;		 	-- Column 5 and 6
						when others			=> color_address <= bg; 			-- Column 0, 1, 2, 3 and 7			
					end case;
			
			
				when "001" =>	-- Row 1
					case column is 
						when "011"	=> color_address <= light_grey; 	-- Column 3
						when "100"	=> color_address <= light_yellow; 	-- Column 4
						when "101" 	=> color_address <= yellow; 		-- Column 5
						when "110" 	=> color_address <= grey; 			-- Column 6
						when "111" 	=> color_address <= dark_grey; 		-- Column 7
						when others	=> color_address <= bg; 			-- Column 0, 1 and 2			
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "001" 	=> color_address <= bg; 			-- Column 0 and 1 
						when "101" 			=> color_address <= orange; 		-- Column 5
						when "110" | "111" 	=> color_address <= dark_grey; 		-- Column 6 and 7
						when others			=> color_address <= light_grey; 	-- Column 2, 3 and 4			
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" 			=> color_address <= bg; 			-- Column 0
						when "001" | "011" 	=> color_address <= light_grey; 	-- Column 1 and 3
						when "010" 			=> color_address <= light_yellow; 	-- Column 2
						when "100" | "101" 	=> color_address <= grey; 			-- Column 4 and 5
						when others 		=> color_address <= dark_grey; 		-- Column 6 and 7			
					end case;
				
				when "100" => -- Row 4
					case column is
						when "000" 			=> color_address <= bg; 			-- Column 0
						when "001" 			=> color_address <= light_grey; 	-- Column 1
						when "010" | "011" 	=> color_address <= yellow; 		-- Column 2 and 3
						when "100" | "101" 	=> color_address <= grey; 			-- Column 4 and 5
						when others 		=> color_address <= dark_grey; 		-- Column 6 and 7			
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" 	=> color_address <= bg; 			-- Column 0
						when "001" 	=> color_address <= light_grey; 	-- Column 1 
						when "011"	=> color_address <= orange; 		-- Column 3
						when "101" 	=> color_address <= light_yellow; 	-- Column 5
						when "110" 	=> color_address <= yellow; 		-- Column 6
						when "111" 	=> color_address <= dark_grey; 		-- Column 7
						when others	=> color_address <= grey; 			-- Column 2 and 4			
					end case;
					
				when "110" => 	-- Row 6
					case column is
						when "000" 	=> color_address <= bg; 			-- Column 0
						when "001" 	=> color_address <= grey; 			-- Column 1
						when "101" 	=> color_address <= yellow; 		-- Column 5
						when "110" 	=> color_address <= orange; 		-- Column 6
						when "111" 	=> color_address <= dark_grey; 		-- Column 7
						when others	=> color_address <= dark_grey; 		-- Column 2, 3 and 4			
					end case;
					
				when others => 	-- Row 7
					case column is 
						when "100" | "101" | "110" 	=> color_address <= dark_grey; 	-- Column 4, 5 and 6
						when others					=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7		
					end case;			
			end case;

		-- Boundary
		when "000011" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "001" 			=> color_address <= light_grey; -- Column 1
						when "010" | "111" 	=> color_address <= grey; 		-- Column 2 and 7
						when others			=> color_address <= dark_grey; 	-- Column 0, 3, 4, 5 and 6			
					end case;
					
				when "001" => 	-- Row 1
					case column is 
						when "100" 			=> color_address <= dark_grey; 	-- Column 4
						when "110" | "111" 	=> color_address <= grey; 		-- Column 6 and 7
						when others			=> color_address <= light_grey; -- Column 0, 1, 2, 3 and 5			
					end case;
					
				when "010" => 	-- Row 2
					case column is 
						when "011" | "110"	=> color_address <= black;		-- Column 3 and 6
						when "111"			=> color_address <= grey;		-- Column 7
						when others			=> color_address <= dark_grey; 	-- Column 0, 1, 2, 4 and 5			
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "110" 	=> color_address <= light_grey; -- Column 0 and 6 
						when "010" 			=> color_address <= black; 		-- Column 3
						when others			=> color_address <= grey; 		-- Column 1, 3, 4, 5 and 7			
					end case;
					
				when "100" => 	-- Row 4
					case column is 
						when "101" | "110" 	=> color_address <= light_grey;	-- Column 5 and 6
						when "111"			=> color_address <= grey;		-- Column 7
						when others			=> color_address <= dark_grey;	-- Column 0, 1, 2, 3 and 4			
					end case;
					
				when "101" =>	-- Row 5
					case column is 
						when "011" | "100" | "101" 	=> color_address <= grey;  		-- Column 3, 4 and 5
						when others					=> color_address <= dark_grey; 	-- Column 0, 1, 2, 6 and 7			
					end case;

				when "110" =>	-- Row 6
					case column is 
						when "010" 	=> color_address <= dark_grey; 	-- Column 2
						when "011" 	=> color_address <= grey; 		-- Column 3
						when "101" 	=> color_address <= black; 		-- Column 5
						when others	=> color_address <= light_grey; -- Column 0, 1, 4, 6 and 7			
					end case;
					
				when others => 	-- Row 7
					case column is 
						when "101" | "110" | "111" 	=> color_address <= grey; 		-- Column 5, 6 and 7
						when others					=> color_address <= dark_grey;	-- Column 0, 1, 2, 3 and 4			
					end case;			
			end case;

		-- Diamond Ore
		when "000100" =>
			case row is
				when "000" => 	-- Row 0
					case column is 
						when "100" 			=> color_address <= light_grey; -- Column 4
						when "101" | "110" 	=> color_address <= grey; 		-- Column 5 and 6
						when others			=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7			
					end case;
					
				when "001" =>	-- Row 1
					case column is 
						when "011" 			=> color_address <= light_grey; -- Column 3
						when "100" | "101" 	=> color_address <= diamond;	-- Column 4 and 5
						when "110" 			=> color_address <= grey; 		-- Column 6
						when "111" 			=> color_address <= dark_grey; 	-- Column 7
						when others			=> color_address <= bg;			-- Column 0, 1 and 2			
					end case;
					
				when "010" => 	-- Row 2
					case column is
						when "000" | "001"	=> color_address <= bg; 			-- Column 0 and 1
						when "101" 			=> color_address <= dark_diamond; 	-- Column 5
						when "110" | "111" 	=> color_address <= dark_grey; 		-- Column 6 and 7
						when others			=> color_address <= light_grey; 	-- Column 2, 3 and 4			
					end case;
					
				when "011" => 	-- Row 3
					case column is
						when "000" 			=> color_address <= bg; 		-- Column 0
						when "001" | "011" 	=> color_address <= light_grey; -- Column 1 and 3
						when "010" 			=> color_address <= diamond; 	-- Column 2
						when "100" | "101" 	=> color_address <= grey;		-- Column 4 and 5
						when others 		=> color_address <= dark_grey; 	-- Column 6 and 7			
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" 			=> color_address <= bg; 			-- Column 0
						when "001" 			=> color_address <= light_grey; 	-- Column 1
						when "010" 			=> color_address <= diamond; 		-- Column 2
						when "011" 			=> color_address <= dark_diamond; 	-- Column 3
						when "100" | "101" 	=> color_address <= grey; 			-- Column 4 and 5
						when others	 		=> color_address <= dark_grey; 		-- Column 6 and 7			
					end case;
				
				when "101" =>	-- Row 5
					case column is
						when "000" 			=> color_address <= bg; 			-- Column 0
						when "001" 			=> color_address <= light_grey; 	-- Column 1
						when "010" | "100" 	=> color_address <= grey; 			-- Column 2 and 4
						when "011" 			=> color_address <= dark_diamond; 	-- Column 3 
						when "111" 			=> color_address <= dark_grey;		-- Column 7
						when others			=> color_address <= diamond; 		-- Column 5 and 6			
					end case;
					
				when "110" => 	-- Row 6
					case column is
						when "000" 	=> color_address <= bg; 			-- Column 0
						when "001" 	=> color_address <= grey;			-- Column 1
						when "101" 	=> color_address <= diamond; 		-- Column 5
						when "110" 	=> color_address <= dark_diamond; 	-- Column 6
						when others	=> color_address <= dark_grey; 		-- Column 2, 3, 4 and 7			
					end case;
					
				when others =>	-- Row 7
					case column is 
						when "100" | "101" | "110" 	=> color_address <= dark_grey; 	-- Column 4, 5 and 6
						when others					=> color_address <= bg; 		-- Column 0, 1, 2, 3 and 7			
					end case;			
			end case;

		-- Ladder
		when "000101" =>
			case row is
				when "000" | "111" =>	-- Row 0 and 7
					case column is
						when "000" | "111" 	=> color_address <= bg; 	-- Column 0 and 7 
						when others			=> color_address <= black; 	-- Column 1, 2, 3, 4, 5 and 6			
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" 			=> color_address <= black; 			-- Column 0 
						when "100" | "101" 	=> color_address <= yellow; 		-- Column 4 and 5
						when "110" | "111" 	=> color_address <= orange; 		-- Column 6 and 7
						when others			=> color_address <= light_orange; 	-- Column 1, 2 and 3			
					end case;
			
				when "110" =>	-- Row 6
					case column is
						when "000" 					=> color_address <= black; 			-- Column 0
						when "001" 					=> color_address <= light_orange; 	-- Column 1
						when "010" | "011" | "100" 	=> color_address <= yellow; 		-- Column 2, 3 and 4
						when others 				=> color_address <= orange; 		-- Column 5, 6 and 7			
					end case;
					
				when others =>	-- Row 2, 3, 4 and 5
					case column is 
						when "010" 	=> color_address <= light_orange; 	-- Column 2
						when "100" 	=> color_address <= yellow; 		-- Column 4
						when "110" 	=> color_address <= orange; 		-- Column 6
						when others	=> color_address <= black; 			-- Column 0, 1, 3, 5 and 7			
					end case;			
			end case;
					
		-- Letter: R - Light Blue --
		when "000110" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" | "001" | "101" | "110" 	=> color_address <= spirit_blue; 	-- Column 0, 1, 5 and 6
						when others 						=> color_address <= white;			-- Column 2, 3, 4 and 7			
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" | "101" 	=> color_address <= spirit_blue; 	-- Column 0 and 5
						when others			=> color_address <= white; 			-- Column 1, 2, 3, 4, 6 and 7			
					end case;	
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "011" 	=> color_address <= spirit_blue; 	-- Column 0 and 3
						when others			=> color_address <= white; 			-- Column 1, 2, 4, 5, 6 and 7		
					end case;	
					
				when "011" => 	-- Row 3
					case column is
						when "000" | "011" | "111" 	=> color_address <= spirit_blue; 	-- Column 0, 3 and 7
						when others 				=> color_address <= white; 			-- Column 1, 2, 4, 5 and 6			
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" | "011" | "110" | "111" 	=> color_address <= spirit_blue; 	-- Column 0, 3, 6 and 7
						when others 						=> color_address <= white; 			-- Column 1, 2, 4 and 5			
					end case;
	
				when "111" => 	-- Row 7
					color_address <= spirit_blue; 

				when others =>	-- Row 5 and 6
					case column is
						when "000" 	=> color_address <= spirit_blue; 	-- Column 0
						when others => color_address <= white; 			-- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;			
			end case;

		-- Letter: O - Light Blue --
		when "000111" =>
			case row is	
				when "010" | "011" | "100" =>	-- Row 2, 3 and 4
					case column is
						when "000" | "011" | "100" | "101" 	=> color_address <= spirit_blue; 	-- Column 0, 3, 4 and 5
						when others 						=> color_address <= white; 			-- Column 1, 2, 6 and 7			
					end case;
			
				when "111" =>	-- Row 7
					color_address <= spirit_blue;
				
				when others =>	-- Row 0, 1, 5 and 6
					case column is
						when "000" 	=> color_address <= spirit_blue; 	-- Column 0
						when others => color_address <= white; 			-- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;		
			end case;
	
		-- Letter: N - Light Blue --
		when "001000" =>	
			case row is
				when "010" =>	-- Row 2
					case column is 
						when "100" | "101" | "110" 	=> color_address <= white; 			-- Column 4, 5 and 6
						when others					=> color_address <= spirit_blue; 	-- Column 0, 1, 2, 3 and 7			
					end case;
					
				when "011" =>	-- Row 3
					case column is 
						when "011" | "100" | "101" 	=> color_address <= white; 			-- Column 3, 4 and 5
						when others					=> color_address <= spirit_blue; 	-- Column 0, 1, 2, 6 and 7			
					end case;
					
				when "100" =>	-- Row 4
					case column is 
						when "011" | "100"	=> color_address <= white; 			-- Column 3 and 4
						when others			=> color_address <= spirit_blue; 	-- Column 0, 1, 2, 5, 6 and 7			
					end case;
	
				when "111" =>	-- Row 7
					color_address <= spirit_blue;
				
				when others => 	-- Row 0, 1, 5 and 6
					case column is
						when "000" 	=> color_address <= spirit_blue; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;			
			end case;
	
		-- Letter: L - Light Blue--
		when "001001" =>
			case row is
				when "001" | "010" | "011" =>	-- Row 1, 2 and 3
					case column is 
						when "110" | "111" 	=> color_address <= white; 			-- Column 6 and 7
						when others			=> color_address <= spirit_blue; 	-- Column 0, 1, 2, 3, 4 and 5			
					end case;
			
				when "100" | "101" =>	-- Row 4 and 5
					case column is
						when "000" 	=> color_address <= spirit_blue; 	-- Column 0
						when others => color_address <= white; 			-- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
			
				when others =>	-- Row 0, 6 and 7
					color_address <= spirit_blue;			
			end case;

		-- Black Tile --
		when "001010" =>
			color_address <= black;

		-- Letter: C --
		when "001011" =>
			case row is
				when "101" | "110" =>	-- Row 5 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others => 	-- Row 0, 1, 2, 3 and 4
					case column is
						when "000" | "011" | "100" | "101" 	=> color_address <= black; -- Column 0, 3, 4 and 5
						when others 						=> color_address <= white; -- Column 1, 2, 6 and 7			
					end case;			
			end case;

		-- Letter: E --
		when "001100" =>
			case row is
				when "000" | "001" =>	-- Row 0 and 1
					case column is
						when "000" | "011" | "100" | "101" 	=> color_address <= black; -- Column 0, 3, 4 and 5
						when others 						=> color_address <= white; -- Column 1, 2, 6 and 7		
					end case;
 			
				when "101" | "110" =>	-- Row 5 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
			
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others => 	-- Row 2, 3 and 4
					case column is
						when "000" | "011" | "101"	=> color_address <= black; -- Column 0, 3 and 5
						when others 				=> color_address <= white; -- Column 1, 2, 4, 6 and 7			
					end case;		
			end case;

		-- Letter: G --
		when "001101" =>
			case row is
				when "000" | "001" =>	-- Row 0 and 1
					case column is
						when "000" | "011" 	=> color_address <= black; -- Column 0 and 3
						when others 		=> color_address <= white; -- Column 1, 2, 4, 5, 6 and 7				
					end case;							
			
				when "010" | "011" =>	-- Row 2 and 3
					case column is
						when "000" | "011" | "101" 	=> color_address <= black; -- Column 0, 3 and 5
						when others 				=> color_address <= white; -- Column 1, 2, 4, 6 and 7			
					end case;
			
				when "100" =>	-- Row 4
					case column is
						when "000" | "011" | "100" | "101" 	=> color_address <= black; -- Column 0, 3, 4 and 5
						when others 						=> color_address <= white; -- Column 1, 2, 6 and 7			
					end case;

				when "111" =>	-- Row 7
					color_address <= black;

				when others => 	-- Row 5 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;		
			end case;

		-- Letter: L --
		when "001110" =>
			case row is
				when "000" | "110" | "111" =>	-- Row 0, 6 and 7
					color_address <= black;	
					
				when "100" | "101" => 	-- Row 4 and 5
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
					
				when others =>	-- Row 1, 2 and 3
					case column is 
						when "110" | "111" 	=> color_address <= white; -- Column 6 and 7
						when others			=> color_address <= black; -- Column 0, 1, 2, 3, 4 and 5			
					end case;			
			end case;
				
		-- Letter: N --
		when "001111" =>
			case row is
				when "010" =>	-- Row 2
					case column is 
						when "100" | "101" | "110" 	=> color_address <= white; -- Column 4, 5 and 6
						when others					=> color_address <= black; -- Column 0, 1, 2, 3 and 7			
					end case;
			
				when "011" =>	-- Row 3
					case column is 
						when "011" | "100" | "101" 	=> color_address <= white; -- Column 3, 4 and 5
						when others					=> color_address <= black; -- Column 0, 1, 2, 6 and 7			
					end case;
					
				when "100" =>	-- Row 4
					case column is 
						when "011" | "100"	=> color_address <= white; -- Column 3 and 4
						when others			=> color_address <= black; -- Column 0, 1, 2, 5, 6 and 7			
					end case;
			
				when "111" =>	-- Row 7
					color_address <= black;	
					
				when others =>	-- Row 0, 1, 5 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;	
			end case;

		-- Number: 0 --
		when "010000" =>
			case row is
				when "000" | "110" =>	-- Row 0 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
			
				when "111" =>	-- Row 7
					color_address <= black;	
					
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is 
						when "001" | "111" 	=> color_address <= white; -- Column 1 and 7
						when others			=> color_address <= black; -- Column 0, 2, 3, 4, 5 and 6			
					end case;		
			end case;

		-- Number: 1 --
		when "010001" =>
			case row is
				when "000" | "001" | "010" =>	-- Row 0, 1 and 2
					case column is 
						when "111" 	=> color_address <= white; -- Column 7
						when others	=> color_address <= black; -- Column 0, 1, 2, 3, 4, 5 and 6			
					end case;
			
				when "011" => 	-- Row 3
					case column is
						when "000"  => color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;

				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 4, 5 and 6
					case column is
						when "001" | "111" 	=> color_address <= white; -- Column 1 and 7
						when others			=> color_address <= black; -- Column 0, 2, 3, 4, 5 and 6		
					end case;			
			end case;

		-- Number: 2 --
		when "010010" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" | "101" | "110" 	=> color_address <= black;	-- Column 0, 5 and 6
						when others					=> color_address <= white; 	-- Column 1, 2, 3, 4 and 7		
					end case;
			
				when "110" =>	-- Row 6
					case column is
						when "000" | "010" | "011" 	=> color_address <= black; -- Column 0, 2 and 3
						when others 				=> color_address <= white; -- Column 1, 4, 5, 6 and 7			
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is 
						when "001" | "100" | "111" 	=> color_address <= white; -- Column 1, 4 and 7
						when others					=> color_address <= black; -- Column 0, 2, 3, 5 and 6			
					end case;			
			end case;

		-- Number: 3 --
		when "010011" =>
			case row is
				when "000" => 	-- Row 0
					case column is
						when "000"  => color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
			
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4, 5 and 6
					case column is 
						when "001" | "100" | "111" 	=> color_address <= white; -- Column 1, 4 and 7
						when others					=> color_address <= black; -- Column 0, 2, 3, 5 and 6			
					end case;		
			end case;

		-- Number: 4 --
		when "010100" =>
			case row is
				when "000" => 	-- Row 0
					case column is
						when "000"  => color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
				
				when "110" =>	-- Row 6
					case column is
						when "000" | "101" | "110" | "111" 	=> color_address <= black; -- Column 0, 5, 6 and 7
						when others 						=> color_address <= white; -- Column 1, 2, 3 and 4			
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
							
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is 
						when "100" 	=> color_address <= white; -- Column 4
						when others	=> color_address <= black; -- Column 0, 1, 2, 3, 5, 6 and 7			
					end case;			
			end case;

		-- Number: 5 --
		when "010101" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" | "010" | "011" 	=> color_address <= black; -- Column 0, 2 and 3
						when others 				=> color_address <= white; -- Column 1, 4, 5, 6 and 7			
					end case;

				when "110" =>	-- Row 6
					case column is
						when "000" | "101" | "110" 	=> color_address <= black;	-- Column 0, 5 and 6
						when others 				=> color_address <= white; 	-- Column 1, 2, 3, 4 and 7			
					end case;
																		
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is 
						when "001" | "100" | "111" 	=> color_address <= white; -- Column 1, 4 and 7
						when others					=> color_address <= black; -- Column 0, 2, 3, 5 and 6			
					end case;			
			end case;

		-- Number: 6 --
		when "010110" =>
			case row is
				when "000" => 	-- Row 0
					case column is
						when "000" | "010" | "011" 	=> color_address <= black; -- Column 0, 2 and 3
						when others 				=> color_address <= white; -- Column 1, 4, 5, 6 and 7			
					end case;		
				
				when "110" =>	-- Row 6
					case column is
						when "000"  => color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is
						when "001" | "100" | "111" 	=> color_address <= white; -- Column 1, 4 and 7	
						when others					=> color_address <= black; -- Column 0, 2, 3, 5 and 6			
					end case;			
			end case;	

		-- Number: 7 --
		when "010111" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7	
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4, 5 and 6
					case column is
						when "001" 	=> color_address <= white; -- Column 1
						when others	=> color_address <= black; -- Column 0, 2, 3, 4, 5, 6 and 7			
					end case;			
			end case;	

		-- Number: 8 --
		when "011000" =>
			case row is
				when "000" | "110" =>	-- Row 0 and 6
					case column is
						when "000"  => color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is 
						when "001" | "100" | "111" 	=> color_address <= white; -- Column 1, 4 and 7	
						when others					=> color_address <= black; -- Column 0, 2, 3, 5 and 6			
					end case;		
			end case;

		-- Number: 9 --
		when "011001" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000"  => color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
			
				
			
				when "110" =>	-- Row 6
					case column is
						when "000" | "101" | "110" 	=> color_address <= black; 	-- Column 0, 5 and 6
						when others 				=> color_address <= white; -- Column 1, 2, 3, 4 and 7			
					end case;
					
				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 1, 2, 3, 4 and 5
					case column is
						when "001" | "100" | "111" 	=> color_address <= white; -- Column 1, 4 and 7	
						when others					=> color_address <= black; -- Column 0, 2, 3, 5 and 6			
					end case;			
			end case;

		-- Letter: O -- 
		when "011010" =>
			case row is
				when "010" | "011" | "100" =>	-- Row 2, 3 and 4
					case column is
						when "000" | "011" | "100" | "101" 	=> color_address <= black; 	-- Column 0, 3, 4 and 5
						when others 						=> color_address <= white; 	-- Column 1, 2, 6 and 7			
					end case;
			
				when "111" =>
					color_address <= black;
				
				when others =>	-- Row 0, 1, 5 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;		
			end case;

		-- Letter: R -- 
		when "011011" =>
			case row is
				when "000" => 	-- Row 0
					case column is
						when "000" | "001" | "101" | "110" 	=> color_address <= black; 	-- Column 0, 1, 5 and 6
						when others 						=> color_address <= white;	-- Column 2, 3, 4 and 7			
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" | "101" 	=> color_address <= black; 	-- Column 0 and 5
						when others			=> color_address <= white; 	-- Column 1, 2, 3, 4, 6 and 7			
					end case;	
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "011" 	=> color_address <= black; 	-- Column 0 and 3
						when others			=> color_address <= white; 	-- Column 1, 2, 4, 5, 6 and 7			
					end case;	
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "011" | "111" 	=> color_address <= black; 	-- Column 0, 3 and 7
						when others 				=> color_address <= white; 	-- Column 1, 2, 4, 5 and 6			
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" | "011" | "110" | "111" 	=> color_address <= black; 	-- Column 0, 3, 6 and 7
						when others 						=> color_address <= white; 	-- Column 1, 2, 4 and 5			
					end case;
					
				when "111" => 	-- Row 7
					color_address <= black; 

				when others =>	-- Row 5 and 6
					case column is
						when "000" 	=> color_address <= black; 	-- Column 0
						when others => color_address <= white; 	-- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;			
			end case;

		-- Letter: S -- 
		when "011100" =>
			case row is
				when "000" | "001" => 	-- Row 0 and 1
					case column is
						when "000" | "011" 	=> color_address <= black; -- Column 0 and 3
						when others 		=> color_address <= white; -- Column 1, 2, 4, 5, 6 and 7			
					end case;
			
				when "101" | "110" =>	-- Row 5 and 6
					case column is
						when "000" | "101"	=> color_address <= black; -- Column 0 and 5
						when others 		=> color_address <= white; -- Column 1, 2, 3, 4, 6 and 7		
					end case;
					
				when "111" => 	-- Row 7
					color_address <= black; 

				when others =>	-- Row 2, 3 and 4
					case column is
						when "000" | "011" | "101" 	=> color_address <= black; -- Column 0, 3 and 5
						when others 				=> color_address <= white; -- Column 1, 2, 4, 6 and 7			
					end case;			
			end case;

		-- Letter: V -- 
		when "011101" =>
			case row is
				when "000" | "110" =>	-- Row 0 and 6
					case column is
						when "000" | "110" | "111" 	=> color_address <= black; -- Column 0, 6 and 7
						when others 				=> color_address <= white; -- Column 1, 2, 3, 4 and 5			
					end case;
					
				when "001" | "101" =>	-- Row 1 and 5
					case column is
						when "000" | "111" 	=> color_address <= black; -- Column 0 and 7
						when others 		=> color_address <= white; -- Column 1, 2, 3, 4, 5 and 6			
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "110" | "111" 	=> color_address <= white; -- Column 6 and 7
						when others			=> color_address <= black; -- Column 0, 1, 2, 3, 4 and 5			
					end case;
					
				when "111" => 	-- Row 7
					color_address <= black; 

				when others => 	-- Row 2 and 4
					case column is 
						when "101" | "110" | "111" 	=> color_address <= white; -- Column 5, 6 and 7
						when others					=> color_address <= black; -- Column 0, 1, 2, 3 and 4			
					end case;			
			end case;	

		-- Y --
		when "011110" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" | "101" | "110" | "111" 	=> color_address <= black; -- Column 0, 5, 6 and 7
						when others 						=> color_address <= white; -- Column 1, 2, 3 and 4
					end case;
				
				when "001" =>	-- Row 1
					case column is
						when "000" | "110" | "111" 	=> color_address <= black; -- Column 0, 6 and 7
						when others 				=> color_address <= white; -- Column 1, 2, 3, 4 and 5
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "001" | "010" | "111" 	=> color_address <= black; -- Column 0, 1, 2 and 7
						when others 						=> color_address <= white; -- Column 3, 4, 5 and 6
					end case;		
				
				when "011" =>	-- Row 3
					case column is		
						when "000" | "001" | "010" | "011" 	=> color_address <= black; -- Column 0, 1, 2 and 3
						when others 						=> color_address <= white; -- Column 4, 5, 6 and 7
					end case;
			
				when "100" =>	-- Row 4
					case column is
						when "000" | "001" | "010" 			=> color_address <= black; -- Column 0, 1 and 2
						when others 						=> color_address <= white; -- Column 3, 4, 5, 6 and 7
					end case;
			
				when "101" =>	-- Row 5
					case column is
						when "000" | "101" 				=> color_address <= black; -- Column 0 and 5
						when others 					=> color_address <= white; -- Column 1, 2, 3, 4, 6 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "100" | "101" 		=> color_address <= black; -- Column 0, 4 and 5
						when others 					=> color_address <= white; -- Column 1, 2, 3, 6 and 7
					end case;

				when others =>	-- Row 7
					color_address <= black;
			end case;
		
		-- Letter: A
		when "011111" =>
			case row is
				when "000" | "110" =>	-- Row 0 and 6
					case column is
						when "000" | "001" 	=> color_address <= black; -- Column 0 and 1
						when others 		=> color_address <= white; -- Column 2, 3, 4, 5, 6 and 7
					end case;
				
				when "001" | "101" =>	-- Row 1 and 5
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7
					end case;

				when "111" =>	-- Row 7
					color_address <= black;
					
				when others =>	-- Row 2, 3 and 4
					case column is
						when "000" | "011" | "110" | "111" 	=> color_address <= black; -- Column 0, 3, 6 and 7
						when others 						=> color_address <= white; -- Column 1, 2, 4 and 5
					end case;
			end case;
		
		-- Letter: M
		when "100000" =>
			case row is
				when "010" | "100" =>	-- Row 2 and 4
					case column is
						when "010" | "011" | "100" 	=> color_address <= white; -- Column 2, 3 and 4
						when others 				=> color_address <= black; -- Column 0, 1, 5, 6 and 7
					end case;
			
				when "011" => 	-- Row 3
					case column is
						when "011" | "100" | "101" 	=> color_address <= white; -- Column 3, 4 and 5
						when others 				=> color_address <= black; -- Column 0, 1, 2, 6 and 7
					end case;
					
				when "111" =>
					color_address <= black;
					
				when others =>	-- Row 0, 1, 5 and 6
					case column is
						when "000" 	=> color_address <= black; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7
					end case;
			end case;
		
		-- Letter: I - Light blue
		when "100001" =>
			case row is
				when "010" | "011" | "100" =>	-- Row 2, 3 and 4
					case column is
						when "000" 	=> color_address <= spirit_blue; 	-- Column 0
						when others => color_address <= white;			-- Column 1, 2, 3, 4, 5, 6 and 7
					end case;
			
				when "111" =>	-- Row 7
					color_address <= spirit_blue;
					
				when others =>	-- Row 0, 1, 6 and 7
					case column is
						when "000" | "011" | "100" | "101" 	=> color_address <= spirit_blue; 	-- Column 0, 3, 4 and 5
						when others 						=> color_address <= white;			-- Column 1, 2, 6 and 7
					end case;
			end case;
				
		-- DeathAnimation1 (second player frame) (GREY)
		when "100010" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" | "011" 	=> color_address <= grey; 	-- Column 2 and 3
						when others 		=> color_address <= black; 	-- Column 0, 1, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" 	=> color_address <= black; 			-- Column 0
						when "001" 	=> color_address <= light_yellow; 	-- Column 1
						when "111" 	=> color_address <= grey; 			-- Column 7
						when others	=> color_address <= light_blue; 	-- Column 2, 3, 4, 5 and 6
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" 			=> color_address <= yellow; 		-- Column 0
						when "001" 			=> color_address <= light_yellow; 	-- Column 1
						when "010" 			=> color_address <= black; 			-- Column 2
						when "101" | "110" 	=> color_address <= light_blue; 	-- Column 5 and 6
						when others 		=> color_address <= grey; 			-- Column 3, 4 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "001" 	=> color_address <= yellow; 	-- Column 0 and 1
						when "010" | "100" 	=> color_address <= grey; 		-- Column 2 and 4
						when "011" | "111" 	=> color_address <= black; 		-- Column 3 and 7
						when others			=> color_address <= light_blue; -- Column 5 and 6
					end case;
								
				when "100" =>	-- Row 4	
					case column is
						when "000" 			=> color_address <= orange; 	-- Column 0
						when "001" 			=> color_address <= yellow; 	-- Column 1
						when "010" | "111" 	=> color_address <= black; 		-- Column 2 and 7
						when "101" 			=> color_address <= light_blue;	-- Column 5
						when "110" 			=> color_address <= denim_blue; -- Column 6
						when others 		=> color_address <= grey; 		-- Column 3 and 4	
					end case;	

				when "101" =>	-- Row 5
					case column is
						when "000" | "001" 	=> color_address <= orange; 	-- Column 0 and 1
						when "101" | "110" 	=> color_address <= denim_blue; -- Column 5 and 6
						when others			=> color_address <= grey; 		-- Column 2, 3, 4 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" 			=> color_address <= black; 		-- Column 0
						when "001" 			=> color_address <= orange; 	-- Column 1
						when "010" | "011" 	=> color_address <= light_blue; -- Column 2 and 3
						when "111" 			=> color_address <= grey; 		-- Column 7
						when others 		=> color_address <= denim_blue; -- Column 4, 5 and 6
					end case;
					
				when others =>	-- Row 7
					case column is
						when "011" | "100" => color_address <= grey; -- Column 3 and 4
						when others => color_address <= black; -- Column 0, 1, 2, 5, 6 and 7
					end case;
			end case;
				
		-- DeathAnimation2 (third player frame) (LIGHTEST GREY)
		when "100011" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" | "011" 	=> color_address <= lightest_grey; 	-- Column 2 and 3
						when others 		=> color_address <= black;			-- Column 0, 1, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" 	=> color_address <= black; 			-- Column 0
						when "001" 	=> color_address <= light_yellow; 	-- Column 1
						when "111" 	=> color_address <= lightest_grey; 	-- Column 7
						when others => color_address <= light_blue;	 	-- Column 2, 3, 4, 5 and 6
					end case;
					
				when "010" => 	-- Row 2
					case column is
						when "000" 			=> color_address <= yellow; 		-- Column 0
						when "001" 			=> color_address <= light_yellow; 	-- Column 1
						when "010" 			=> color_address <= black; 			-- Column 2
						when "101" | "110" 	=> color_address <= light_blue; 	-- Column 5 and 6
						when others 		=> color_address <= lightest_grey; 	-- Column 3, 4 and 7
					end case;
					
				when "011" => 	-- Row 3
					case column is
						when "000" | "001" 	=> color_address <= yellow; 		-- Column 0 and 1
						when "010" | "100" 	=> color_address <= lightest_grey; 	-- Column 2 and 4
						when "011" | "111" 	=> color_address <= black; 			-- Column 3 and 7
						when others			=> color_address <= light_blue; 	-- Column 5 and 6
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" 			=> color_address <= orange; 		-- Column 0
						when "001" 			=> color_address <= yellow; 		-- Column 1
						when "010" | "111" 	=> color_address <= black; 			-- Column 2 and 7
						when "101" 			=> color_address <= light_blue; 	-- Column 5
						when "110" 			=> color_address <= denim_blue; 	-- Column 6
						when others 		=> color_address <= lightest_grey; 	-- Column 3 and 4
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "001" 	=> color_address <= orange; 		-- Column 0 and 1
						when "101" | "110" 	=> color_address <= denim_blue; 	-- Column 5 and 6
						when others 		=> color_address <= lightest_grey; 	-- Column 2, 3, 4 and 7
					end case;
							
				when "110" =>	-- Row 6
					case column is
						when "000" 			=> color_address <= black; 			-- Column 0
						when "001" 			=> color_address <= orange; 		-- Column 1
						when "010" | "011" 	=> color_address <= light_blue; 	-- Column 2 and 3
						when "111" 			=> color_address <= lightest_grey; 	-- Column 7
						when others 		=> color_address <= denim_blue; 	-- Column 4, 5 and 6
					end case;

				when others => 	-- Row 7
					case column is
						when "011" | "100" 	=> color_address <= lightest_grey; 	-- Column 3 and 4
						when others			=> color_address <= black; 			-- Column 0, 1, 2, 5, 6 and 7
					end case;
			end case;
				
		-- DeathAnimation3 (third player frame) (ICE)
		when "100100" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" | "011" 	=> color_address <= ice; 	-- Column 2 and 3
						when others 		=> color_address <= black;	-- Column 0, 1, 4, 5, 6 and 7
					end case;
			
				when "001" =>	-- Row 1
					case column is
						when "000" 	=> color_address <= black; 			-- Column 0
						when "001" 	=> color_address <= light_yellow; 	-- Column 1
						when "111" 	=> color_address <= ice; 			-- Column 7
						when others => color_address <= light_blue;	 	-- Column 2, 3, 4, 5 and 6
					end case;

				when "010" =>	-- Row 2
					case column is
						when "000" 			=> color_address <= yellow; 		-- Column 0
						when "001" 			=> color_address <= light_yellow; 	-- Column 1
						when "010" 			=> color_address <= black; 			-- Column 2
						when "101" | "110" 	=> color_address <= light_blue; 	-- Column 5 and 6
						when others 		=> color_address <= ice; 			-- Column 3, 4 and 7
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000" | "001" 	=> color_address <= yellow; 	-- Column 0 and 1
						when "010" | "100" 	=> color_address <= ice; 		-- Column 2 and 4
						when "011" | "111" 	=> color_address <= black; 		-- Column 3 and 7
						when others 		=> color_address <= light_blue; -- Column 5 and 6
					end case;

				when "100" =>	-- Row 4
					case column is
						when "000" 			=> color_address <= orange; 	-- Column 0
						when "001" 			=> color_address <= yellow;		-- Column 1
						when "010" | "111" 	=> color_address <= black; 		-- Column 2 and 7
						when "101" 			=> color_address <= light_blue;	-- Column 5
						when "110" 			=> color_address <= denim_blue;	-- Column 6
						when others			=> color_address <= ice;		-- Collumn 3 and 4
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "001" 	=> color_address <= orange; 	-- Column 0 and 1
						when "101" | "110" 	=> color_address <= denim_blue;	-- Column 5 and 6
						when others			=> color_address <= ice;		-- Column 2, 3, 4 and 7		
					end case;		
								
				when "110" =>	-- Row 6
					case column is
						when "000" 			=> color_address <= black;		-- Column 0
						when "001" 			=> color_address <= orange; 	-- Column 1
						when "010" | "011" 	=> color_address <= light_blue; -- Column 2 and 3
						when "111" 			=> color_address <= ice; 		-- Column 7
						when others			=> color_address <= denim_blue; -- Column 4, 5 and 6
					end case;

				when others =>	-- Row 7
					case column is
						when "011" | "100" 	=> color_address <= ice;	-- Column 3 and 4
						when others 		=> color_address <= black;	-- Column 0, 1, 2, 5, 6 and 7
					end case;	
			end case;
				
		-- DeathAnimation4 (poof1)
		when "100101" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "001" | "101" 	=> color_address <= ice; 	-- Column 1 and 5
						when others			=> color_address <= black;	-- Column 0, 2, 3, 4, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" | "001" | "010" 	=> color_address <= black;			-- Column 0, 1 and 2
						when "011"					=> color_address <= light_yellow; 	-- Column 3
						when others					=> color_address <= light_blue;		-- Column 4, 5, 6 and 7
					end case;
			
				when "010" =>	-- Row 2
					case column is
						when "000" 			=> color_address <= ice; 			-- Column 0
						when "010" | "011" 	=> color_address <= light_yellow;	-- Column 2 and 3
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 1, 4 and 5
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "001" 		=> color_address <= orange; 		-- Column 1
						when "010"		=> color_address <= yellow;			-- Column 2
						when "011"		=> color_address <= light_yellow;	-- Column 3
						when "110"		=> color_address <= light_blue;		-- Column 6
						when "111" 		=> color_address <= denim_blue;		-- Column 7
						when others		=> color_address <= black;			-- Column 0, 4 and 5
					end case;

				when "100" =>	-- Row 4
					case column is
						when "001" 		=> color_address <= orange; 		-- Column 1
						when "010"		=> color_address <= yellow;			-- Column 2
						when "011"		=> color_address <= ice;			-- Column 4
						when "110"		=> color_address <= light_blue;		-- Column 6
						when "111" 		=> color_address <= denim_blue;		-- Column 7
						when others		=> color_address <= black;			-- Column 0, 3 and 5
					end case;

				when "101" =>	-- Row 5
					case column is
						when "001" 			=> color_address <= orange;		-- Column 1
						when "010"			=> color_address <= yellow;		-- Column 2
						when "110" | "111" 	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 3, 4 and 5
					end case;
					
				when "110" => 	-- Row 6
					case column is
						when "000" | "001" 	=> color_address <= black;		-- Column 0 and 1
						when "010"			=> color_address <= orange;		-- Column 2
						when "011" | "100"	=> color_address <= light_blue;	-- Column 3 and 4
						when others			=> color_address <= denim_blue;	-- Column 5, 6 and 7
					end case;
	
				when others =>	-- Row 7
					case column is
						when "001" | "110" 	=> color_address <= ice; 	-- Column 1 and 6
						when others			=> color_address <= black;	-- Column 0, 2, 3, 4, 5 and 7
					end case;
			end case;
				
				
		-- DeathAnimation5 (poof2)
		when "100110" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" 	=> color_address <= ice; 		-- Column 0
						when "111" 	=> color_address <= light_blue;	-- Column 7
						when others	=> color_address <= black;		-- Column 1, 2, 3, 4, 5 and 6
					end case;
				
				when "001" =>	-- Row 1
					case column is
						when "011" 			=> color_address <= ice; 			-- Column 4
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when "110" | "111" 	=> color_address <= light_blue; 	-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 1, 2 and 4
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "100" | "101" 	=> color_address <= light_yellow;	-- Column 4 and 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 1, 2 and 3
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "001" 			=> color_address <= ice;			-- Column 1
						when "100"			=> color_address <= yellow;			-- Column 4
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7	
						when others			=> color_address <= black;			-- Column 0, 2 and 3
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "100" | "101"	=> color_address <= yellow;		-- Column 4 and 5
						when "110" | "111"	=> color_address <= light_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2 and 3
					end case;
					
				when "101" => 	-- Row 5
					case column is
						when "100"	=> color_address <= orange;		-- Column 4
						when "101"	=> color_address <= yellow;		-- Column 5
						when "110"	=> color_address <= light_blue;	-- Column 6
						when "111" 	=> color_address <= denim_blue;	-- Column 7
						when others	=> color_address <= black;		-- Column 0, 1, 2 and 3
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "010"			=> color_address <= ice; 		-- Column 2
						when "101"			=> color_address <= orange;		-- Column 5
						when "110" | "111"	=> color_address <= denim_blue;	-- Colum 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 3 and 4
					end case;

				when others => 	-- Row 7
					case column is
						when "110" | "111" 	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2, 3, 4 and 5
					end case;
			end case;
				
		-- DeathAnimation6 (poof3)
		when "100111" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" 	=> color_address <= ice;		-- Column 2
						when "111"	=> color_address <= light_blue;	-- Column 7
						when others => color_address <= black;		-- Column 0, 1, 3, 4, 5 and 6
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 1, 2, 3 and 4
					end case;
					
				when "010" =>	-- Row 2
					case column is	
						when "000" | "011" 	=> color_address <= black;			-- Column 0 and 3
						when "001" | "010" 	=> color_address <= dark_diamond;	-- Column 1 and 2
						when "100" | "101" 	=> color_address <= light_yellow;	-- Column 4 and 5
						when others			=> color_address <= light_blue;		-- Column 6 and 7
					end case;
					
				when "011" => 	-- Row 3
					case column is
						when "000" | "001"	=> color_address <= dark_diamond;	-- Column 0 and 1
						when "010" | "011"	=> color_address <= diamond;		-- Column 2 and 3
						when "100"			=> color_address <= yellow;			-- Column 4
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when others			=> color_address <= light_blue;		-- Column 6 and 7
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" | "011" 	=> color_address <= black;			-- Column 0 and 3
						when "001"			=> color_address <= dark_diamond;	-- Column 1
						when "010"			=> color_address <= diamond;		-- Column 2
						when "100" | "101"	=> color_address <= yellow;			-- Column 4 and 5
						when others			=> color_address <= light_blue;		-- Column 6 and 7
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000"	=> color_address <= ice;		-- Column 0
						when "100"	=> color_address <= orange;		-- Column 4
						when "101"	=> color_address <= yellow;		-- Column 5
						when "110" 	=> color_address <= light_blue;	-- Column 6
						when "111" 	=> color_address <= denim_blue;	-- Column 7
						when others	=> color_address <= black;		-- Column 1, 2 and 3
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "011"			=> color_address <= ice;		-- Column 3
						when "101"			=> color_address <= orange;		-- Column 5
						when "110" | "111" 	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2 and 4
					end case;
					
				when others =>	-- Row 7
					case column is
						when "110" | "111" 	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2, 3, 4 and 5
					end case;
			end case;
				
		-- DeathAnimation7 (poof4)
		when "101000" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "111" 	=> color_address <= light_blue;	-- Column 7
						when others	=> color_address <= black;		-- Column 0, 1, 2, 3, 4, 5 and 6
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "010" 			=> color_address <= ice; 			-- Column 2
						when "101" 			=> color_address <= light_yellow;	-- Column 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 1, 3 and 4
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" 			=> color_address <= dark_diamond;	-- Column 0
						when "001"			=> color_address <= diamond;		-- Column 1
						when "010" | "011"	=> color_address <= black;			-- Column 2 and 3
						when "100" | "101"	=> color_address <= light_yellow;	-- Column 4 and 5
						when others			=> color_address <= light_blue;		-- Column 6 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= dark_diamond;	-- Column 0
						when "001" |"011"	=> color_address <= black;			-- Column 1 and 3
						when "010"			=> color_address <= diamond;		-- Column 2
						when "100"			=> color_address <= yellow;			-- Column 4
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when others			=> color_address <= light_blue;		-- Column 6 and 7
					end case;
					
				when "100" => 	-- Row 4
					case column is
						when "100" | "101"	=> color_address <= yellow;		-- Column 4 and 5
						when "110" | "111" 	=> color_address <= light_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Collumn 0, 1, 2 and 3
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "100" 			=> color_address <= orange;		-- Column 4
						when "101"			=> color_address <= yellow;		-- Column 5
						when "110"			=> color_address <= light_blue;	-- Column 6
						when "111"			=> color_address <= denim_blue;	-- Column 7
						when others			=> color_address <= black;		-- Column 0, 1, 2 and 3
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "001" 			=> color_address <= ice; 		-- Column 1
						when "101"			=> color_address <= orange;		-- Column 5
						when "110" | "111" 	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 2, 3 and 4
					end case;
					
				when others =>	-- Row 7
					case column is
						when "110" | "111" 	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2, 3, 4 and 5
					end case;
			end case;

		-- DeathAnimation7 (soul1)
		when "101001" =>
			case row is
				when "000" =>	-- Row 0
					color_address <= black;
					
				when "001" => 	-- Row 1
					case column is
						when "010" 			=> color_address <= ice; 			-- Column 2
						when "101" | "110"	=> color_address <= dark_diamond;	-- Column 5 and 6
						when others			=> color_address <= black;			-- Column 0, 1, 3, 4 and 7
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "100" | "110" | "111" 	=> color_address <= dark_diamond;	-- Column 4, 6 and 7
						when others					=> color_address <= black;			-- Column 0, 1, 2, 3 and 5
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "001" | "010" | "011" 	=> color_address <= black;			-- Column 0, 1, 2 and 3
						when others							=> color_address <= dark_diamond;	-- Column 4, 5, 6 and 7
					end case;
					
				when "100" => 	-- Row 4
					case column is
						when "010"					=> color_address <= ice;			-- Column 2
						when "100" | "110" | "111"	=> color_address <= dark_diamond;	-- Column 4, 6 and 7
						when others					=> color_address <= black;			-- Column 0, 1, 3 and 5
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "101" | "110"	=> color_address <= dark_diamond;	-- Column 5 and 6
						when others			=> color_address <= black;			-- Column 0, 1, 2, 3, 4 and 7
					end case;
			
				when "110" => 	-- Row 6
					case column is
						when "011" 	=> color_address <= ice;	-- Column 3
						when others	=> color_address <= black;	-- Column 0, 1, 2, 4, 5, 6 and 7
					end case;
					
				when others =>	-- Row 7
					case column is
						when "110" 	=> color_address <= ice; 	-- Column 6
						when others => color_address <= black;	-- Column 0, 1, 2, 3, 4, 5 and 7
					end case;
			end case;

		-- DeathAnimation8 (soul2)
		when "101010" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" | "101" | "111" 	=> color_address <= black;			-- Column 0, 5 and 7
						when "110"					=> color_address <= ice;			-- Column 6
						when others					=> color_address <= dark_diamond;	-- Column 1, 2, 3 and 4
					end case;
					
				when "001" =>	-- Row 1		
					case column is
						when "000" | "011" | "100" | "101"	=> color_address <= dark_diamond;	-- Column 0, 3, 4 and 5
						when others							=> color_address <= black;			-- Column 1, 2, 6 and 7
					end case;
					
				when "010" => 	-- Row 2
					case column is
						when "111" 	=> color_address <= black;			-- Column 7
						when others	=> color_address <= dark_diamond;	-- Column 0, 1, 2, 3, 4, 5 and 6
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "001" | "010" | "111" 	=> color_address <= black;			-- Column 1, 2 and 7
						when "110"					=> color_address <= diamond;		-- Column 6
						when others					=> color_address <= dark_diamond;	-- Column 0, 3, 4 and 5
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" | "111"	=> color_address <= black; 			-- Column 0 and 7
						when "100" | "110"	=> color_address <= diamond;		-- Column 4 and 6
						when others			=> color_address <= dark_diamond;	-- Column 1, 2, 3 and 5
					end case;
					
				when "101" => 	-- Row 5
					case column is
						when "101" | "110"	=> color_address <= diamond;	-- Column 5 and 6
						when others			=> color_address <= black;		-- Column 0, 1, 2, 3, 4 and 7
					end case;
	
				when "110" =>	-- Row 6
					case column is
						when "011" | "111" 	=> color_address <= ice;		-- Column 3 and 7
						when "101"			=> color_address <= diamond;	-- Column 5
						when others			=> color_address <= black;		-- Column 0, 1, 2, 4 and 6
					end case;
					
				when others =>	-- Row 7
					case column is
						when "110" 	=> color_address <= diamond;	-- Column 6
						when others	=> color_address <= black;		-- Column 0, 1, 2, 3, 4, 5 and 7
					end case;
			end case;

		-- DeathAnimation9 (poof5)
		when "101011" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "111" 	=> color_address <= light_blue;	-- Column 7
						when others	=> color_address <= black;		-- Column 0, 1, 2, 3, 4, 5 and 6
					end case;
			
				when "001" =>	-- Row 1
					case column is
						when "001"			=> color_address <= ice;			-- Column 1
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 2, 3 and 4
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "100" | "101"	=> color_address <= light_yellow;	-- Column 4 and 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 1, 2 and 3
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "010"			=> color_address <= ice;			-- Column 2
						when "100"			=> color_address <= yellow;			-- Column 4
						when "101"			=> color_address <= light_yellow;	-- Column 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= black;			-- Column 0, 1 and 3
					end case;

				when "100" =>	-- Row 4
					case column is
						when "100" | "101"	=> color_address <= yellow;		-- Column 4 and 5
						when "110" | "111"	=> color_address <= light_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2 and 3
					end case;

				when "101" =>	-- Row 5
					case column is
						when "100"	=> color_address <= orange;		-- Column 4
						when "101"	=> color_address <= yellow;		-- Column 5
						when "110"	=> color_address <= light_blue;	-- Column 6
						when "111"	=> color_address <= denim_blue;	-- Column 7
						when others	=> color_address <= black;		-- Column 0, 1, 2 and 3
					end case;
	
				when "110" =>	-- Row 6
					case column is
						when "001"			=> color_address <= ice;		-- Column 1
						when "101"			=> color_address <= orange;		-- Column 5
						when "110" | "111"	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 2, 3 and 4
					end case;

				when others => 	-- Row 7
					case column is
						when "100"			=> color_address <= ice;		-- Column 4
						when "110" | "111"	=> color_address <= denim_blue;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2, 3 and 5
					end case;
			end case;
				
		-- DeathAnimation8 (soul3)
		when "101100" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" | "001" | "110" | "111" 	=> color_address <= black; 			-- Column 0, 1, 6 and 7
						when others							=> color_address <= dark_diamond;	-- Column 2, 3, 4 and 5
					end case;
					
				when "001" => 	-- Row 1
					case column is
						when "000" | "010" | "011" | "111" 	=> color_address <= black; 			-- Column 0, 2, 3 and 7
						when others							=> color_address <= dark_diamond;	-- Column 1, 4, 5 and 6
					end case;
		
				when "010" =>	-- Row 2
					case column is
						when "000"	=> color_address <= black; 			-- Column 0
						when others	=> color_address <= dark_diamond;	-- Column 1, 2, 3, 4, 5, 6 and 7
					end case;

				when "011" =>	-- Row 3
					case column is
						when "000" | "010" | "011"	=> color_address <= black;			-- Column 0, 2 and 3
						when others					=> color_address <= dark_diamond;	-- Column 1, 4, 5, 6 and 7
					end case;

				when "100" =>	-- Row 4
					case column is
						when "000" | "001"	=> color_address <= black;			-- Column 0 and 1
						when "101" | "111"	=> color_address <= diamond;		-- Column 5 and 7
						when others			=> color_address <= dark_diamond;	-- Column 2, 3, 4 and 6
					end case;

				when "101" =>	-- Row 5
					case column is
						when "110" | "111"	=> color_address <= diamond;	-- Column 6 and 7
						when others			=> color_address <= black;		-- Column 0, 1, 2, 3, 4 and 5
					end case;
	
				when "110" =>	-- Row 6
					case column is
						when "001"			=> color_address <= ice;		-- Column 1
						when "101" | "110"	=> color_address <= diamond;	-- Column 5 and 6
						when others			=> color_address <= black;		-- Column 0, 2, 3 and 4
					end case;

				when others =>	-- Row 7
					case column is
						when "100"	=> color_address <= diamond;	-- Column 4
						when "111"	=> color_address <= ice;		-- Column 7
						when others	=> color_address <= black;		-- Column 0, 1, 2, 3, 5 and 6
					end case;
			end case;
				
			-- footsteps1
		when "101101" =>
			case row is
				when "001" | "010" =>	-- Row 1 and 2
					case column is
						when "100" | "101" 	=> color_address <= beige;	-- Column 4 and 5
						when others			=> color_address <= bg;		-- Column 0, 1, 2, 3, 6 and 7
					end case;
					
				when "101" | "110" =>	-- Row 5 and 6
					case column is
						when "101" | "110" 	=> color_address <= beige;	-- Column 5 and 6
						when others			=> color_address <= bg;		-- Column 0, 1, 2, 3, 4 and 7
					end case;
					
				when others =>	-- Row 0, 3, 4 and 7
					color_address <= bg;
			end case;
			
		 	-- Sky
		when "101110" =>
			color_address <= spirit_blue;
			
		-- Grass
		when "101111" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "011"	=> color_address <= dark_green;	-- Column 3
						when others	=> color_address <= green;		-- Column 0, 1, 2, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "001" | "101" | "111"	=> color_address <= green;			-- Column 1, 5 and 7
						when "011"					=> color_address <= light_yellow;	-- Column 3
						when others					=> color_address <= dark_green;		-- Column 0, 2, 4 and 6
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "110"	=> color_address <= green;			-- Column 0 and 6
						when "010" | "100"	=> color_address <= light_yellow;	-- Column 2 and 4
						when others			=> color_address <= dark_green;		-- Column 1, 3,5 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "100"	=> color_address <= dark_green;		-- Column 0 and 4
						when "011"			=> color_address <= light_yellow;	-- Column 3
						when "110"			=> color_address <= magenta;		-- Column 6
						when others			=> color_address <= green;			-- Column 1, 2, 5 and 7
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "001" | "110" 	=> color_address <= dark_green;	-- Column 1 and 6
						when "101" | "111"	=> color_address <= magenta;	-- Column 5 and 7
						when others			=> color_address <= green;		-- Column 0, 2, 3 and 4
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "001" | "100"	=> color_address <= green;		-- Column 1 and 4
						when "010"			=> color_address <= lava;		-- Column 2
						when "110"			=> color_address <= magenta;	-- Column 6
						when others			=> color_address <= dark_green;	-- Column 0, 3, 5 and 7
					end case;
				
				when "110" =>	-- Row 6
					case column is
						when "001" | "011"	=> color_address <= lava;		-- Column 1 and 3
						when "010" | "110"	=> color_address <= dark_green;	-- Column 2 and 6
						when others			=> color_address <= green;		-- Column 0, 4, 5 and 7
					end case;
					
				when others =>	-- Row 7
					case column is
						when "010"	=> color_address <= lava;		-- Column 2
						when "101"	=> color_address <= dark_green;	-- Column 5
						when others	=> color_address <= green;		-- Column 0, 1, 3, 4, 6 and 7
					end case;
			end case;

		-- Start 1_1
		when "110000" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "011"	=> color_address <= dark_green;	-- Column 3
						when "111"	=> color_address <= mole_brown;	-- Column 7
						when others	=> color_address <= green;		-- Column 0, 1, 2, 4, 5 and 6
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "001"			=> color_address <= green;			-- Column 1
						when "011" | "101"	=> color_address <= light_yellow;	-- Column 3 and 5
						when "110" | "111"	=> color_address <= light_blue;		-- Column 6 and 7
						when others			=> color_address <= dark_green; 	-- Column 0, 2 and 4
					end case;

				when "010" =>	-- Row 2
					case column is
						when "000"			=> color_address <= green;			-- Column 0
						when "001" | "011"	=> color_address <= dark_green;		-- Column 1 and 3
						when "100"			=> color_address <= yellow;			-- Column 4
						when "110"			=> color_address <= black;			-- Column 6
						when "111"			=> color_address <= mole_brown;		-- Column 7
						when others			=> color_address <= light_yellow;	-- Column 2 and 5
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= dark_green;		-- Column 0
						when "001" | "010"	=> color_address <= green;			-- Column 1 and 2
						when "011"			=> color_address <= light_yellow;	-- Column 3
						when "110"			=> color_address <= mole_brown;		-- Column 6
						when "111"			=> color_address <= black;			-- Column 7
						when others			=> color_address <= yellow;			-- Column 4 and 5
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "001"	=> color_address <= dark_green;	-- Column 1
						when "100"	=> color_address <= orange;		-- Column 4
						when "101"	=> color_address <= yellow;		-- Column 5
						when "110"	=> color_address <= black;		-- Column 6
						when "111"	=> color_address <= mole_brown;	-- Column 7
						when others	=> color_address <= green;		-- Column 0, 2 and 3
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "011" 	=> color_address <= dark_green;	-- Column 0 and 3
						when "001"			=> color_address <= green;		-- Column 1
						when "010"			=> color_address <= lava;		-- Column 2
						when "100" | "101"	=> color_address <= orange;		-- Column 4 and 5
						when others			=> color_address <= mole_brown;	-- Column 6 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "100"	=> color_address <= green;		-- Column 0 and 4
						when "001" | "011"	=> color_address <= lava;		-- Column 1 and 3
						when "010"			=> color_address <= dark_green;	-- Column 2
						when "101"			=> color_address <= orange;		-- Column 5
						when others			=> color_address <= light_blue;	-- Column 6 and 7
					end case;
					
				when others =>	-- Row 7
					case column is
						when "010"	=> color_address <= lava;		-- Column 2
						when "101"	=> color_address <= dark_green;	-- Column 5
						when "111"	=> color_address <= mole_brown;	-- Column 7
						when others	=> color_address <= green;		-- Column 0, 1, 3, 4 and 6
					end case;
			end case;
				
		-- Start 1_2
		when "110001" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" 	=> color_address <= mole_brown;	-- Column 0
						when "011"	=> color_address <= dark_green;	-- Column 3
						when others	=> color_address <= green;		-- Column 1, 2, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "011"			=> color_address <= mole_brown;	-- Column 3
						when "100" | "110"	=> color_address <= dark_green;	-- Column 4 and 6
						when "101" | "111"	=> color_address <= green;		-- Column 5 and 7
						when others			=> color_address <= light_blue;	-- Column 0, 1 and 2
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "011"	=> color_address <= mole_brown;		-- Column 0 and 3
						when "001" | "010"	=> color_address <= light_blue;		-- Column 1 and 2
						when "100"			=> color_address <= light_yellow;	-- Column 4
						when "110"			=> color_address <= green;			-- Column 6
						when others			=> color_address <= dark_green;		-- Column 5 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= mole_brown;		-- Column 0
						when "011"			=> color_address <= light_yellow;	-- Column 3
						when "100"			=> color_address <= dark_green;		-- Column 4
						when "101" | "111"	=> color_address <= green;			-- Column 5 and 7
						when "110"			=> color_address <= magenta;		-- Column 6
						when others			=> color_address <= light_blue;		-- Column 1 and 2
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000"			=> color_address <= mole_brown;		-- Column 0
						when "001"			=> color_address <= light_blue;		-- Column 1
						when "010"			=> color_address <= denim_blue;		-- Column 2
						when "011" | "100"	=> color_address <= green;			-- Column 3 and 4
						when "110"			=> color_address <= dark_green;		-- Column 6
						when others			=> color_address <= magenta;		-- Column 5 and 7
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "011"	=> color_address <= mole_brown;	-- Column 0 and 3
						when "001" | "010"	=> color_address <= denim_blue;	-- Column 1 and 2
						when "100"			=> color_address <= green;		-- Column 4
						when "110"			=> color_address <= magenta;	-- Column 6
						when others			=> color_address <= dark_green;	-- Column 5 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "001" | "010"	=> color_address <= denim_blue;	-- Column 0, 1 and 2
						when "011"					=> color_address <= mole_brown;	-- Column 3
						when "110"					=> color_address <= dark_green;	-- Column 6
						when others					=> color_address <= green;		-- Column 4, 5 and 7
					end case;
					
				when others =>	-- Row 7
					case column is
						when "000"	=> color_address <= mole_brown;	-- Column 0
						when "010"	=> color_address <= lava;		-- Column 2
						when "101"	=> color_address <= dark_green;	-- Column 5
						when others	=> color_address <= green;		-- Column 1, 3, 4, 6 and 7	
					end case;
			end case;	
						
		-- Start 2_2
		when "110010" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000" 	=> color_address <= mole_brown;	-- Column 0
						when "011"	=> color_address <= dark_green;	-- Column 3
						when others	=> color_address <= green;		-- Column 1, 2, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "011"			=> color_address <= mole_brown;	-- Column 3
						when "100" | "110"	=> color_address <= dark_green;	-- Column 4 and 6
						when "101"			=> color_address <= black;		-- Column 5		
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= light_blue;	-- Column 0, 1 and 2
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "011"	=> color_address <= mole_brown;	-- Column 0 and 3
						when "001" | "010"	=> color_address <= light_blue;	-- Column 1 and 2
						when "100"			=> color_address <= black;		-- Column 4
						when "110"			=> color_address <= green;		-- Column 6
						when others			=> color_address <= dark_green;	-- Column 5 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= mole_brown;	-- Column 0
						when "001" | "010"	=> color_address <= light_blue;	-- Column 1 and 2
						when "011"			=> color_address <= black;		-- Column 3
						when "100"			=> color_address <= dark_green;	-- Column 4
						when "110"			=> color_address <= magenta;	-- Column 6
						when others			=> color_address <= green;		-- Column 5 and 7
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000"			=> color_address <= mole_brown;	-- Column 0
						when "001"			=> color_address <= light_blue;	-- Column 1
						when "010"			=> color_address <= denim_blue;	-- Column 2
						when "011" | "100"	=> color_address <= black;		-- Column 3 and 4
						when "110"			=> color_address <= dark_green;	-- Column 6
						when others			=> color_address <= magenta;	-- Column 5 and 7
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when  "000" | "011"	=> color_address <= mole_brown;	-- Column 0 and 3
						when "100"			=> color_address <= green;		-- Column 4
						when "101"			=> color_address <= black;		-- Column 5
						when "110"			=> color_address <= magenta;	-- Column 6
						when "111"			=> color_address <= dark_green;	-- Column 7
						when others			=> color_address <= denim_blue;	-- Column 1 and 2
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "001" | "010"	=> color_address <= denim_blue;	-- Column 0, 1 and 2
						when "011"					=> color_address <= mole_brown;	-- Column 3
						when "110"					=> color_address <= dark_green;	-- Column 6
						when others					=> color_address <= green;		-- Column 4, 5 and 7
					end case;
					
				when others =>	-- Row 7
					case column is
						when "000"	=> color_address <= mole_brown;	-- Column 0
						when "010"	=> color_address <= lava;		-- Column 2
						when "101"	=> color_address <= dark_green;	-- Column 5
						when others	=> color_address <= green;		-- Column 1, 3, 4, 6 and 7
					end case;
			end case;
	
		-- Start 3_2
		when "110011" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "000"	=> color_address <= mole_brown;	-- Column 0
						when "011"	=> color_address <= dark_green;	-- Column 3
						when others	=> color_address <= green;		-- Column 1, 2, 4, 5, 6 and 7
					end case;
			
				when "001" =>	-- Row 1
					case column is
						when "011"			=> color_address <= mole_brown;	-- Column 3
						when "100" | "110"	=> color_address <= dark_green; -- Column 4 and 6
						when "101"			=> color_address <= black;		-- Column 5
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= light_blue;	-- Column 0, 1 and 2
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000" | "011"	=> color_address <= mole_brown;	-- Column 0 and 3
						when "100" | "101"	=> color_address <= black;		-- Column 4 and 5
						when "110"			=> color_address <= green;		-- Column 6
						when "111"			=> color_address <= dark_green;	-- Column 7
						when others			=> color_address <= light_blue;	-- Column 1 and 2
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= magenta;	-- Column 0
						when "001" | "010"	=> color_address <= light_blue;	-- Column 1 and 2
						when "011" | "100"	=> color_address <= black;		-- Column 3 and 4
						when "110"			=> color_address <= magenta;	-- Column 6
						when others			=> color_address <= green;		-- Column 5 and 7
					end case;

				when "100" =>	-- Row 4
					case column is
						when "000"	=> color_address <= mole_brown;	-- Column 0
						when "001"	=> color_address <= light_blue;	-- Column 1
						when "010"	=> color_address <= denim_blue;	-- Column 2
						when "110"	=> color_address <= dark_green;	-- Column 6
						when "111" 	=> color_address <= magenta;	-- Column 7
						when others	=> color_address <= black;		-- Column 3, 4 and 5
					end case;

				when "101" =>	-- Row 5
					case column is
						when "000" | "011"	=> color_address <= mole_brown;	-- Column 0 and 3
						when "001" | "010"	=> color_address <= denim_blue;	-- Column 1 and 2
						when "100" | "110"	=> color_address <= black;		-- Column 4 and 6
						when others			=> color_address <= dark_green;	-- Column 5 and 7
					end case;
	
				when "110" =>	-- Row 6
					case column is
						when "011"			=> color_address <= mole_brown;	-- Column 3
						when "100" | "110"	=> color_address <= black;		-- Column 4 and 6
						when "101" | "111"	=> color_address <= green;		-- Column 5 and 7
						when others			=> color_address <= denim_blue;	-- Column 0, 1 and 2
					end case;

				when others =>	-- Row 7
					case column is
						when "000"	=> color_address <= mole_brown;	-- Column 0
						when "010"	=> color_address <= lava;		-- Column 2
						when "110"	=> color_address <= dark_green;	-- Column 5
						when others	=> color_address <= green;		-- Column 1, 3, 6 and 7
					end case;
			end case;		
	
		-- Start 4_1
		when "110100" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "011" 			=> color_address <= dark_green;	-- Column 3
						when "100" | "101"	=> color_address <= mole_brown;	-- Column 4 and 5
						when others			=> color_address <= green;		-- Column 0, 1, 2, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" | "010"	=> color_address <= dark_green;		-- Column 0 and 2
						when "001"			=> color_address <= green;			-- Column 1
						when "011"			=> color_address <= light_yellow;	-- Column 3
						when others			=> color_address <= light_blue;		-- Column 4, 5, 6 and 7
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000"	=> color_address <= green;			-- Column 0
						when "001"	=> color_address <= dark_green;		-- Column 1
						when "010"	=> color_address <= yellow;			-- Column 2
						when "011"	=> color_address <= light_yellow;	-- Column 3
						when "100"	=> color_address <= black;			-- Column 4
						when "111"	=> color_address <= light_blue;		-- Column 7
						when others	=> color_address <= mole_brown;		-- Column 5 and 6
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= dark_green;	-- Column 0
						when "001"			=> color_address <= green;		-- Column 1
						when "010" | "011"	=> color_address <= yellow;		-- Column 2 and 3
						when "101"			=> color_address <= black;		-- Column 5
						when "111"			=> color_address <= light_blue;	-- Column 7
						when others			=> color_address <= mole_brown;	-- Column 4 and 6
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" 	=> color_address <= green;		-- Column 0
						when "001"	=> color_address <= dark_green;	-- Column 1
						when "010"	=> color_address <= orange;		-- Column 2
						when "011"	=> color_address <= yellow;		-- Column 3
						when "100"	=> color_address <= black;		-- Column 4
						when "111"	=> color_address <= light_blue;	-- Column 7
						when others	=> color_address <= mole_brown;	-- Column 5 and 6
					end case;
					
				when "101" =>	-- Row 5
					case column is	
						when "000"			=> color_address <= dark_green;	-- Column 0
						when "001"			=> color_address <= green;		-- Column 1
						when "010" | "011"	=> color_address <= orange;		-- Column 2 and 3
						when "111"			=> color_address <= denim_blue;	-- Column 7
						when others			=> color_address <= mole_brown;	-- Column 4, 5 and 6
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000"			=> color_address <= green;		-- Column 0
						when "001"			=> color_address <= lava;		-- Column 1
						when "010"			=> color_address <= dark_green;	-- Column 2
						when "011"			=> color_address <= orange;		-- Column 3
						when "100" | "101"	=> color_address <= light_blue;	-- Column 4 and 5
						when others			=> color_address <= denim_blue;	-- Column 6 and 7
					end case;
					
				when others =>	-- Row 7
					case column is
						when "010"			=> color_address <= lava;		-- Column 2
						when "100" | "101"	=> color_address <= mole_brown;	-- Column 4 and 5
						when others			=> color_address <= green;		-- Column 0, 1, 3, 6 and 7
					end case;
			end case;
	
		-- Start 4_2
		when "110101" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" | "110" 	=> color_address <= black;		-- Column 2 and 6
						when "011"			=> color_address <= dark_green;	-- Column 3
						when others			=> color_address <= green;		-- Column 0, 1, 4, 5 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000"			=> color_address <= light_blue;	-- Column 0
						when "001"			=> color_address <= mole_brown;	-- Column 1
						when "011" | "101"	=> color_address <= black;		-- Column 3 and 5
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= dark_green;	-- Column 2, 4 and 6
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000"	=> color_address <= light_blue;	-- Column 0
						when "001"	=> color_address <= mole_brown;	-- Column 1
						when "110"	=> color_address <= green;		-- Column 6
						when others	=> color_address <= black;		-- Column 2, 3, 4, 5 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000"	=> color_address <= light_blue;	-- Column 0
						when "111"	=> color_address <= green;		-- Column 7
						when others	=> color_address <= black;		-- Column 1, 2, 3, 4, 5 and 6
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000"	=> color_address <= denim_blue;	-- Column 0
						when "110"	=> color_address <= dark_green;	-- Column 6
						when "111"	=> color_address <= magenta;	-- Column 7
						when others => color_address <= black;		-- Colulmn 1, 2, 3, 4 and 5
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" 	=> color_address <= denim_blue;	-- Column 0
						when "001"	=> color_address <= mole_brown;	-- Column 1
						when "111"	=> color_address <= dark_green;	-- Column 7
						when others	=> color_address <= black;		-- Column 2, 3, 4, 5 and 6
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" 			=> color_address <= denim_blue;	-- Column 0
						when "001"			=> color_address <= mole_brown;	-- Column 1
						when "101" | "111" 	=> color_address <= green;		-- Column 5 and 7
						when others			=> color_address <= black;		-- Column 2, 3, 4 and 6
					end case;
					
				when others =>	-- Row 7
					case column is
						when "001" | "011" 	=> color_address <= black;		-- Column 1 and 3
						when "010"			=> color_address <= lava;		-- Column 2
						when "101"			=> color_address <= dark_green; -- Column 5
						when others			=> color_address <= green;		-- Column 0, 4, 6 and 7
					end case;
			end case;		

		-- Start 5_1
		when "110110" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" | "011"	=> color_address <= mole_brown;	-- Column 2 and 3
						when others			=> color_address <= green;		-- Column 0, 1, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000"	=> color_address <= dark_green;		-- Column 0
						when "001"	=> color_address <= light_yellow;	-- Column 1
						when "111"	=> color_address <= mole_brown;		-- Column 7
						when others	=> color_address <= light_blue;		-- Column 2, 3, 4, 5 and 6
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000"			=> color_address <= yellow;			-- Column 0
						when "001"			=> color_address <= light_yellow;	-- Column 1
						when "010"			=> color_address <= black;			-- Column 2
						when "101" | "110"	=> color_address <= light_blue;		-- Column 5 and 6
						when others			=> color_address <= mole_brown;		-- Column 3, 4 and 7
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000" | "001"	=> color_address <= yellow;		-- Column 0 and 1
						when "010" | "100"	=> color_address <= mole_brown;	-- Column 2 and 4
						when "011"			=> color_address <= black;		-- Column 3
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= light_blue;	-- Column 5 and 6
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000"	=> color_address <= orange;		-- Column 0
						when "001" 	=> color_address <= yellow;		-- Column 1
						when "010" 	=> color_address <= black;		-- Column 2
						when "101"	=> color_address <= light_blue;	-- Column 5
						when "110"	=> color_address <= denim_blue;	-- Column 6
						when "111" 	=> color_address <= dark_green;	-- Column 7
						when others	=> color_address <= mole_brown;	-- Column 3 and 4
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "001"	=> color_address <= orange;		-- Column 0 and 1
						when "101" | "110"	=> color_address <= denim_blue;	-- Column 5 and 6
						when others			=> color_address <= mole_brown;	-- Column 2, 3, 4 and 7
					end case;
							
				when "110" =>	-- Row 6
					case column is
						when "000"			=> color_address <= green;		-- Column 0
						when "001"			=> color_address <= orange;		-- Column 1
						when "010" | "011"	=> color_address <= light_blue;	-- Column 2 and 3
						when "111"			=> color_address <= mole_brown;	-- Column 7
						when others			=> color_address <= denim_blue;	-- Column 3, 4 and 5
					end case;
					
				when others =>	-- Row 7
					case column is
						when "010" | "011"	=> color_address <= mole_brown;	-- Column 2 and 3
						when "101"			=> color_address <= dark_green;	-- Column 5
						when others			=> color_address <= green;		-- Column 0, 1, 4, 6 and 7
					end case;
			end case;
				
		-- Start 5_2
		when "110111" =>
			case row is
				when "000" | "111" =>	-- Row 0 and 7
					case column is
						when "000" | "001" | "110" | "111" 	=> color_address <= green;	-- Column 0, 1, 6 and 7
						when others							=> color_address <= black;	-- Column 2, 3, 4 and 5
					end case;
					
				when "001" => 	-- Row 1
					case column is
						when "000"	=> color_address <= dark_green;	-- Column 0
						when "111"	=> color_address <= green;		-- Column 7
						when others	=> color_address <= black;		-- Column 1, 2, 3, 4, 5 and 6
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "111"	=> color_address <= green;	-- Column 0 and 7
						when others			=> color_address <= black;	-- Column 1, 2, 3, 4, 5 and 6
					end case;
					
				when others =>	-- Row 2, 3, 4 and 5
					color_address <= black;
			end case;
	
		-- Start 6_1
		when "111000" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "011" 			=> color_address <= dark_green;	-- Column 3
						when "110" | "111"	=> color_address <= mole_brown;	-- Column 6 and 7
						when others			=> color_address <= green;		-- Column 0, 1, 2, 4 and 5
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "000" | "010"	=> color_address <= dark_green;		-- Column 0 and 2
						when "001"			=> color_address <= green;			-- Column 1
						when "011" | "100" 	=> color_address <= light_yellow;	-- Column 3 and 4
						when others			=> color_address <= light_blue;		-- Column 5, 6 and 7
					end case;
			
				when "010" =>	-- Row 2
					case column is
						when "000"			=> color_address <= green;			-- Column 0
						when "001"			=> color_address <= dark_green;		-- Column 1
						when "010" | "100"	=> color_address <= light_yellow;	-- Column 2 and 4
						when "011"			=> color_address <= yellow;			-- Column 3
						when "101"			=> color_address <= black;			-- Column 5
						when others			=> color_address <= mole_brown;		-- Column 6 and 7
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000"			=> color_address <= dark_green;	-- Column 0
						when "001" | "010"	=> color_address <= green;		-- Column 1 and 2
						when "011" | "100"	=> color_address <= yellow;		-- Column 3 and 4
						when "110"			=> color_address <= black;		-- Column 6
						when others			=> color_address <= mole_brown;	-- Column 5 and 7
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "000" | "010"	=> color_address <= green;		-- Column 0 and 2
						when "001"			=> color_address <= dark_green;	-- Column 1
						when "011"			=> color_address <= orange;		-- Column 3
						when "100"			=> color_address <= yellow;		-- Column 4
						when "101"			=> color_address <= black;		-- Column 5
						when others			=> color_address <= mole_brown;	-- Column 6 and 7
					end case;

				when "101" =>	-- Row 5
					case column is
						when "000"			=> color_address <= dark_green;	-- Column 0
						when "001"			=> color_address <= green;		-- Column 1
						when "010"			=> color_address <= lava;		-- Column 2
						when "011" | "100"	=> color_address <= orange;		-- Column 3 and 4
						when others			=> color_address <= mole_brown;	-- Column 5, 6 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" 			=> color_address <= green;		-- Column 0
						when "001" | "011"	=> color_address <= lava;		-- Column 1 and 3
						when "010"			=> color_address <= dark_green;	-- Column 2
						when "100"			=> color_address <= orange;		-- Column 4
						when "111"			=> color_address <= denim_blue;	-- Column 7
						when others			=> color_address <= light_blue;	-- Column 5 and 6
					end case;
					
				when others =>	-- Row 7
					case column is
						when "010"			=> color_address <= lava;		-- Column 2
						when "101"			=> color_address <= dark_green;	-- Column 5
						when "110" | "111"	=> color_address <= mole_brown;	-- Column 6 and 7
						when others			=> color_address <= green;		-- Column 0, 1, 3 and 4
					end case;
			end case;
			
		-- Start 6_2
		when "111001" =>
			case row is					
				when "001" =>	-- Row 1
					case column is
						when "000" | "001"	=> color_address <= light_blue;	-- Column 0 and 1
						when "010"			=> color_address <= mole_brown;	-- Column 2
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= black;		-- Column 3, 4, 5 and 6
					end case;
			
				when "010" =>	-- Row 2
					case column is
						when "000" | "001"	=> color_address <= light_blue;	-- Column 0 and 1
						when "010"			=> color_address <= mole_brown;	-- Column 2
						when others			=> color_address <= black;		-- Column 3, 4, 5, 6 and 7
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000" | "001"	=> color_address <= light_blue;	-- Column 0 and 1
						when others			=> color_address <= black;		-- Column 2, 3, 4, 5, 6 and 7
					end case;

				when "100" =>	-- Row 4
					case column is
						when "000" 	=> color_address <= light_blue;	-- Column 0
						when "001"	=> color_address <= denim_blue;	-- Column 1
						when others	=> color_address <= black;		-- Column 2, 3, 4, 5, 6 and 7
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "001"	=> color_address <= denim_blue;	-- Column 0 and 1
						when "010"			=> color_address <= mole_brown;	-- Column 2
						when others			=> color_address <= black;		-- Column 3, 4, 5, 6 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "001"	=> color_address <= denim_blue;	-- Column 0 and 1
						when "010"			=> color_address <= mole_brown;	-- Column 2
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= black;		-- Column 3, 4, 5, and 6
					end case;
					
				when others =>	-- Row 0 and 7
					case column is
						when "000" | "001" | "110" | "111"	=> color_address <= green;	-- Column 0, 1, 6 and 7
						when others							=> color_address <= black;	-- Column 2, 3, 4 and 5
					end case;
			end case;
				
		-- Start 7_1
		when "111010" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "011"	=> color_address <= dark_green;	-- Column 3
						when others	=> color_address <= green;		-- Column 0, 1, 2, 4, 5, 6 and 7
					end case;
					
				when "001" =>	-- Row 1
					case column is
						when "001" | "101" 	=> color_address <= green;			-- Column 1 and 5
						when "011" | "111"	=> color_address <= light_yellow;	-- Column 3 and 7
						when others			=> color_address <= dark_green;		-- Column 0, 2, 4 and 6
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "000"				 	=> color_address <= green;			-- Column 0
						when "001" | "011" | "101"	=> color_address <= dark_green;		-- Column 1, 3 and 5
						when "110"					=> color_address <= yellow;			-- Column 6
						when others					=> color_address <= light_yellow;	-- Column 2, 4 and 7
					end case;
			
				when "011" =>	-- Row 3
					case column is
						when "000" | "100"	=> color_address <= dark_green;		-- Column 0 and 4
						when "011"			=> color_address <= light_yellow;	-- Column 3
						when "110" | "111"	=> color_address <= yellow;			-- Column 6 and 7
						when others			=> color_address <= green;			-- Column 1, 2 and 5
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "001"	=> color_address <= dark_green;	-- Column 1
						when "101" 	=> color_address <= magenta;	-- Column 5
						when "110"	=> color_address <= orange;		-- Column 6
						when "111"	=> color_address <= yellow;		-- Column 7
						when others	=> color_address <= green;		-- Column 0, 2, 3 and 4
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "001" | "100"	=> color_address <= green;		-- Column 1 and 4
						when "010"			=> color_address <= lava;		-- Column 2
						when "110" | "111"	=> color_address <= orange;		-- Column 6 and 7
						when others			=> color_address <= dark_green;	-- Column 0, 3 and 5
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "001" | "011" 	=> color_address <= lava;		-- Column 1 and 3
						when "010" | "110"	=> color_address <= dark_green;	-- Column 2 and 6
						when "111"			=> color_address <= orange;		-- Column 7
						when others			=> color_address <= green;		-- Column 0, 4 and 5
					end case;

				when others =>	-- Row 7
					case column is
						when "010"	=> color_address <= lava;		-- Column 2
						when "101"	=> color_address <= dark_green;	-- Column 5
						when others => color_address <= green;		-- Column 0, 1, 3, 4, 6 and 7
					end case;
			end case;
	
		-- Start 7_2
		when "111011" =>
			case row is	
				when "001" =>	-- Row 1
					case column is
						when "000" | "001" | "010" 	=> color_address <= light_blue;	-- Column 0, 1 and 2
						when "111"					=> color_address <= green;		-- Column 7
						when others					=> color_address <= black;		-- Column 3, 4, 5 and 6
					end case;
					
				when "010" =>	-- Row 2
					case column is
						when "001" | "010"	=> color_address <= mole_brown;	-- Column 1 and 2
						when "011"			=> color_address <= light_blue;	-- Column 3
						when others			=> color_address <= black;		-- Column 0, 4, 5, 6 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "010"	=> color_address <= mole_brown;	-- Column 0 and 2
						when "011"			=> color_address <= light_blue;	-- Column 3
						when others			=> color_address <= black;		-- Column 1, 4, 5, 6 and 7
					end case;
					
				when "100" =>	-- Row 4
					case column is
						when "001" | "010"	=> color_address <= mole_brown;	-- Column 1 and 2
						when "011"			=> color_address <= light_blue;	-- Column 3
						when others			=> color_address <= black;		-- Column 0, 4, 5, 6 and 7
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "001" | "010" 	=> color_address <= mole_brown;	-- Column 0, 1 and 2
						when "011"					=> color_address <= denim_blue;	-- Column 3
						when others					=> color_address <= black;		-- Column 4, 5, 6 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "001"	=> color_address <= light_blue;	-- Column 0 and 1
						when "010"			=> color_address <= denim_blue;	-- Column 2
						when "111"			=> color_address <= green;		-- Column 7
						when others			=> color_address <= black;		-- Column 3, 4, 5 and 6
					end case;
					
				when others =>	-- Row 0 and 7
					case column is
						when "000" | "110" | "111" 	=> color_address <= green;		-- Column 0, 6 and 7
						when "001" | "010"			=> color_address <= mole_brown;	-- Column 1 and 2
						when others					=> color_address <= black;		-- Column 3, 4 and 5
					end case;
			end case;
				
		-- Start 8_2
		when "111100" =>
			case row is	
				when "001" =>	-- Row 1
					case column is
						when "000"	=> color_address <= dark_green;		-- Column 0
						when "010" 	=> color_address <= light_yellow;	-- Column 2
						when "011"	=> color_address <= light_blue;		-- Column 3
						when "111"	=> color_address <= green;			-- Column 7
						when others	=> color_address <= black;			-- Column 1, 4, 5 and 6
					end case;		

				when "010" =>	-- Row 2
					case column is
						when "001"	=> color_address <= yellow;			-- Column 1
						when "010"	=> color_address <= light_yellow;	-- Column 2
						when "100"	=> color_address <= mole_brown;		-- Column 4
						when others	=> color_address <= black;			-- Column 0, 3, 5, 6 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "001" | "010"	=> color_address <= yellow;		-- Column 1 and 2
						when "011"			=> color_address <= mole_brown;	-- Column 3
						when others			=> color_address <= black;		-- Column 0, 4, 5, 6 and 7
					end case;
	
				when "100" =>	-- Row 4
					case column is
						when "001" 	=> color_address <= orange;		-- Column 1
						when "010"	=> color_address <= yellow;		-- Column 2
						when "100"	=> color_address <= mole_brown;	-- Column 4
						when others	=> color_address <= black;		-- Column 0, 3, 5, 6 and 7
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "001" | "010"	=> color_address <= orange;		-- Column 1 and 2
						when "011" | "100"	=> color_address <= mole_brown;	-- Column 3 and 4
						when others			=> color_address <= black;		-- Column 0, 5, 6 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000" | "111"	=> color_address <= green;		-- Column 0 and 7
						when "010"			=> color_address <= orange;		-- Column 2
						when "011"			=> color_address <= light_blue;	-- Column 3
						when others			=> color_address <= black;		-- Column 1, 4, 5 and 6
					end case;
					
				when others =>	-- Row 0 and 7
					case column is
						when "000" | "001" | "110" | "111" 	=> color_address <= green;	-- Column 0, 1, 6 and 7
						when others							=> color_address <= black;	-- Column 2, 3, 4 and 5
					end case;
			end case;				  
				
		-- Letter: E - Light Blue--
		when "111101" =>
			case row is
				when "000" | "001" =>	-- Row 0 and 1
					case column is
						when "000" | "011" | "100" | "101" => color_address <= spirit_blue; -- Column 0, 3, 4 and 5
						when others 						=> color_address <= white; -- Column 1, 2, 6 and 7		
					end case;
					
				when "101" | "110" =>	-- Row 5 and 6
					case column is
						when "000" 	=> color_address <= spirit_blue; -- Column 0
						when others => color_address <= white; -- Column 1, 2, 3, 4, 5, 6 and 7			
					end case;
			
				when "111" =>
					color_address <= spirit_blue;
					
				when others => -- Row 2, 3 and 4
					case column is
						when "000" | "011" | "101" 	=> color_address <= spirit_blue; -- Column 0, 3 and 5
						when others 				=> color_address <= white; -- Column 1, 2, 4, 6 and 7			
					end case;			
			end case;
				
		-- Letter: M - Light Blue --
		when "111110"=>
			case row is
				when "010" | "100" =>	-- Row 2 and 4
					case column is
						when "010" | "011" | "100" 	=> color_address <= white; 			-- Column 2, 3 and 4
						when others 				=> color_address <= spirit_blue; 	-- Column 0, 1, 5, 6 and 7
					end case;
			
				when "011" => -- Row 3
					case column is
						when "011" | "100" | "101" 	=> color_address <= white; 			-- Column 3, 4 and 5
						when others 				=> color_address <= spirit_blue; 	-- Column 0, 1, 2, 6 and 7
					end case;
					
				when "111" =>
					color_address <= spirit_blue;
					
				when others =>	-- Row 0, 1, 5 and 6
					case column is
						when "000" 	=> color_address <= spirit_blue; 	-- Column 0
						when others => color_address <= white; 			-- Column 1, 2, 3, 4, 5, 6 and 7
					end case;
			end case;
				
		-- Player -- 
		when "111111" =>
			case row is
				when "000" =>	-- Row 0
					case column is
						when "010" =>	-- Column 2
							case timer1(5) is
								when '0' 	=> color_address <= bg;
								when others => color_address <= mole_brown;
							end case;
							
						when "011" 	=> color_address <= mole_brown;	-- Column 3
						when "100" =>								-- Column 4
							case timer1(5) is
								when '0' 	=> color_address <= mole_brown;
								when others => color_address <= bg;
							end case;
							
						when others	=> color_address <= bg;	-- Column 0, 1, 5, 6 and 7
					end case;
			
				when "001" =>	-- Row 1
					case column is
						when "000"	=> color_address <= bg;				-- Column 0
						when "001"	=> color_address <= light_yellow;	-- Column 1
						when "111"	=> color_address <= mole_brown;		-- Column 7
						when others	=> color_address <= light_blue;		-- Column 2, 3, 4, 5, and 6
					end case;
			
				when "010" =>	-- Row 2
					case column is
						when "000"			=> color_address <= yellow;			-- Column 0
						when "001"			=> color_address <= light_yellow;	-- Column 1
						when "010"			=> color_address <= black;			-- Column 2
						when "101" | "110"	=> color_address <= light_blue;		-- Column 5 and 6
						when others			=> color_address <= mole_brown;		-- Column 3, 4 and 7
					end case;
					
				when "011" =>	-- Row 3
					case column is
						when "000" | "001"	=> color_address <= yellow;		-- Column 0 and 1
						when "010" | "100"	=> color_address <= mole_brown;	-- Column 2 and 4
						when "011"			=> color_address <= black;		-- Column 3
						when "111"			=> color_address <= bg;			-- Column 7
						when others			=> color_address <= light_blue;	-- Column 5 and 6
					end case;	

				when "100" =>	-- Row 4
					case column is
						when "000"	=> color_address <= orange;		-- Column 0
						when "001"	=> color_address <= yellow;		-- Column 1
						when "010"	=> color_address <= black;		-- Column 2
						when "101"	=> color_address <= light_blue;	-- Column 5
						when "110"	=> color_address <= denim_blue;	-- Column 6
						when "111"	=> color_address <= bg;			-- Column 7
						when others	=> color_address <= mole_brown;	-- Column 3 and 4
					end case;
					
				when "101" =>	-- Row 5
					case column is
						when "000" | "001"	=> color_address <= orange;		-- Column 0 and 1
						when "101" | "110"	=> color_address <= denim_blue;	-- Column 5 and 6
						when others			=> color_address <= mole_brown;	-- Column 2, 3, 4 and 7
					end case;
					
				when "110" =>	-- Row 6
					case column is
						when "000"			=> color_address <= bg;			-- Column 0
						when "001"			=> color_address <= orange;		-- Column 1
						when "010" | "011"	=> color_address <= light_blue;	-- Column 2 and 3
						when "111"			=> color_address <= mole_brown;	-- Column 7
						when others			=> color_address <= denim_blue;	-- Column 4, 5 and 6
					end case;
					
				when others =>	-- Row 7
					case column is
						when "010" =>								-- Column 2
							case timer1(5) is
								when '0' 	=> color_address <= mole_brown;
								when others	=> color_address <= bg;
							end case;
							
						when "011"	=> color_address <= mole_brown;	-- Column 3
						when "100" =>								-- Column 4
							case timer1(5) is
								when '0'	=> color_address <= bg;
								when others	=> color_address <= mole_brown;
							end case;
						
						when others =>	color_address <= bg;		-- Column 0, 1, 5, 6 and 7
					end case;
			end case;
			
		when others => color_address <= magenta; 
	end case; 
	
end if;
end process; 
end behavioural;


