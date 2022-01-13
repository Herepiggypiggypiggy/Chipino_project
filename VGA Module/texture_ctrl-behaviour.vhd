library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.parameter_def.all;


-- Architecture of Controller
architecture behaviour of texture_ctrl is
	constant h_display : unsigned(9 downto 0) := "1010000000";	-- 640
	constant h_fp      : unsigned(9 downto 0) := "0000010000";	-- 16
	constant h_sp      : unsigned(9 downto 0) := "0001100000";	-- 96
	constant h_bp      : unsigned(9 downto 0) := "0000110000";	-- 48

	constant v_display : unsigned(9 downto 0) := "0111100000";	-- 480
	constant v_fp      : unsigned(9 downto 0) := "0000001010";	-- 10
	constant v_sp      : unsigned(9 downto 0) := "0000000010";	-- 2
	constant v_bp      : unsigned(9 downto 0) := "0000100001";	-- 33

	constant h_margin  : unsigned(9 downto 0) := "0000101000";	-- 40

	constant pixel_num       : unsigned(4 downto 0) := "11111"; -- 31
	constant pixel_tile_data : unsigned(2 downto 0) := "111";   -- 7
	constant pixel_tile      : unsigned(1 downto 0) := "11";    -- 3

	constant info_lv       : unsigned(4 downto 0) := "00001";	-- 1
	constant info_lv_space : unsigned(4 downto 0) := "00001";	-- 1

	constant visibility_in  : unsigned(21 downto 0) := "0000000000100100000000";	-- 2304
	constant visibility_out : unsigned(21 downto 0) := "0000000001100100000000";	-- 6400
	
	signal hcount : unsigned(9 downto 0);
	signal vcount : unsigned(9 downto 0);

	signal new_hcount : unsigned(9 downto 0);
	signal new_vcount : unsigned(9 downto 0);

	signal new_column : unsigned(2 downto 0);
	signal new_row    : unsigned(2 downto 0);

	signal column : unsigned(2 downto 0);
	signal row    : unsigned(2 downto 0);

	signal new_xposition : unsigned(4 downto 0);
	signal new_yposition : unsigned(4 downto 0);

	signal xposition : unsigned(4 downto 0);
	signal yposition : unsigned(4 downto 0);

	signal frame_count     : unsigned(3 downto 0);
	signal new_frame_count : unsigned(3 downto 0);

	signal timer1     : unsigned(5 downto 0);
	signal timer2     : unsigned(5 downto 0);
	signal new_timer1 : unsigned(5 downto 0);
	signal new_timer2 : unsigned(5 downto 0);

	signal vga_done : std_logic;

	signal hvis     : unsigned(6 downto 0);
	signal new_hvis : unsigned(6 downto 0);

	signal vvis     : unsigned(6 downto 0);
	signal new_vvis : unsigned(6 downto 0);

	signal hvis_start     : unsigned(8 downto 0);
	signal vvis_start     : unsigned(8 downto 0);

	signal tile_address_temp :std_logic_vector(5 downto 0);

	signal p1 : unsigned(13 downto 0);

	signal xr : unsigned(13 downto 0);
	signal yr : unsigned(13 downto 0);

	signal xp : unsigned(6 downto 0);
	signal yp : unsigned(6 downto 0);

	signal xposmxple : signed(5 downto 0);
	signal yposmyple : signed(5 downto 0);

