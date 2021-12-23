library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.parameter_def.all;

  ---((((make unsigned position values fixed if the compiler it dumb)))--- can be optimized
-- Architecture of Controller
architecture behaviour of texture_ctrl is
	constant h_display : unsigned(9 downto 0) := "1010000000";--640
	constant h_fp      : unsigned(9 downto 0) := "0000010000";--16
    	constant h_sp      : unsigned(9 downto 0) := "0001100000";--96
    	constant h_bp      : unsigned(9 downto 0) := "0000110000";--48

    	constant V_DISPLAY : unsigned(9 downto 0) := "0111100000";--480
    	constant V_FP      : unsigned(9 downto 0) := "0000001010";--10
    	constant V_SP      : unsigned(9 downto 0) := "0000000010";--2
    	constant V_BP      : unsigned(9 downto 0) := "0000100001";--33

    	constant h_margin  : unsigned(9 downto 0) := "0000101000";--40

    	constant pixel_num       : unsigned(4 downto 0) := "11111"; --31
    	constant pixel_tile_data : unsigned(2 downto 0) := "111";   --7
    	constant pixel_tile      : unsigned(1 downto 0) := "11";    --3

    	constant info_lv       : unsigned(4 downto 0) := "00001";--1
    	constant info_lv_SPACE : unsigned(4 downto 0) := "00001";--1

    	constant visibility_in  : unsigned(21 downto 0) := "0000000000100100000000";--2304
    	constant visibility_out : unsigned(21 downto 0) := "0000000001100100000000";--6400
	
	signal hcount : unsigned(9 downto 0);
	signal Vcount : unsigned(9 downto 0);

	signal new_hcount : unsigned(9 downto 0);
	signal new_Vcount : unsigned(9 downto 0);

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

	signal p1 : unsigned(13 downto 0);

	signal xr : unsigned(13 downto 0);
	signal yr : unsigned(13 downto 0);

	signal xp : unsigned(6 downto 0);
	signal yp : unsigned(6 downto 0);

begin
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.
    --changed:
    --reduced vvis and hvis to 7 bit counter that counds down halfway so mid point never gets smaller than counters so i dont have to use siged for multiplication
	-- Start screen
	xp <= "1110000";                   --112
	yp <= "1110000";                   --112

	xr <= (xp -  hvis) * (xp - hvis);
	yr <= (yp -  vvis) * (yp - vvis);

	p1 <= xr + yr;

	dimmer : process(xposition, yposition, p1, xplayer, yplayer, game_state)
	begin
		if (xposition > unsigned(xplayer) - 4 and xposition < "01111" and yposition > unsigned(yplayer) - 4 and game_state = "01") then
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

	tile_select : process(clk, hcount, vcount, xposition, yposition, map_data, xplayer, yplayer, score, level, energy,game_state,frame_count)
	begin
		case game_state is
			-- Begin screen
			when "00" =>
				if (xposition = 3) then
					if (yposition = 4) then
						tile_address <= "111111"; --Player
					elsif (yposition = 7) then
						tile_address <= "111101"; --E - Light Blue
					elsif (yposition = 8) then
						tile_address <= "001001"; --L - Light Blue
					elsif (yposition = 9) then
						tile_address <= "000111"; --O - Light Blue
					elsif (yposition = 10) then
						tile_address <= "111110"; --M - Light Blue
					else
						tile_address <= "001010"; --black
					end if;

				elsif (xposition = 4) then
					if (yposition = 4) then
						tile_address <= "000110"; --R - Light Blue
					elsif (yposition = 5) then
						tile_address <= "111101"; --E - Light Blue
					elsif (yposition = 6) then
						tile_address <= "001000"; --N - Light Blue
					elsif (yposition = 7) then
						tile_address <= "100001"; --I - Light Blue
					elsif (yposition = 8) then
						tile_address <= "111110"; --M - Light Blue
					elsif (yposition = 10) then
						tile_address <= "000001"; --Rock
					else
						tile_address <= "001010"; --black
					end if;
					
				elsif ((xposition = 6 or xposition = 7) and yposition = 7) then
					if (frame_count = 1) then
						if    (xposition = 6) then tile_address <= "110000"; -- Start 1_1
						elsif (xposition = 7) then tile_address <= "110001"; -- Start 1_2
						else			   tile_address <= "001010"; --black
						end if;
						
					elsif (frame_count = 2) then
						if    (xposition = 6) then tile_address <= "110000"; --Start 1_1
						elsif (xposition = 7) then tile_address <= "110010"; --Start 2_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 3) then
						if    (xposition = 6) then tile_address <= "110000"; -- Start 1_1
						elsif (xposition = 7) then tile_address <= "110011"; -- Start 3_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 4) then
						if    (xposition = 6) then tile_address <= "110100"; -- Start 4_1
						elsif (xposition = 7) then tile_address <= "110101"; -- Start 4_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 5) then
						if    (xposition = 6) then tile_address <= "110110"; -- Start 5_1
						elsif (xposition = 7) then tile_address <= "110111"; -- Start 5_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 6) then
						if    (xposition = 6) then tile_address <= "111000"; -- Start 6_1
						elsif (xposition = 7) then tile_address <= "111001"; -- Start 6_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 7) then
						if    (xposition = 6) then tile_address <= "111010"; -- Start 7_1
						elsif (xposition = 7) then tile_address <= "111011"; -- Start 7_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 8) then
						if    (xposition = 6) then tile_address <= "101111"; -- Grass
						elsif (xposition = 7) then tile_address <= "111100"; -- Start 8_2
						else			   tile_address <= "001010"; --black
						end if;

					elsif (frame_count = 9) then
						if    (xposition = 6) then tile_address <= "101111"; -- Grass
						elsif (xposition = 7) then tile_address <= "110111"; -- Start 5_2
						else			   tile_address <= "001010"; --black
						end if;

					else	tile_address <= "001010"; --black
					end if;

				elsif (xposition < 6) then
					tile_address <= "101110"; --Sky

				elsif (xposition > 5) then
					tile_address <= "101111"; -- Grass
				

				else
					tile_address <= "001010"; --black
				end if;

			-- In game
			when "01" =>
				--Tile Type selector
				if (xposition = unsigned(xplayer) and yposition = unsigned(yplayer) + 3) then
					tile_address <= "000" & map_data(71 downto 69); --1
				elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) + 2) then
					tile_address <= "000" & map_data(68 downto 66); --2
				elsif (xposition = unsigned(xplayer) and yposition = unsigned(yplayer) + 2) then
					tile_address <= "000" & map_data(65 downto 63); --3
				elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) + 2) then
					tile_address <= "000" & map_data(62 downto 60); --4

				elsif (xposition = unsigned(xplayer) - 2 and yposition = unsigned(yplayer) + 1) then
					tile_address <= "000" & map_data(59 downto 57); --5
				elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) + 1) then
					tile_address <= "000" & map_data(56 downto 54); --6
				elsif (xposition = unsigned(xplayer) and yposition = unsigned(yplayer) + 1) then
					tile_address <= "000" & map_data(53 downto 51); --7
				elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) + 1) then
					tile_address <= "000" & map_data(50 downto 48); --8
				elsif (xposition = unsigned(xplayer) + 2 and yposition = unsigned(yplayer) + 1) then
					tile_address <= "000" & map_data(47 downto 45); --9

				elsif (xposition = unsigned(xplayer) - 3 and yposition = unsigned(yplayer)) then
					tile_address <= "000" & map_data(44 downto 42); --10
				elsif (xposition = unsigned(xplayer) - 2 and yposition = unsigned(yplayer)) then
					tile_address <= "000" & map_data(41 downto 39); --11
				elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer)) then
					tile_address <= "000" & map_data(38 downto 36); --12
				elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer)) then
					tile_address <= "000" & map_data(35 downto 33); --13
				elsif (xposition = unsigned(xplayer) + 2 and yposition = unsigned(yplayer)) then
					tile_address <= "000" & map_data(32 downto 30); --14
				elsif (xposition = unsigned(xplayer) + 3 and yposition = unsigned(yplayer)) then
					tile_address <= "000" & map_data(29 downto 27); --15

				elsif (xposition = unsigned(xplayer) - 2 and yposition = unsigned(yplayer) - 1) then
					tile_address <= "000" & map_data(26 downto 24); --16
				elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) - 1) then
					tile_address <= "000" & map_data(23 downto 21); --17
				elsif (xposition = unsigned(xplayer) and yposition = unsigned(yplayer) - 1) then
					tile_address <= "000" & map_data(20 downto 18); --18
				elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) - 1) then
					tile_address <= "000" & map_data(17 downto 15); --19
				elsif (xposition = unsigned(xplayer) + 2 and yposition = unsigned(yplayer) - 1) then
					tile_address <= "000" & map_data(14 downto 12); --20

				elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) - 2) then
					tile_address <= "000" & map_data(11 downto 9); --21
				elsif (xposition = unsigned(xplayer) and yposition = unsigned(yplayer) - 2) then
					tile_address <= "000" & map_data(8 downto 6); --22
				elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) - 2) then
					tile_address <= "000" & map_data(5 downto 3); --23
				elsif (xposition = unsigned(xplayer) and yposition = unsigned(yplayer) - 3) then
					tile_address <= "000" & map_data(2 downto 0); --24
				elsif (xposition = unsigned(xplayer) and yposition = unsigned(yplayer)) then
					tile_address <= "111111"; --player

				--Energy display--
				elsif (xposition = 14 + info_lv) then
					if (yposition = 2) then
						tile_address <= "01" & score(3 downto 0); --energy(0)
					elsif (yposition = 3) then
						tile_address <= "01" & score(7 downto 4); --energy(1)
					elsif (yposition = 4) then
						tile_address <= "01" & score(11 downto 8); --energy(2)
					elsif (yposition = 7) then
						tile_address <= "011110"; --Y
					elsif (yposition = 8) then
						tile_address <= "001101"; --G
					elsif (yposition = 9) then
						tile_address <= "011011"; --R
					elsif (yposition = 10) then
						tile_address <= "001100"; --E
					elsif (yposition = 11) then
						tile_address <= "001111"; --N
					elsif (yposition = 12) then
						tile_address <= "001100"; --E
					else
						tile_address <= "001010"; --black
					end if;

				--Score display--
				elsif (xposition = 16 + info_lv) then
					if (yposition = 2) then
						tile_address <= "01" & score(3 downto 0); --score(0)
					elsif (yposition = 3) then
						tile_address <= "01" & score(7 downto 4); --score(1)
					elsif (yposition = 4) then
						tile_address <= "01" & score(11 downto 8); --score(2)
					elsif (yposition = 5) then
						tile_address <= "01" & score(15 downto 12); --score(3)
					elsif (yposition = 8) then
						tile_address <= "001100"; --E
					elsif (yposition = 9) then
						tile_address <= "011011"; --R
					elsif (yposition = 10) then
						tile_address <= "011010"; --O
					elsif (yposition = 11) then
						tile_address <= "001011"; --C
					elsif (yposition = 12) then
						tile_address <= "011100"; --S
					else
						tile_address <= "001010"; --black
					end if;

				--Level display--
				elsif (xposition = 18 + info_lv) then
					if (yposition = 2) then
						tile_address <= "01" & level(3 downto 0); --level(0)
					elsif (yposition = 3) then
						tile_address <= "01" & level(7 downto 4); --level(1)
					elsif (yposition = 8) then
						tile_address <= "001110"; --L
					elsif (yposition = 9) then
						tile_address <= "001100"; --E
					elsif (yposition = 10) then
						tile_address <= "011101"; --V
					elsif (yposition = 11) then
						tile_address <= "001100"; --E
					elsif (yposition = 12) then
						tile_address <= "001110"; --L
					else
						tile_address <= "001010"; --black
					end if;
				else
					tile_address <= "001010"; --BLACK
				end if;

			-- End screen
			when "10" =>
				if (xposition = 3) then
					if (yposition = 3) then
						tile_address <= "011011"; --R
					elsif (yposition = 4) then
						tile_address <= "001100"; --E
					elsif (yposition = 5) then
						tile_address <= "011101"; --V
					elsif (yposition = 6) then
						tile_address <= "011010"; --O
					elsif (yposition = 8) then
						tile_address <= "001100"; --E
					elsif (yposition = 9) then
						tile_address <= "100000"; --M
					elsif (yposition = 10) then
						tile_address <= "011111"; --A
					elsif (yposition = 11) then
						tile_address <= "001101"; --G
					else
						tile_address <= "001010"; --black
					end if;

				-- Death animation
				elsif ((xposition = 6 or xposition = 7) and yposition = "0111") then
					if (frame_count = 0) then
						if (xposition = 7) then
							tile_address <= "111111"; -- Player (main tile)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 1) then
						if (xposition = 7) then
							tile_address <= "100010"; -- Player (first death frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 2) then
						if (xposition = 7) then
							tile_address <= "100011"; -- Player (second death frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 3) then
						if (xposition = 7) then
							tile_address <= "100100"; -- Player (third death frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 4) then
						if (xposition = 7) then
							tile_address <= "100101"; -- Poof (first frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 5) then
						if (xposition = 7) then
							tile_address <= "100110"; -- Poof (second frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 6) then
						if (xposition = 7) then
							tile_address <= "100111"; -- Poof (third frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 7) then
						if (xposition = 6) then
							tile_address <= "101001"; -- Soul (first frame)
						elsif (xposition = 7) then
							tile_address <= "101000"; -- Poof (fourth frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 8) then
						if (xposition = 6) then
							tile_address <= "101010"; -- Soul (second frame)
						elsif (xposition = 7) then
							tile_address <= "100110"; -- Poof (second frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					elsif (frame_count = 9) then
						if (xposition = 6) then
							tile_address <= "101100"; -- Soul (third frame)
						elsif (xposition = 7) then
							tile_address <= "101011"; -- Poof (fifth frame)
						else
							tile_address <= "001010"; -- Black
						end if;

					else
						tile_address <= "001010"; -- Black
					end if;
				else
					tile_address <= "001010"; --black
				end if;

			when "11" => tile_address <= "000110";

			when others => tile_address <= "000110"; --black
		end case;
	end process;
      ---((((mabey make signle constant)))--- can be optimized
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
      ---((((maybe make signal constant)))--- can be optimized
	yposition_process : process(hcount, vcount, yposition)
	begin
		if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1 and hcount = h_display + h_fp + h_sp + h_bp - 1) then
			new_yposition <= (others => '0');
		else
			if (Vcount(4 downto 0) = pixel_num and Vcount(1 downto 0) = "11" and hcount = h_display + h_fp + h_sp + h_bp - 1) then
				new_yposition <= yposition + 1;
			else
				new_yposition <= yposition;
			end if;
		end if;
	end process yposition_process;

	--Column selector   
      ---((((maybe make signal constant)))--- can be optimized
	column_process : process(hcount, column)
	begin
		if (hcount = h_display + h_fp + h_sp + h_bp - 1) then -- when not at the end of the H
			new_column <= (others => '0');
		else
			if (hcount(4 downto 0) = pixel_num) then -- when hcount mod 32 is 31 add start new tile
				new_column <= (others => '0');
			elsif (hcount(1 downto 0) = pixel_tile) then -- when hcount mod 4 is 3 add column
				new_column <= column + 1;
			else
				new_column <= column;
			end if;
		end if;
	end process column_process;

	--Row selector
      ---((((maybe make signal constant)))--- can be optimized
	row_process : process(vcount, hcount, row)
	begin
        if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame
            if (Vcount(4 downto 0) = pixel_num and hcount = h_display + h_fp + h_sp + h_bp - 1) then -- when Vcount mod 32 is 31 add H is end of line start new tile
                new_row <= (others => '0');
            elsif (Vcount(1 downto 0) = "11" and hcount = h_display + h_fp + h_sp + h_bp - 1) then -- when Vcount mod 4 is 3 and if H is end of line
                new_row <= row + 1;
            else
                new_row <= row;
            end if;
		else
			new_row <= (others => '0');
		end if;
	end process row_process;

	--hcounter COM
      ---((((maybe make signal constant)))--- can be optimized
	hcounter_process : process(hcount)
	begin
		if (hcount < h_display + h_fp + h_sp + h_bp - 1) then
			new_hcount <= hcount + 1;
		else
			new_hcount <= (others => '0');
		end if;
	end process hcounter_process;

	--Vcounter COM      
      ---((((maybe make signal constant)))--- can be optimized
	vcounter_process : process(vcount, hcount)
	begin
        if (hcount = h_display + h_fp + h_sp + h_bp - 1) then
			if(Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then
				new_Vcount <= Vcount + 1;
			else
				new_Vcount <= (others => '0');
			end if;
		else
				new_Vcount <= Vcount;
			end if;
	end process vcounter_process;

	-- VGA done signal     
	vga_done_process : process(vcount)
	begin
		if (vcount > V_DISPLAY - 1) then
			vga_done <= '1';
		else
			vga_done <= '0';
		end if;
	end process vga_done_process;

    ---(((USE ABSOLUTE VALUE OF LEVEL)))---
	process(level)
	begin
		if (level = "00000000") then
			bg_select <= "000";
		elsif (level = "00000001" or level(7 downto 1) = "0000001") then
			bg_select <= "001";         -- levels 1 to 3
		elsif (level(7 downto 1) = "0000010" or level = "00000110") then
			bg_select <= "010";         -- levels 4 to 6
		elsif (level = "00000111" or level(7 downto 1) = "0000100") then
			bg_select <= "011";         -- levels 7 to 9
		elsif (level(7 downto 1) = "0001000" or level = "00010010") then
			bg_select <= "100";         -- levels 10 to 12
		elsif (level(7 downto 1) = "0001010" or level = "00010011") then
			bg_select <= "101";         -- levels 13 to 15
		elsif (level(7 downto 1) = "0001011" or level = "00011000") then
			bg_select <= "110";         -- levels 16 to 18
		elsif (level(7 downto 5) = "001" or level = "00011001") then
			bg_select <= "111";         -- levels 19 to 22
		else
			bg_select <= "111";
		end if;
	end process;

	-- Process: visibility counter H
      ---((((yposition > unsigned(yplayer) - 4 and yposition < unsigned(yplayer) + 4) then)))--- can be optimized
	process(hcount, xposition, xplayer,hvis)
	begin
		if (unsigned(xplayer) < 4 ) then
			if (hcount(3 downto 0) = "1111") then
				new_hvis <= (4 - unsigned(xplayer))&"00000";
			else
				if (hcount < unsigned('0'&xplayer&"10000")) then--hcoumt > xplayer * 32 + 16
			   		new_hvis <= hvis + 1;
           			else
               				new_hvis <= hvis - 1;
				end if;
			end if;
		else
			if (xposition > unsigned(xplayer) - 4 and xposition < unsigned(xplayer) + 4) then
            			if (hcount < unsigned('0'&xplayer&"10000")) then--hcoumt > xplayer * 32 + 16
			   		new_hvis <= hvis + 1;
           			else
               				new_hvis <= hvis - 1;
				end if;
			else
				new_hvis <= (others => '0');---mabey not necissery
			end if;
		end if;
	end process;

	-- Process: visibility counter V
    ---((((yposition > unsigned(yplayer) - 4 and yposition < unsigned(yplayer) + 4) then)))--- can be optimized
	process(vcount, yposition, yplayer, vvis,hcount)
	begin
	
		if (hcount = h_display + h_fp + h_sp + h_bp - 1) then
			if (unsigned(yplayer) < 4 ) then
				if (vcount(3 downto 0) = "1111") then
					--new_vvis <= ((4 - unsigned(yplayer))&"00000")(6 downto 0);---still needs to be fixed
				else
					if (vcount < unsigned('0'&yplayer&"10000")) then--hcoumt > xplayer * 32 + 16
			   			new_vvis <= vvis + 1;
           				else
               					new_vvis <= vvis - 1;
					end if;
				end if;
			else
				if (yposition > unsigned(yplayer) - 4 and yposition < unsigned(yplayer) + 4) then
					if (vcount < unsigned('0'&yplayer&"10000")) then--vcoumt > yplayer * 32 + 16
			   			new_vvis <= vvis + 1;
            				else
                				new_vvis <= vvis - 1;
            				end if;
				else
					new_vvis <= (others => '0');---mabey not necissery 12544
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
		if (game_state="10") then
			if (frame_count = "1001") then
					new_frame_count <= frame_count - 1;
			else
					new_frame_count <= frame_count + 1;
			end if;
		elsif (game_state="00") then
			if (frame_count = "1001") then
					new_frame_count <= frame_count - 1;
			else
					new_frame_count <= frame_count + 1;
			end if;
		else
			new_frame_count <= (others => '0');
		end if;
	end process;
	
	-- Process: Animation Done Signal
	process(frame_count, game_state)
	begin
		-- Begin screen
		if (game_state="00") then
			if (frame_count = "1001") then
				animation_done <= "1";
			else
				animation_done <= "0";
			end if;
		elsif (game_state = "10") then
			if (frame_count = "1001") then
				animation_done <= "1";
			else
				animation_done <= "0";
			end if;
		else
			animation_done <= "0";
		end if;
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

	-- Stores new values of hcount and Vcount in the register.
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				--Assign to internal signal
				hcount <= (others => '0');
				Vcount <= (others => '0');

				hvis <= (others => '0');
				vvis <= (others => '0');

				xposition <= (others => '0');
				yposition <= (others => '0');

				column <= (others => '0');
				row    <= (others => '0');

			else
				--Assign to internal signal
				hcount <= new_hcount;
				Vcount <= new_Vcount;

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
	hcount_out <= hcount;
	Vcount_out <= Vcount;

	vga_done_out <= vga_done;
	timer1_out   <= timer1;
	timer2_out   <= timer2;
	column_out   <= std_logic_vector(column);
	row_out      <= std_logic_vector(row);
end architecture behaviour;




