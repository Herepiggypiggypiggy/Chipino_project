library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


-- Architecture of Controlle
architecture behaviour of texture_ctrl is 
	-- Constants: Timings
	constant H_DISPLAY 	: integer := 640;
	constant H_FP 		: integer := 16;
	constant H_SP 		: integer := 96;
	constant H_BP 		: integer := 48;

	constant V_DISPLAY 	: integer := 480;
	constant V_FP 		: integer := 10;
	constant V_SP 		: integer := 2;
	constant V_BP 		: integer := 33;

	-- Constants: For HS and VS intersection
	constant H_MARGIN 		: integer := 40;

	constant pixel_num 		: unsigned(4 downto 0) := "11111"; --31
	constant pixel_tile_data 	: unsigned(2 downto 0) := "111";	--7
	constant pixel_tile 		: unsigned(1 downto 0) := "11";	--3


	constant INFO_LV 		: integer := 1;
	constant INFO_LV_SPACE 		: integer := 1;
	
	-- Signals
	signal Hcount 		: unsigned(9 downto 0);
	signal Vcount 		: unsigned(9 downto 0);

	signal new_Hcount 	: unsigned(9 downto 0);
	signal new_Vcount 	: unsigned(9 downto 0);

	signal new_column 	: unsigned(2 downto 0);
	signal new_row 		: unsigned(2 downto 0);

	signal column 		: unsigned(2 downto 0);
	signal row 		: unsigned(2 downto 0);
	
	signal new_Xposition 	: unsigned(4 downto 0);
	signal new_Yposition 	: unsigned(4 downto 0);
	
	signal Xposition 	: unsigned(4 downto 0);
	signal Yposition 	: unsigned(4 downto 0);
	
	begin
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.
	
	process (clk, Xposition, Yposition, map_data, Xplayer, Yplayer, score, level, energy)
	begin

	--Tile Type selector
	if    (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) + 3) 	then tile_address <= "00" & map_data(71 downto 69);--1
	elsif (Xposition = unsigned(Xplayer) - 1 	and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "00" & map_data(68 downto 66);--2
	elsif (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "00" & map_data(65 downto 63);--3
	elsif (Xposition = unsigned(Xplayer) + 1 	and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "00" & map_data(62 downto 60);--4

	elsif (Xposition = unsigned(Xplayer) - 2 	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(59 downto 57);--5
	elsif (Xposition = unsigned(Xplayer) - 1 	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(56 downto 54);--6
	elsif (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(53 downto 51);--7
	elsif (Xposition = unsigned(Xplayer) + 1 	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(50 downto 48);--8
	elsif (Xposition = unsigned(Xplayer) + 2  	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(47 downto 45);--9

	elsif (Xposition = unsigned(Xplayer) - 3  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(44 downto 42);--10
	elsif (Xposition = unsigned(Xplayer) - 2  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(41 downto 39);--11
	elsif (Xposition = unsigned(Xplayer) - 1  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(38 downto 36);--12
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(35 downto 33);--13
	elsif (Xposition = unsigned(Xplayer) + 2	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(32 downto 30);--14
	elsif (Xposition = unsigned(Xplayer) + 3 	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(29 downto 27);--15

	elsif (Xposition = unsigned(Xplayer) - 2 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(26 downto 24);--16
	elsif (Xposition = unsigned(Xplayer) - 1  	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(23 downto 21);--17
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(20 downto 18);--18
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(17 downto 15);--19
	elsif (Xposition = unsigned(Xplayer) + 2	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(14 downto 12);--20

	elsif (Xposition = unsigned(Xplayer) - 1	and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "00" & map_data(11 downto 9);--21
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "00" & map_data(8 downto 6);--22
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "00" & map_data(5 downto 3);--23
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) - 3) 	then tile_address <= "00" & map_data(2 downto 0);--24
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer)) 	then tile_address <= "11111";--player

	--Energy display--
	elsif (Xposition = 14 + INFO_LV			and Yposition = 0) 			then tile_address <= "01010";--black
	elsif (Xposition = 14 + INFO_LV			and Yposition = 1) 			then tile_address <= "01010";--black
	elsif (Xposition = 14 + INFO_LV			and Yposition = 2) 			then tile_address <= '1' & score(3 downto 0);--energy(0)
	elsif (Xposition = 14 + INFO_LV			and Yposition = 3) 			then tile_address <= '1' & score(7 downto 4);--energy(1)
	elsif (Xposition = 14 + INFO_LV			and Yposition = 4) 			then tile_address <= '1' & score(11 downto 8);--energy(2)
	elsif (Xposition = 14 + INFO_LV			and Yposition = 5) 			then tile_address <= "01010";--black
	elsif (Xposition = 14 + INFO_LV			and Yposition = 6) 			then tile_address <= "01010";--black
	elsif (Xposition = 14 + INFO_LV			and Yposition = 7) 			then tile_address <= "11110";--Y
	elsif (Xposition = 14 + INFO_LV			and Yposition = 8) 			then tile_address <= "01101";--G
	elsif (Xposition = 14 + INFO_LV			and Yposition = 9) 			then tile_address <= "11011";--R
	elsif (Xposition = 14 + INFO_LV			and Yposition = 10) 			then tile_address <= "01100";--E
	elsif (Xposition = 14 + INFO_LV			and Yposition = 11) 			then tile_address <= "01111";--N
	elsif (Xposition = 14 + INFO_LV			and Yposition = 12) 			then tile_address <= "01100";--E
	elsif (Xposition = 14 + INFO_LV			and Yposition = 13) 			then tile_address <= "01010";--black
	elsif (Xposition = 14 + INFO_LV			and Yposition = 14) 			then tile_address <= "01010";--black

	--Black Row--
	elsif (Xposition = 15 + INFO_LV) 							then tile_address <= "01010";--black
	
	--Score display--
	elsif (Xposition = 16 + INFO_LV			and Yposition = 0) 			then tile_address <= "01010";--black
	elsif (Xposition = 16 + INFO_LV			and Yposition = 1) 			then tile_address <= "01010";--black
	elsif (Xposition = 16 + INFO_LV			and Yposition = 2) 			then tile_address <= '1' & score(3 downto 0);--score(0)
	elsif (Xposition = 16 + INFO_LV			and Yposition = 3) 			then tile_address <= '1' & score(7 downto 4);--score(1)
	elsif (Xposition = 16 + INFO_LV			and Yposition = 4) 			then tile_address <= '1' & score(11 downto 8);--score(2)
	elsif (Xposition = 16 + INFO_LV			and Yposition = 5) 			then tile_address <= '1' & score(15 downto 12);--score(3)
	elsif (Xposition = 16 + INFO_LV			and Yposition = 6) 			then tile_address <= "01010";--black
	elsif (Xposition = 16 + INFO_LV			and Yposition = 7) 			then tile_address <= "01010";--black
	elsif (Xposition = 16 + INFO_LV			and Yposition = 8) 			then tile_address <= "01100";--E
	elsif (Xposition = 16 + INFO_LV			and Yposition = 9) 			then tile_address <= "11011";--R
	elsif (Xposition = 16 + INFO_LV			and Yposition = 10) 			then tile_address <= "11010";--O
	elsif (Xposition = 16 + INFO_LV			and Yposition = 11) 			then tile_address <= "01011";--C
	elsif (Xposition = 16 + INFO_LV			and Yposition = 12) 			then tile_address <= "11100";--S
	elsif (Xposition = 16 + INFO_LV			and Yposition = 13) 			then tile_address <= "01010";--black
	elsif (Xposition = 16 + INFO_LV			and Yposition = 14) 			then tile_address <= "01010";--black

	--Black Row--
	elsif (Xposition = 17 + INFO_LV) 							then tile_address <= "01010";--black
	
	--Level display--
	elsif (Xposition = 18 + INFO_LV			and Yposition = 0) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 1) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 2) 			then tile_address <= '1' & level(3 downto 0);--level(0)
	elsif (Xposition = 18 + INFO_LV			and Yposition = 3) 			then tile_address <= '1' & level(7 downto 4);--level(1)
	elsif (Xposition = 18 + INFO_LV			and Yposition = 4) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 5) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 6) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 7) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 8) 			then tile_address <= "01110";--L
	elsif (Xposition = 18 + INFO_LV			and Yposition = 9) 			then tile_address <= "01100";--E
	elsif (Xposition = 18 + INFO_LV			and Yposition = 10) 			then tile_address <= "11101";--V
	elsif (Xposition = 18 + INFO_LV			and Yposition = 11) 			then tile_address <= "01100";--E
	elsif (Xposition = 18 + INFO_LV			and Yposition = 12) 			then tile_address <= "01110";--L
	elsif (Xposition = 18 + INFO_LV			and Yposition = 13) 			then tile_address <= "01010";--black
	elsif (Xposition = 18 + INFO_LV			and Yposition = 14) 			then tile_address <= "01010";--black

	
	else tile_address <= "01010";--BLACK
	end if;
	end process;
	
	process (Hcount, Vcount, row, column, Xposition, Yposition, map_data, Xplayer, Yplayer)
	begin
	if (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_Xposition <= (others => '0');
	else
		if (Hcount(4 downto 0) = pixel_num) then
			new_Xposition <= Xposition + 1;
		else
			new_Xposition <= Xposition;
		end if;
	end if;

	if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1 and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_Yposition <= (others => '0');
	else
		if (Vcount(4 downto 0) = pixel_num and Vcount(1 downto 0) = "11" and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
			new_Yposition <= Yposition + 1;
		else
			new_Yposition <= Yposition;
		end if;
	end if;
	

	--Column selector
	if (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then  -- when not at the end of the H
		new_column <= (others => '0');
	else
		if (Hcount(4 downto 0) = pixel_num) then -- when hcount mod 32 is 31 add start new tile
			new_column <= (others => '0');
		elsif (Hcount(1 downto 0) = pixel_tile) then  -- when hcount mod 4 is 3 add column
			new_column <= column + 1;
		else
			new_column <= column;
		end if;
	end if;

	
	--Row selector
	if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame
		new_row <= (others => '0');
	else
		if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame
			if (Vcount(4 downto 0) = pixel_num and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then -- when Vcount mod 32 is 31 add H is end of line start new tile
				new_row <= (others => '0');
			elsif (Vcount(1 downto 0) = "11" and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then  -- when Vcount mod 4 is 3 and if H is end of line
				new_row <= row + 1;
			else
				new_row <= row;
			end if;
		end if;
	end if;


	--Hcounter COM
	if (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_Hcount <= (others => '0');
	else
		new_Hcount <= Hcount + 1;
	end if;

	--Vcounter COM
	if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1) then
		if (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
			new_Vcount <= (others => '0');
		else
			new_Vcount <= Vcount;
		end if;
	else
		if (Hcount = H_DISPLAY + H_FP + H_MARGIN - 1) then
			new_Vcount <= Vcount + 1;
		else
			new_Vcount <= Vcount;
		end if;
	end if;

	-- VGA done signal
	if (Vcount = V_DISPLAY - 1) then
		vga_done <= '0';
	else
		vga_done <= '1';
	end if;

	end process;


	
	
	-- Process: Sequential
	-- Stores new values of Hcount and Vcount in the register.
	ttt: process(clk)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				--Assign to internal signal
				Hcount <= (others => '0');
				Vcount <= (others => '0');
				
				Xposition <= (others => '0');
				Yposition <= (others => '0');
			
				column <= (others => '0');
				row <= (others => '0');

			else
				--Assign to internal signal
				Hcount <= new_Hcount;
				Vcount <= new_Vcount;
				
				column <= new_column;
				row <= new_row;
			
				Xposition <= new_Xposition;
				Yposition <= new_Yposition;
			end if;
		end if;
	end process;

	--Assign to output signals
	Hcount_out <= Hcount;
	Vcount_out <= Vcount;

	column_out <= std_logic_vector(column);
	row_out <= std_logic_vector(row);
end architecture behaviour;