begin
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.
    -- changed:
    -- reduced vvis and hvis to 7 bit counter that counds down halfway so mid point never gets smaller than counters so i dont have to use siged for multiplication
	-- Start screen

	xposmxple <= signed(signed('0' & xposition) - signed("00" & xplayer));
	yposmyple <= signed(signed('0' & yposition) - signed("00" & yplayer));
	
	vvis_start <= ((2 - unsigned(yplayer)) & "11111"); -- start 1 row earlier
	hvis_start <= ((3 - unsigned(xplayer)) & "00000");

	-- mid point of visibility circle
	xp <= "11100" & timer1(5 downto 4);
	yp <= "111000" & timer1(4); 

	xr <= (xp -  hvis) * (xp - hvis);
	yr <= (yp -  vvis) * (yp - vvis);

	p1 <= xr + yr;
	dimmer : process(xposition, yposition, p1, xplayer, yplayer, game_state, timer1)
	begin
		if (xposition < "01111" and game_state = "01") then
			if (p1 > "001100100000000") then
				dim <= "1111";          --6400
			elsif (p1 > "001010101111100") then
				dim <= "1011";          --5500
			elsif (p1 > "001001110001000") then
				dim <= "0111";          --5000
			elsif (p1 > "000111110100000") then
				dim <= "0011";          --4000
			elsif (p1 > "000101010001100") then
				dim <= "0001";          --2304	
			else
				dim <= "0000";
			end if;
		else
			dim <= "0000";
		end if;
	end process dimmer;

	tile_address_corection_RL: process(tile_address_temp, game_state)
	begin
		if (game_state = "01" and tile_address_temp = "000111") then
			tile_address <= "000001";
		else
			tile_address <= tile_address_temp;
		end if;
	end process tile_address_corection_RL;

	tile_select : process(clk, hcount, vcount, xposition, yposition, map_data, xplayer, yplayer, score, level, energy, game_state, frame_count,yposmyple, xposmxple)
	begin
		case game_state is
			-- Gamemode: Begin Screen
			when "00" =>
				case xposition is
					when "00000" | "00001" | "00010" =>			-- X = 0, 1 or 2
						tile_address_temp <= "101110"; 			-- Sky
					
					when "00011" =>								-- X = 3
						case yposition is
							when "00111" =>						-- Y = 7
								tile_address_temp <= "111101"; 	-- E - Light Blue
							when "01000" =>						-- Y = 8
								tile_address_temp <= "001001"; 	-- L - Light Blue
							when "01001" =>						-- Y = 9
								tile_address_temp <= "000111"; 	-- O - Light Blue
							when "01010" =>						-- Y = 10
								tile_address_temp <= "111110"; 	-- M - Light Blue
							when others =>
								tile_address_temp <= "101110"; 	-- Sky
						end case;
						
					when "00100" =>								-- X = 4	
						case yposition is					
							when "00100" =>						-- Y = 4
								tile_address_temp <= "000110"; 	-- R - Light Blue
							when "00101" =>						-- Y = 5
								tile_address_temp <= "111101"; 	-- E - Light Blue
							when "00110" =>						-- Y = 6
								tile_address_temp <= "001000"; 	-- N - Light Blue
							when "00111" =>						-- Y = 7
								tile_address_temp <= "100001"; 	-- I - Light Blue
							when "01000" =>						-- Y = 8
								tile_address_temp <= "111110"; 	-- M - Light Blue
							when others =>
								tile_address_temp <= "101110"; 	-- Sky
						end case;
						
					when "00101" | "00110" | "00111" | "01000" =>	-- X = 5, 6, 7 or 8
						tile_address_temp <= "101110"; 				-- Sky
						
					when "01010" =>									-- X = 10
						case yposition is
							when "00111" =>							-- Y = 7
								tile_address_temp <= "111111";		-- Player
							when others =>
								tile_address_temp <= "101111"; 		-- Grass

						end case;
						
					when "01001" | "01011" | "01100" | "01101" | "01110" =>	-- X = 9, 11, 12, 13 or 14
						tile_address_temp <= "101111"; 						-- Grass
						
					when others =>
						tile_address_temp <= "001010"; 						-- Black
				end case;

			-- Gamemode: Main Game.
			when "01" =>
				--Tile Type selector
				if (xposition < 15) then
					case xposmxple is
						when "111101" =>	-- -3
							case yposmyple is
								when "000000" =>										-- Tile 10
									tile_address_temp <= "000" & map_data(44 downto 42); 
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
							
						when "111110" =>	-- -2
							case yposmyple is
								when "111111" =>										-- Tile 16
									tile_address_temp <= "000" & map_data(26 downto 24);
								when "000000" =>										-- Tile 11
									tile_address_temp <= "000" & map_data(41 downto 39);
								when "000001" =>										-- Tile 5
									tile_address_temp <= "000" & map_data(59 downto 57);
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
							
						when "111111" =>
							case yposmyple is
								when "111110" =>										-- Tile 21
									tile_address_temp <= "000" & map_data(11 downto 9);
								when "111111" =>										-- Tile 17
									tile_address_temp <= "000" & map_data(23 downto 21);
								when "000000" =>										-- Tile 12
									tile_address_temp <= "000" & map_data(38 downto 36);
								when "000001" =>										-- Tile 6
									tile_address_temp <= "000" & map_data(56 downto 54);
								when "000010" =>										-- Tile 2
									tile_address_temp <= "000" & map_data(68 downto 66);
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
					
						when "000000" =>
							case yposmyple is
								when "111101" =>										-- Tile 24
									tile_address_temp <= "000" & map_data(2 downto 0);
								when "111110" =>										-- Tile 22
									tile_address_temp <= "000" & map_data(8 downto 6);
								when "111111" =>										-- Tile 18
									tile_address_temp <= "000" & map_data(20 downto 18);
								when "000000" =>										-- Player
									tile_address_temp <= "111111";
								when "000001" =>										-- Tile 7
									tile_address_temp <= "000" & map_data(53 downto 51);
								when "000010" =>										-- Tile 3
									tile_address_temp <= "000" & map_data(65 downto 63); 
								when "000011" =>										-- Tile 1
									tile_address_temp <= "000" & map_data(71 downto 69); 
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
							
						when "000001" =>
							case yposmyple is
								when "111110" =>										-- Tile 23
									tile_address_temp <= "000" & map_data(5 downto 3);		
								when "111111" =>										-- Tile 19
									tile_address_temp <= "000" & map_data(17 downto 15);
								when "000000" =>										-- Tile 13
									tile_address_temp <= "000" & map_data(35 downto 33);
								when "000001" =>										-- Tile 8
									tile_address_temp <= "000" & map_data(50 downto 48);
								when "000010" =>										-- Tile 4
									tile_address_temp <= "000" & map_data(62 downto 60);
								when others =>
										tile_address_temp <= "001010"; 					-- Black
							end case;
							
						when "000010" =>
							case yposmyple is
								when "111111" =>										-- Tile 20
									tile_address_temp <= "000" & map_data(14 downto 12);
								when "000000" =>										-- Tile 14
									tile_address_temp <= "000" & map_data(32 downto 30);
								when "000001" =>										-- Tile 9
									tile_address_temp <= "000" & map_data(47 downto 45); 
								when others =>
										tile_address_temp <= "001010"; 					-- Black
							end case;
						
						when "000011" =>
							case yposmyple is
								when "000000" =>										-- Tile 15	
									tile_address_temp <= "000" & map_data(29 downto 27);
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
						when others =>
							tile_address_temp <= "001010"; 
					end case;		
				else
					-- Energy display assignment
					case xposition is
						when "01111" =>
							case yposition is
								when "00010" =>											-- 2		
									tile_address_temp <= "01" & energy(3 downto 0); 	-- Energy(0)
								when "00011" =>											-- 3
									tile_address_temp <= "01" & energy(7 downto 4); 	-- Energy(1)
								when "00100" =>											-- 4
									tile_address_temp <= "01" & energy(11 downto 8); 	-- Energy(2)
								when "00111" =>											-- 7
									tile_address_temp <= "011110"; 						-- Y
								when "01000" =>											-- 8
									tile_address_temp <= "001101"; 						-- G
								when "01001" =>											-- 9
									tile_address_temp <= "011011"; 						-- R
								when "01010" =>											-- 10
									tile_address_temp <= "001100"; 						-- E
								when "01011" =>											-- 11
									tile_address_temp <= "001111"; 						-- N
								when "01100" =>											-- 12
									tile_address_temp <= "001100"; 						-- E
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
							
						-- Score display assignment
						when "10001"  =>
							case yposition is
								when "00010" =>											-- 2
									tile_address_temp <= "01" & score(3 downto 0); 		-- Score(0)
								when "00011" =>											-- 3
									tile_address_temp <= "01" & score(7 downto 4); 		-- Score(1)
								when "00100" =>											-- 4
									tile_address_temp <= "01" & score(11 downto 8); 	-- Score(2)
								when "00101" =>											-- 5
									tile_address_temp <= "01" & score(15 downto 12); 	-- Score(3)
								when "01000" =>											-- 8
									tile_address_temp <= "001100"; 						-- E
								when "01001" =>											-- 9
									tile_address_temp <= "011011"; 						-- R
								when "01010" =>											-- 10
									tile_address_temp <= "011010"; 						-- O
								when "01011" =>											-- 11
									tile_address_temp <= "001011"; 						-- C
								when "01100" =>											-- 12
									tile_address_temp <= "011100"; 						-- S
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;

						-- Level display assignment
						when "10011" =>
							case yposition is
								when "00010" =>											-- 2
									tile_address_temp <= "01" & level(3 downto 0);  	-- Level(0)
								when "00011" =>											-- 3
									tile_address_temp <= "01" & level(7 downto 4); 		-- Level(1)
								when "01000" =>											-- 8
									tile_address_temp <= "001110"; 						-- L
								when "01001" =>											-- 9
									tile_address_temp <= "001100"; 						-- E
								when "01010" =>											-- 10
									tile_address_temp <= "011101"; 						-- V
								when "01011" =>											-- 11
									tile_address_temp <= "001100"; 						-- E
								when "01100" =>											-- 12
									tile_address_temp <= "001110"; 						-- L
								when others =>
									tile_address_temp <= "001010"; 						-- Black
							end case;
						when others =>
							tile_address_temp <= "001010"; 								-- Black
					end case;
				end if; 					
				
			-- Gamemode: End screen
			when "10" =>
				case xposition is
					when "00011" =>								-- 3
						case yposition is
							when "00011" =>						-- 3
								tile_address_temp <= "011011"; 	-- R
							when "00100" =>						-- 4
								tile_address_temp <= "001100"; 	-- E
							when "00101" =>						-- 5
								tile_address_temp <= "011101"; 	-- V
							when "00110" =>						-- 6
								tile_address_temp <= "011010"; 	-- O
							when "01000" =>						-- 8
								tile_address_temp <= "001100"; 	-- E
							when "01001" =>						-- 9
								tile_address_temp <= "100000"; 	-- M
							when "01010" =>						-- 10
								tile_address_temp <= "011111"; 	-- A
							when "01011" =>						-- 11
								tile_address_temp <= "001101"; 	-- G
							when others =>
								tile_address_temp <= "001010"; 	-- Black
						end case;
								
					when "00110" =>										-- X = 6
						case yposition is
							when "00111" =>								-- Y = 7
								case frame_count is
									when "0111" =>						-- Frame count = 7
										tile_address_temp <= "101001"; 	-- Soul (first frame)
									when "1000" =>						-- Frame count = 8
										tile_address_temp <= "101010"; 	-- Soul (second frame)
									when "1001" =>						-- Frame count = 9
										tile_address_temp <= "101100"; 	-- Soul (third frame)
									when others =>
										tile_address_temp <= "001010"; 	-- Black
								end case;
							when others =>
								tile_address_temp <= "001010"; 			-- Black
						end case;
							
					when "00111" =>										-- X = 7
						case yposition is
							when "00111" =>								-- Y = 7
								case frame_count is
									when "0000"	=>						-- Frame count = 0
										tile_address_temp <= "111111"; 	-- Player
									when "0001" =>						-- Frame count = 1
										tile_address_temp <= "100010"; 	-- Dying player (first frame)
									when "0010" =>						-- Frame count = 2
										tile_address_temp <= "100011"; 	-- Dying player (second frame)
									when "0011" =>						-- Frame count = 3
										tile_address_temp <= "100100"; 	-- Dying player (third frame)
									when "0100" =>						-- Frame count = 4
										tile_address_temp <= "100101"; 	-- Poof (first frame)
									when "0101" =>						-- Frame count = 5
										tile_address_temp <= "100110"; 	-- Poof (second frame)
									when "0110" =>						-- Frame count = 6
										tile_address_temp <= "100111"; 	-- Poof (third frame)
									when "0111" =>						-- Frame count = 7
										tile_address_temp <= "101000"; 	-- Poof (fourth frame)
									when "1000" =>						-- Frame count = 8
										tile_address_temp <= "100110"; 	-- Poof (second frame)
									when "1001" =>						-- Frame count = 9
										tile_address_temp <= "101011"; 	-- Poof (fifth frame)
									when others =>
										tile_address_temp <= "001010"; 	-- Black
								end case;
							when others =>
								tile_address_temp <= "001010"; 			-- Black
						end case;
					
					when others =>
						tile_address_temp <= "001010"; 					-- Black
				end case;

			-- Start animation
			when "11" =>
				case xposition is
					when "00000" | "00001" | "00010" =>			-- X = 0, 1 or 2
						tile_address_temp <= "101110"; 			-- Sky
					
					when "00011" =>								-- X = 3
						case yposition is
							when "00111" =>						-- Y = 7
								tile_address_temp <= "111101"; 	-- E - Light Blue
							when "01000" =>						-- Y = 8
								tile_address_temp <= "001001"; 	-- L - Light Blue
							when "01001" =>						-- Y = 9
								tile_address_temp <= "000111"; 	-- O - Light Blue
							when "01010" =>						-- Y = 10
								tile_address_temp <= "111110"; 	-- M - Light Blue
							when others =>
								tile_address_temp <= "101110"; 	-- Sky
						end case;
						
					when "00100" =>								-- X = 4	
						case yposition is					
							when "00100" =>						-- Y = 4
								tile_address_temp <= "000110"; 	-- R - Light Blue
							when "00101" =>						-- Y = 5
								tile_address_temp <= "111101"; 	-- E - Light Blue
							when "00110" =>						-- Y = 6
								tile_address_temp <= "001000"; 	-- N - Light Blue
							when "00111" =>						-- Y = 7
								tile_address_temp <= "100001"; 	-- I - Light Blue
							when "01000" =>						-- Y = 8
								tile_address_temp <= "111110"; 	-- M - Light Blue
							when others =>
								tile_address_temp <= "101110"; 	-- Sky
						end case;
						
					when "00101" | "00110" | "00111" | "01000" =>		-- X = 5, 6, 7 or 8
						tile_address_temp <= "101110"; 					-- Sky
						
					when "01001" =>										-- X = 9
						case yposition is
							when "00111" =>								-- Y = 7
								case frame_count is
									when "0000" | "0001" | "0010" =>	-- Frame count = 0, 1 or 2
										tile_address_temp <= "110000"; 	-- Start (first top frame)
									when "0011" =>						-- Frame count = 3
										tile_address_temp <= "110100"; 	-- Start (second top frame)
									when "0100" =>						-- Frame count = 4
										tile_address_temp <= "110110"; 	-- Start (third top frame)
									when "0101" =>						-- Frame count = 5	
										tile_address_temp <= "111000"; 	-- Start (fourth top frame)
									when "0110" =>						-- Frame count = 6
										tile_address_temp <= "111010"; 	-- Start (fifth top frame)
									when others =>
										tile_address_temp <= "101111"; 	-- Grass
								end case;
							when others =>
								tile_address_temp <= "101111"; 			-- Grass
						end case;
						
					when "01010" =>										-- X = 10
						case yposition is
							when "00111" =>								-- Y - 7
								case frame_count is
									when "0000" =>						-- Frame count = 0
										tile_address_temp <= "110001"; 	-- Start (first bottom frame)
									when "0001" =>						-- Frame count = 1
										tile_address_temp <= "110010"; 	-- Start (second bottom frame)
									when "0010" =>						-- Frame count = 2
										tile_address_temp <= "110011"; 	-- Start (third bottom frame)
									when "0011" =>						-- Frame count = 3
										tile_address_temp <= "110101"; 	-- Start (fourth bottom frame)
									when "0100" =>						-- Frame count = 4
										tile_address_temp <= "110111"; 	-- Start (fifth bottom frame)
									when "0101" =>						-- Frame count = 5
										tile_address_temp <= "111001"; 	-- Start (sixth bottom frame)
									when "0110" =>						-- Frame count = 6
										tile_address_temp <= "111011"; 	-- Start (seventh bottom frame)
									when "0111" =>						-- Frame count = 7
										tile_address_temp <= "111100"; 	-- Start (eight bottom frame)
									when "1000" =>						-- Frame count = 8
										tile_address_temp <= "110111"; 	-- Start (fifth bottom frame)
									when others =>
										tile_address_temp <= "101111"; 	-- Grass
								end case;
							when others =>
								tile_address_temp <= "101111"; 			-- Grass
						end case;										
						
					when "01011" | "01100" | "01101" | "01110" =>		-- X = 11, 12, 13 or 14
						tile_address_temp <= "101111"; 					-- Grass
						
					when others =>
						tile_address_temp <= "001010"; 					-- Black
				end case;	

			when others =>
				tile_address_temp <= "000110"; 							-- Black
		end case;
	end process;
	
	-- Process for calculating global tile coordinates
	xposition_process : process(hcount, xposition)
	begin
		if (hcount = h_display + h_fp + h_sp + h_bp - 1) then
			new_xposition <= (others => '0');
		else
			if (hcount(4 downto 0) = pixel_num) then
				new_xposition <= xposition + 1;
			else
				new_xposition <= xposition;
			end if;
		end if;
	end process xposition_process;
	
	-- Process for calculating global tile coordinates
	yposition_process : process(hcount, vcount, yposition)
	begin
		if (vcount = v_display + v_fp + v_sp + v_bp - 1 and hcount = h_display + h_fp + h_sp + h_bp - 1) then
			new_yposition <= (others => '0');
		else
			if (vcount(4 downto 0) = pixel_num and vcount(1 downto 0) = "11" and hcount = h_display + h_fp + h_sp + h_bp - 1) then
				new_yposition <= yposition + 1;
			else
				new_yposition <= yposition;
			end if;
		end if;
	end process yposition_process;

	-- Process for calculating the next column
	column_process : process(hcount, column)
	begin
		if (hcount = h_display + h_fp + h_sp + h_bp - 1) then 	-- when not at the end of the H
			new_column <= (others => '0');
		else
			if (hcount(4 downto 0) = pixel_num) then 			-- when hcount mod 32 equals 31 add start at new tile (reset column to 0)
				new_column <= (others => '0');
			elsif (hcount(1 downto 0) = pixel_tile) then 		-- when hcount mod 4 equals 3 increase column by 1
				new_column <= column + 1;
			else
				new_column <= column;
			end if;
		end if;
	end process column_process;

    -- Process for calculating the next row
	row_process : process(vcount, hcount, row)
	begin
        if (vcount < v_display + v_fp + v_sp + v_bp - 1) then 											-- when not at the end of the total frame
            if (vcount(4 downto 0) = pixel_num and hcount = h_display + h_fp + h_sp + h_bp - 1) then 	-- when vcount mod 32 equals 31 and H is at the end of \
                new_row <= (others => '0');																-- \ the line start at a new tile (reset row to 0)	
            elsif (vcount(1 downto 0) = "11" and hcount = h_display + h_fp + h_sp + h_bp - 1) then 		-- when vcount mod 4 equals 3 and if H is at the end of the line
                new_row <= row + 1;
            else
                new_row <= row;
            end if;
		else
			new_row <= (others => '0');
		end if;
	end process row_process;

	-- Process for calculating the next horizantal pixel position
	hcounter_process : process(hcount)
		begin
			if (hcount < h_display + h_fp + h_sp + h_bp - 1) then
				new_hcount <= hcount + 1;
			else
				new_hcount <= (others => '0');
			end if;
	end process hcounter_process;

	-- Process for calculating the next vertical pixel position
	vcounter_process : process(vcount, hcount)
		begin
			if (hcount = h_display + h_fp + h_margin - 1) then
				if(vcount < v_display + v_fp + v_sp + v_bp - 1) then
					new_vcount <= vcount + 1;
				else
					new_vcount <= (others => '0');
				end if;
		else
			new_vcount <= vcount;
		end if;
	end process vcounter_process;

	-- vga done signal     
	vga_done_process : process(vcount)
	begin
		if (vcount > v_display - 1) then
			vga_done <= '1';
		else
			vga_done <= '0';
		end if;
	end process vga_done_process;

	process(level)
	begin
		if (level_abs < "00000001") then
			bg_select <= "000";
		elsif (level_abs < "00000100") then
			bg_select <= "001";         -- levels 1 to 3
		elsif (level_abs < "00000111") then
			bg_select <= "010";         -- levels 4 to 6
		elsif (level_abs < "00001010") then
			bg_select <= "011";         -- levels 7 to 9
		elsif (level_abs < "00001011") then
			bg_select <= "100";         -- levels 10 to 12
		elsif (level_abs < "00010000") then
			bg_select <= "101";         -- levels 13 to 15
		elsif (level_abs < "00011001") then
			bg_select <= "110";         -- levels 16 to 18
		elsif (level_abs < "00010110") then
			bg_select <= "111";         -- levels 19 to 22
		else
			bg_select <= "111";
		end if;
	end process;

	-- Process: visibility counter H
	process(hcount, xposition, xplayer,hvis, hvis_start)
	begin
		if (unsigned(xplayer) < 4 ) then
			if (hcount = 0) then
				new_hvis <= hvis_start(6 downto 0);
			else
				if (hcount < unsigned('0'&xplayer&"10000")) then	-- hcount > xplayer * 32 + 16
			   		new_hvis <= hvis + 1;
           			else
               				new_hvis <= hvis - 1;
				end if;
			end if;
		else
			if (xposition > unsigned(xplayer) - 4) then
            			if (hcount < unsigned('0'&xplayer&"10000")) then	-- hcount > xplayer * 32 + 16
			   		new_hvis <= hvis + 1;
           			else
               				new_hvis <= hvis - 1;
				end if;
			else
				new_hvis <= (others => '0');
			end if;
		end if;
	end process;

	-- Process: visibility counter V
	process(vcount, yposition, yplayer, vvis,hcount, vvis_start)
	begin
	
		if (hcount = h_display + h_fp + h_sp + h_bp - 1) then
			if (unsigned(yplayer) < 4 ) then
				if (vcount = 0) then
					new_vvis <= vvis_start(6 downto 0);
				else
					if (vcount < unsigned('0'&yplayer&"10000")) then	-- hcount > xplayer * 32 + 16
			   			new_vvis <= vvis + 1;
           				else
               					new_vvis <= vvis - 1;
					end if;
				end if;
			else
				if (yposition > unsigned(yplayer) - 4) then
					if (vcount < unsigned('0'&yplayer&"10000")) then	--vcount > yplayer * 32 + 16
			   			new_vvis <= vvis + 1;
            				else
                				new_vvis <= vvis - 1;
            				end if;
				else
					new_vvis <= (others => '0');
				end if;
			end if;
		else
			new_vvis <= vvis;
		end if;
	end process;

	-- Process: Timer
	process(timer1, timer2)
	begin
		if (timer1 < 63) then
			new_timer1 <= timer1 + 1;
			new_timer2 <= timer2;
		else
			new_timer1 <= (others => '0');
			if (timer2 < 63) then
				new_timer2 <= timer2 + 1;
			else
				new_timer2 <= (others => '0');
			end if;
		end if;
	end process;

	-- Process: Sequential
	process(vga_done, reset)
	begin
		if (reset = '1') then
			timer1 <= (others => '0');
			timer2 <= (others => '0');
		else
			if (rising_edge(vga_done)) then
				timer1 <= new_timer1;
				timer2 <= new_timer2;
			end if;
		end if;
	end process;

	-- Process: Frame Count
	process(frame_count, game_state)
	begin
		case game_state is
			when "10" =>										-- End screen animation
				case frame_count is
					when "1001" =>								-- Frame count = 9
						new_frame_count <= frame_count - 1;
					when others =>
						new_frame_count <= frame_count + 1;
				end case;
				
			when "11" =>										-- Begin screen animation
				case frame_count is
					when "1000" =>								-- Frame count = 8
						new_frame_count <= frame_count - 1;
					when others =>
						new_frame_count <= frame_count + 1;
				end case;
			
			when others =>
				new_frame_count <= frame_count;
		end case;		
	end process;
	
	-- Process: Animation Done Signal
	process(frame_count, game_state)
	begin
		case game_state is
			when "10" =>						-- End screen animation
				case frame_count is
					when "1001" =>				-- Frame count = 9
						animation_done <= '1';
					when others =>
						animation_done <= '0';
				end case;
			
			when "11" =>						-- Begin screen animation
				case frame_count is
					when "1000" =>				-- Frame count = 8
						animation_done <= '1';
					when others =>
						animation_done <= '0';
				end case;
			
			when others =>
				animation_done <= '0';
		end case;				
	end process;

	-- Process: Sequential
	process(reset, timer1)
	begin
		if (reset = '1') then
			frame_count <= "0000";
		else
			if (rising_edge(timer1(4))) then
				frame_count <= new_frame_count;
			end if;
		end if;
	end process;

	-- Stores new values of hcount and vcount in the register.
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				--Assign to internal signal
				hcount <= (others => '0');
				vcount <= (others => '0');

				hvis <= (others => '0');
				vvis <= (others => '0');

				xposition <= (others => '0');
				yposition <= (others => '0');

				column <= (others => '0');
				row    <= (others => '0');

			else
				--Assign to internal signal
				hcount <= new_hcount;
				vcount <= new_vcount;

				hvis <= new_hvis;
				vvis <= new_vvis;

				column <= new_column;
				row    <= new_row;

				xposition <= new_xposition;
				yposition <= new_yposition;
			end if;
		end if;
	end process;

	--Assign to output signals
	hcount_out <= std_logic_vector(hcount);
	vcount_out <= std_logic_vector(vcount);

	vga_done_out 	<= vga_done;
	timer1_out  <= std_logic_vector(timer1);
	timer2_out  <= std_logic_vector(timer2);
	column_out  <= std_logic_vector(column);
	row_out     <= std_logic_vector(row);
end architecture behaviour;




