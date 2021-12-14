library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


-- Architecture of Controlle
architecture behaviour of texture_ctrl is 
	-- Constants: Timings.
	constant H_DISPLAY : integer := 640;
	constant H_FP : integer := 16;
	constant H_SP : integer := 96;
	constant H_BP : integer := 48;

	constant V_DISPLAY : integer := 480;
	constant V_FP : integer := 10;
	constant V_SP : integer := 2;
	constant V_BP : integer := 33;

	-- Constants: For HS and VS intersection
	constant H_MARGIN : integer := 40;

	constant pixel_num : unsigned(4 downto 0) := "11111"; --31
	constant pixel_tile_data : unsigned(2 downto 0) := "111";	--7
	constant pixel_tile : unsigned(1 downto 0) := "11";	--3


	constant INFO_LV : integer := 1;
	constant INFO_LV_SPACE : integer := 1;
	
	-- Signals
	signal Hcount : unsigned(9 downto 0);
	signal Vcount : unsigned(9 downto 0);

	signal new_Hcount : unsigned(9 downto 0);
	signal new_Vcount : unsigned(9 downto 0);

	signal new_column : unsigned(2 downto 0);
	signal new_row : unsigned(2 downto 0);

	signal column : unsigned(2 downto 0);
	signal row : unsigned(2 downto 0);
	
	signal new_Xposition : unsigned(4 downto 0);
	signal new_Yposition : unsigned(4 downto 0);
	
	signal Xposition : unsigned(4 downto 0);
	signal Yposition : unsigned(4 downto 0);

	signal timer1 : unsigned(5 downto 0);
	signal timer2 : unsigned(5 downto 0);
	signal new_timer1 : unsigned(5 downto 0);
	signal new_timer2 : unsigned(5 downto 0);
	
	begin
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.

	-- Start screen
	if (game_state = "00") then
		process (clk, Xposition, Yposition, timer1, timer2)
		begin
		if   (Xposition = 3) then
			if    (Yposition = 4)   then tile_address <= "111111"; --Player
			elsif (Yposition = 5)   then tile_address <= "001100"; --E
			elsif (Yposition = 6)   then tile_address <= "001110"; --L
			elsif (Yposition = 7)   then tile_address <= "011010"; --O
			elsif (Yposition = 10)  then tile_address <= "100000"; --M

			else tile_address <= "001010"; --black
			end if;

		elsif (Xposition = 4) then
			if    (Yposition = 4)   then tile_address <= "011011"; --R
			elsif (Yposition = 6)   then tile_address <= "001100"; --E
			elsif (Yposition = 7)   then tile_address <= "001111"; --N
			elsif (Yposition = 8)   then tile_address <= "100001"; --I
			elsif (Yposition = 9)   then tile_address <= "100000"; --M
			elsif (Yposition = 10)  then tile_address <= "000001"; --Rock

			else tile_address <= "001010"; --black
			end if;

		else tile_address <= "001010"; --black
		end if;
		end process;


	-- In game
	elsif (game_state = "01") then
		process (clk,Xposition,Yposition,map_data,Xplayer,Yplayer,score,level,energy)
		begin

		--Tile Type selector
		if    (Xposition = unsigned(Xplayer) 	 and Yposition = unsigned(Yplayer) + 3)	then tile_address <= "000" & map_data(71 downto 69);--1
		elsif (Xposition = unsigned(Xplayer) - 1 and Yposition = unsigned(Yplayer) + 2)	then tile_address <= "000" & map_data(68 downto 66);--2
		elsif (Xposition = unsigned(Xplayer) 	 and Yposition = unsigned(Yplayer) + 2)	then tile_address <= "000" & map_data(65 downto 63);--3
		elsif (Xposition = unsigned(Xplayer) + 1 and Yposition = unsigned(Yplayer) + 2)	then tile_address <= "000" & map_data(62 downto 60);--4

		elsif (Xposition = unsigned(Xplayer) - 2 and Yposition = unsigned(Yplayer) + 1) then tile_address <= "000" & map_data(59 downto 57);--5
		elsif (Xposition = unsigned(Xplayer) - 1 and Yposition = unsigned(Yplayer) + 1) then tile_address <= "000" & map_data(56 downto 54);--6
		elsif (Xposition = unsigned(Xplayer) 	 and Yposition = unsigned(Yplayer) + 1) then tile_address <= "000" & map_data(53 downto 51);--7
		elsif (Xposition = unsigned(Xplayer) + 1 and Yposition = unsigned(Yplayer) + 1) then tile_address <= "000" & map_data(50 downto 48);--8
		elsif (Xposition = unsigned(Xplayer) + 2 and Yposition = unsigned(Yplayer) + 1) then tile_address <= "000" & map_data(47 downto 45);--9

		elsif (Xposition = unsigned(Xplayer) - 3 and Yposition = unsigned(Yplayer)) 	then tile_address <= "000" & map_data(44 downto 42);--10
		elsif (Xposition = unsigned(Xplayer) - 2 and Yposition = unsigned(Yplayer)) 	then tile_address <= "000" & map_data(41 downto 39);--11
		elsif (Xposition = unsigned(Xplayer) - 1 and Yposition = unsigned(Yplayer)) 	then tile_address <= "000" & map_data(38 downto 36);--12
		elsif (Xposition = unsigned(Xplayer) + 1 and Yposition = unsigned(Yplayer)) 	then tile_address <= "000" & map_data(35 downto 33);--13
		elsif (Xposition = unsigned(Xplayer) + 2 and Yposition = unsigned(Yplayer)) 	then tile_address <= "000" & map_data(32 downto 30);--14
		elsif (Xposition = unsigned(Xplayer) + 3 and Yposition = unsigned(Yplayer)) 	then tile_address <= "000" & map_data(29 downto 27);--15

		elsif (Xposition = unsigned(Xplayer) - 2 and Yposition = unsigned(Yplayer) - 1) then tile_address <= "000" & map_data(26 downto 24);--16
		elsif (Xposition = unsigned(Xplayer) - 1 and Yposition = unsigned(Yplayer) - 1) then tile_address <= "000" & map_data(23 downto 21);--17
		elsif (Xposition = unsigned(Xplayer)	 and Yposition = unsigned(Yplayer) - 1) then tile_address <= "000" & map_data(20 downto 18);--18
		elsif (Xposition = unsigned(Xplayer) + 1 and Yposition = unsigned(Yplayer) - 1) then tile_address <= "000" & map_data(17 downto 15);--19
		elsif (Xposition = unsigned(Xplayer) + 2 and Yposition = unsigned(Yplayer) - 1) then tile_address <= "000" & map_data(14 downto 12);--20

		elsif (Xposition = unsigned(Xplayer) - 1 and Yposition = unsigned(Yplayer) - 2) then tile_address <= "000" & map_data(11 downto 9);--21
		elsif (Xposition = unsigned(Xplayer)	 and Yposition = unsigned(Yplayer) - 2) then tile_address <= "000" & map_data(8 downto 6);--22
		elsif (Xposition = unsigned(Xplayer) + 1 and Yposition = unsigned(Yplayer) - 2) then tile_address <= "000" & map_data(5 downto 3);--23
		elsif (Xposition = unsigned(Xplayer)	 and Yposition = unsigned(Yplayer) - 3) then tile_address <= "000" & map_data(2 downto 0);--24
		elsif (Xposition = unsigned(Xplayer)	 and Yposition = unsigned(Yplayer)) 	then tile_address <= "111111";--player

		--Energy display--
		elsif (Xposition = 14 + INFO_LV) then
			if    (Yposition = 2)  then tile_address <= "01" & score(3 downto 0);--energy(0)
			elsif (Yposition = 3)  then tile_address <= "01" & score(7 downto 4);--energy(1)
			elsif (Yposition = 4)  then tile_address <= "01" & score(11 downto 8);--energy(2)
			elsif (Yposition = 7)  then tile_address <= "011110"; --Y
			elsif (Yposition = 8)  then tile_address <= "001101"; --G
			elsif (Yposition = 9)  then tile_address <= "011011"; --R
			elsif (Yposition = 10) then tile_address <= "001100"; --E
			elsif (Yposition = 11) then tile_address <= "001111"; --N
			elsif (Yposition = 12) then tile_address <= "001100"; --E

			else tile_address <= "001010"; --black
			end if;
	
		--Score display--
		elsif (Xposition = 16 + INFO_LV) then
			if    (Yposition = 2) then tile_address <= "01" & score(3 downto 0);--score(0)
			elsif (Yposition = 3) then tile_address <= "01" & score(7 downto 4);--score(1)
			elsif (Yposition = 4) then tile_address <= "01" & score(11 downto 8);--score(2)
			elsif (Yposition = 5) then tile_address <= "01" & score(15 downto 12);--score(3)
			elsif (Yposition = 8) then tile_address <= "001100"; --E
			elsif (Yposition = 9) then tile_address <= "011011"; --R
			elsif (Yposition = 10) then tile_address <= "011010"; --O
			elsif (Yposition = 11) then tile_address <= "001011"; --C
			elsif (Yposition = 12) then tile_address <= "011100"; --S

			else tile_address <= "001010"; --black
			end if;
	
		--Level display--
		elsif (Xposition = 18 + INFO_LV) then
			if    (Yposition = 2)  then tile_address <= "01" & level(3 downto 0);--level(0)
			elsif (Yposition = 3)  then tile_address <= "01" & level(7 downto 4);--level(1)
			elsif (Yposition = 8)  then tile_address <= "001110"; --L
			elsif (Yposition = 9)  then tile_address <= "001100"; --E
			elsif (Yposition = 10) then tile_address <= "011101"; --V
			elsif (Yposition = 11) then tile_address <= "001100"; --E
			elsif (Yposition = 12) then tile_address <= "001110"; --L

			else tile_address <= "001010"; --black
	
		else tile_address <= "001010";--BLACK
		end if;
		end process;

	
	-- End screen
	elsif (game_state = "10") then
		process (clk, Xposition, Yposition, timer1, timer2)
		begin	

		if (Xposition = 3) then
			if    (Yposition = 3)  then tile_address <= "011011"; --R
			elsif (Yposition = 4)  then tile_address <= "001100"; --E
			elsif (Yposition = 5)  then tile_address <= "011101"; --V
			elsif (Yposition = 6)  then tile_address <= "011010"; --O
			elsif (Yposition = 8)  then tile_address <= "001100"; --E
			elsif (Yposition = 9)  then tile_address <= "100000"; --M
			elsif (Yposition = 10) then tile_address <= "011111"; --A
			elsif (Yposition = 11) then tile_address <= "001101"; --G
		
			else tile_address <= "001010"; --black
			end if;

		else tile_address <= "001010"; --black
		end if;
		end process;

	elsif (game_state = "11") then tile_address <= "000110"

	else tile_address <= "000110"; --black
	end if;

	process (vga_done)
	begin
	if (rising_edge(vga_done)) then
		if (reset = 1) then
			timer1 <= 0;
			timer2 <= 0;
		else
			timer1 <= new_timer1;
			timer2 <= new_timer2;
		end if;
	end if;
	end process;

	process (timer1, timer2)
	begin
	if (timer1 < 63) then
		new_timer1 <= timer1 + 1
	else
		new_timer1 <= 0;
		if (timer2 < 63) then
			new_timer2 <= timer2 + 1;
		else
			new_timer2 <= 0;
		end if;
	end if;
	end process;

	
	process (Hcount,Vcount,row,column,Xposition,Yposition,map_data,Xplayer,Yplayer)
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
	

	--Colum selector
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

	if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame

		if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame
			if (Vcount(4 downto 0) = pixel_num and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then -- when Vcount mod 32 is 31 add H is end of line start new tile

				new_row <= (others => '0');
			elsif (Vcount(1 downto 0) = "11" and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then  -- when Vcount mod 4 is 3 and if H is end of line
				new_row <= row + 1;
			else
				new_row <= row;
			end if;
		end if;
	else
		new_row <= (others => '0');
	end if;


	--Hcounter COM
	if (Hcount < H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_Hcount <= Hcount + 1;
	else
		new_Hcount <= (others => '0');
	end if;

	--Vcounter COM
	if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then
		if (Hcount = H_DISPLAY + H_FP + H_MARGIN - 1) then
			new_Vcount <= Vcount + 1;
		else
			new_Vcount <= Vcount;
		end if;
	else
		if (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
			new_Vcount <= (others => '0');
		else
			new_Vcount <= Vcount;
		end if;
	end if;

	-- VGA done signal
	if (Vcount > V_DISPLAY - 1) then
		vga_done <= '1';
	else
		vga_done <= '0';
	end if;

	end process;

	process(level)
	begin
		if (level = "00000000") then bg_select = "000";
		elsif (level = "00000001" or level(7 downto 1) = "0000001") then bg_select = "001"; -- levels 1 to 3
		elsif (level(7 downto 1) = "0000010" or level = "00000110") then bg_select = "010"; -- levels 4 to 6
		elsif (level = "00000111" or level (7 downto 1) = "0000100") then bg_select = "011"; -- levels 7 to 9
		elsif (level(7 downto 1)= "0001000" or level = "00010010") then bg_select = "100"; -- levels 10 to 12
		elsif (level(7 downto 1)= "0001010" or level = "00010011") then bg_select = "101"; -- levels 13 to 15
		elsif (level(7 downto 1)= "0001011" or level = "00011000") then bg_select = "110"; -- levels 16 to 18
		elsif (level(7 downto 5)= "001" or level = "00011001") then bg_select = "111"; -- levels 19 to 22
		else bg_select = "111";
		end if;
	end process;
	
	
	-- Process: Sequential
	-- Stores new values of Hcount and Vcount in the register.
	process(clk)
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
