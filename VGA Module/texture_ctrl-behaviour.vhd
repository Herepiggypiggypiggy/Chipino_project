library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Architecture of Controlle
architecture behaviour of texture_ctrl is 
	-- Constants: Timings.
	constant h_display : integer := 640;
	constant h_fp : integer := 16;
	constant h_sp : integer := 96;
	constant h_bp : integer := 48;

	constant V_DISPLAY : integer := 480;
	constant V_FP : integer := 10;
	constant V_SP : integer := 2;
	constant V_BP : integer := 33;

	-- Constants: For HS and VS intersection
	constant H_MARGIN : integer := 40;

	constant pixel_num : unsigned(4 downto 0) := "11111"; --31
	constant pixel_tile_data : unsigned(2 downto 0) := "111";	--7
	constant pixel_tile : unsigned(1 downto 0) := "11";	--3


	constant info_lv : integer := 1;
	constant info_lv_SPACE : integer := 1;
	
	-- Signals
	signal hcount : unsigned(9 downto 0);
	signal Vcount : unsigned(9 downto 0);

	signal new_hcount : unsigned(9 downto 0);
	signal new_Vcount : unsigned(9 downto 0);

	signal new_column : unsigned(2 downto 0);
	signal new_row : unsigned(2 downto 0);

	signal column : unsigned(2 downto 0);
	signal row : unsigned(2 downto 0);
	
	signal new_xposition : unsigned(4 downto 0);
	signal new_yposition : unsigned(4 downto 0);
	
	signal xposition : unsigned(4 downto 0);
	signal yposition : unsigned(4 downto 0);

	signal timer1 : unsigned(5 downto 0);
	signal timer2 : unsigned(5 downto 0);
	signal new_timer1 : unsigned(5 downto 0);
	signal new_timer2 : unsigned(5 downto 0);
	
	signal vga_done : std_logic;

	signal p1 : unsigned(21 downto 0);
	signal p2 : unsigned(21 downto 0);

	signal vis 	: unsigned(21 downto 0);
	signal vis1 	: unsigned(21 downto 0);
	
	signal xr 	: signed(21 downto 0);
	signal yr 	: signed(21 downto 0);

	signal xp 	: signed(10
 downto 0);
	signal xp1 	: signed(10 downto 0);

	signal yp 	: signed(10 downto 0);
	signal yp1 	: signed(10 downto 0);

	signal hsigned 	: signed(10 downto 0);
	signal vsigned 	: signed(10 downto 0);
	begin
	
	

	dimmer: process(hcount,vcount,xposition,yposition,xplayer,yplayer)
	begin
		hsigned <= signed('0' & hcount);
		vsigned <= signed('0' & vcount);

		xp1 <= signed("0000000" & unsigned(xplayer));
		yp1 <= signed("0000000" & unsigned(yplayer));

		xp <= shift_left(xp1,5) + 16;
		yp <= shift_left(yp1,5) + 16;

		
		xr <= (xp - hsigned) * (xp - hsigned);
		yr <= (yp - vsigned) * (yp - vsigned);

		p1 <= unsigned(xr + yr);
		p2 <= vis1 - p1;
		vis <= "0000000000100100000000";--(32+16)^2 2304
		vis1 <= "0000000001100100000000";--(32+16+32)^2 6400
		if (vis < p1 and p1 <= vis1) then
			if 	(p2 < "0000000000010000000000") then --1024
				dim <= "1110";
			elsif 	(p2 < "0000000000100000000000") then --2048
				dim <= "1000";
			elsif 	(p2 < "0000000000110000000000") then --3072
				dim <= "0100";
			else
				dim <= "0010";
			end if;
		else
			dim <= "0000";
		end if;
		
	end process dimmer;

	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.

	-- Start screen
	process(clk,xposition,yposition,map_data,xplayer,yplayer,score,level,energy)
	begin
	case game_state is 
	when "00" =>
		if   (xposition = 3) then
			if    (yposition = 4)   then tile_address <= "111111"; --Player
			elsif (yposition = 5)   then tile_address <= "001100"; --E
			elsif (yposition = 6)   then tile_address <= "001110"; --L
			elsif (yposition = 7)   then tile_address <= "011010"; --O
			elsif (yposition = 10)  then tile_address <= "100000"; --M

			else tile_address <= "001010"; --black
			end if;

		elsif (xposition = 4) then
			if    (yposition = 4)   then tile_address <= "011011"; --R
			elsif (yposition = 6)   then tile_address <= "001100"; --E
			elsif (yposition = 7)   then tile_address <= "001111"; --N
			elsif (yposition = 8)   then tile_address <= "100001"; --I
			elsif (yposition = 9)   then tile_address <= "100000"; --M
			elsif (yposition = 10)  then tile_address <= "000001"; --Rock

			else tile_address <= "001010"; --black
			end if;

		else tile_address <= "001010"; --black
		end if;


		-- In game
	when "01" =>
		--Tile Type selector
		if    (xposition = unsigned(xplayer) 	 and yposition = unsigned(yplayer) + 3)	then tile_address <= "000" & map_data(71 downto 69);--1
		elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) + 2)	then tile_address <= "000" & map_data(68 downto 66);--2
		elsif (xposition = unsigned(xplayer) 	 and yposition = unsigned(yplayer) + 2)	then tile_address <= "000" & map_data(65 downto 63);--3
		elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) + 2)	then tile_address <= "000" & map_data(62 downto 60);--4

		elsif (xposition = unsigned(xplayer) - 2 and yposition = unsigned(yplayer) + 1) then tile_address <= "000" & map_data(59 downto 57);--5
		elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) + 1) then tile_address <= "000" & map_data(56 downto 54);--6
		elsif (xposition = unsigned(xplayer) 	 and yposition = unsigned(yplayer) + 1) then tile_address <= "000" & map_data(53 downto 51);--7
		elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) + 1) then tile_address <= "000" & map_data(50 downto 48);--8
		elsif (xposition = unsigned(xplayer) + 2 and yposition = unsigned(yplayer) + 1) then tile_address <= "000" & map_data(47 downto 45);--9

		elsif (xposition = unsigned(xplayer) - 3 and yposition = unsigned(yplayer)) 	then tile_address <= "000" & map_data(44 downto 42);--10
		elsif (xposition = unsigned(xplayer) - 2 and yposition = unsigned(yplayer)) 	then tile_address <= "000" & map_data(41 downto 39);--11
		elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer)) 	then tile_address <= "000" & map_data(38 downto 36);--12
		elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer)) 	then tile_address <= "000" & map_data(35 downto 33);--13
		elsif (xposition = unsigned(xplayer) + 2 and yposition = unsigned(yplayer)) 	then tile_address <= "000" & map_data(32 downto 30);--14
		elsif (xposition = unsigned(xplayer) + 3 and yposition = unsigned(yplayer)) 	then tile_address <= "000" & map_data(29 downto 27);--15

		elsif (xposition = unsigned(xplayer) - 2 and yposition = unsigned(yplayer) - 1) then tile_address <= "000" & map_data(26 downto 24);--16
		elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) - 1) then tile_address <= "000" & map_data(23 downto 21);--17
		elsif (xposition = unsigned(xplayer)	 and yposition = unsigned(yplayer) - 1) then tile_address <= "000" & map_data(20 downto 18);--18
		elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) - 1) then tile_address <= "000" & map_data(17 downto 15);--19
		elsif (xposition = unsigned(xplayer) + 2 and yposition = unsigned(yplayer) - 1) then tile_address <= "000" & map_data(14 downto 12);--20

		elsif (xposition = unsigned(xplayer) - 1 and yposition = unsigned(yplayer) - 2) then tile_address <= "000" & map_data(11 downto 9);--21
		elsif (xposition = unsigned(xplayer)	 and yposition = unsigned(yplayer) - 2) then tile_address <= "000" & map_data(8 downto 6);--22
		elsif (xposition = unsigned(xplayer) + 1 and yposition = unsigned(yplayer) - 2) then tile_address <= "000" & map_data(5 downto 3);--23
		elsif (xposition = unsigned(xplayer)	 and yposition = unsigned(yplayer) - 3) then tile_address <= "000" & map_data(2 downto 0);--24
		elsif (xposition = unsigned(xplayer)	 and yposition = unsigned(yplayer)) 	then tile_address <= "111111";--player

		--Energy display--
		elsif (xposition = 14 + info_lv) then
			if    (yposition = 2)  then tile_address <= "01" & score(3 downto 0);--energy(0)
			elsif (yposition = 3)  then tile_address <= "01" & score(7 downto 4);--energy(1)
			elsif (yposition = 4)  then tile_address <= "01" & score(11 downto 8);--energy(2)
			elsif (yposition = 7)  then tile_address <= "011110"; --Y
			elsif (yposition = 8)  then tile_address <= "001101"; --G
			elsif (yposition = 9)  then tile_address <= "011011"; --R
			elsif (yposition = 10) then tile_address <= "001100"; --E
			elsif (yposition = 11) then tile_address <= "001111"; --N
			elsif (yposition = 12) then tile_address <= "001100"; --E

			else tile_address <= "001010"; --black
			end if;
	
		--Score display--
		elsif (xposition = 16 + info_lv) then
			if    (yposition = 2) then tile_address <= "01" & score(3 downto 0);--score(0)
			elsif (yposition = 3) then tile_address <= "01" & score(7 downto 4);--score(1)
			elsif (yposition = 4) then tile_address <= "01" & score(11 downto 8);--score(2)
			elsif (yposition = 5) then tile_address <= "01" & score(15 downto 12);--score(3)
			elsif (yposition = 8) then tile_address <= "001100"; --E
			elsif (yposition = 9) then tile_address <= "011011"; --R
			elsif (yposition = 10) then tile_address <= "011010"; --O
			elsif (yposition = 11) then tile_address <= "001011"; --C
			elsif (yposition = 12) then tile_address <= "011100"; --S

			else tile_address <= "001010"; --black
			end if;
	
		--Level display--
		elsif (xposition = 18 + info_lv) then
			if    (yposition = 2)  then tile_address <= "01" & level(3 downto 0);--level(0)
			elsif (yposition = 3)  then tile_address <= "01" & level(7 downto 4);--level(1)
			elsif (yposition = 8)  then tile_address <= "001110"; --L
			elsif (yposition = 9)  then tile_address <= "001100"; --E
			elsif (yposition = 10) then tile_address <= "011101"; --V
			elsif (yposition = 11) then tile_address <= "001100"; --E
			elsif (yposition = 12) then tile_address <= "001110"; --L

			else tile_address <= "001010"; --black
		end if;
		else tile_address <= "001010";--BLACK
		end if;

	
	-- End screen
	when "10" =>
		if (xposition = 3) then
			if    (yposition = 3)  then tile_address <= "011011"; --R
			elsif (yposition = 4)  then tile_address <= "001100"; --E
			elsif (yposition = 5)  then tile_address <= "011101"; --V
			elsif (yposition = 6)  then tile_address <= "011010"; --O
			elsif (yposition = 8)  then tile_address <= "001100"; --E
			elsif (yposition = 9)  then tile_address <= "100000"; --M
			elsif (yposition = 10) then tile_address <= "011111"; --A
			elsif (yposition = 11) then tile_address <= "001101"; --G
		
			else tile_address <= "001010"; --black
			end if;

		else tile_address <= "001010"; --black
		end if;
	when "11" => tile_address <= "000110";

	when others => tile_address <= "000110"; --black
	end case;
	
	if (hcount = h_display + h_fp + h_sp + h_bp - 1) then
		new_xposition <= (others => '0');
	else
		if (hcount(4 downto 0) = pixel_num) then
			new_xposition <= xposition + 1;
		else
			new_xposition <= xposition;
		end if;
	end if;

	if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1 and hcount = h_display + h_fp + h_sp + h_bp - 1) then
		new_yposition <= (others => '0');
	else
		if (Vcount(4 downto 0) = pixel_num and Vcount(1 downto 0) = "11" and hcount = h_display + h_fp + h_sp + h_bp - 1) then
			new_yposition <= yposition + 1;
		else
			new_yposition <= yposition;
		end if;
	end if;
	

	--Colum selector
	if (hcount = h_display + h_fp + h_sp + h_bp - 1) then  -- when not at the end of the H
		new_column <= (others => '0');
	else
		if (hcount(4 downto 0) = pixel_num) then -- when hcount mod 32 is 31 add start new tile
			new_column <= (others => '0');
		elsif (hcount(1 downto 0) = pixel_tile) then  -- when hcount mod 4 is 3 add column
			new_column <= column + 1;
		else
			new_column <= column;
		end if;
	end if;

	
	--Row selector

	if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame

		if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then -- when not at the end of the total frame
			if (Vcount(4 downto 0) = pixel_num and hcount = h_display + h_fp + h_sp + h_bp - 1) then -- when Vcount mod 32 is 31 add H is end of line start new tile

				new_row <= (others => '0');
			elsif (Vcount(1 downto 0) = "11" and hcount = h_display + h_fp + h_sp + h_bp - 1) then  -- when Vcount mod 4 is 3 and if H is end of line
				new_row <= row + 1;
			else
				new_row <= row;
			end if;
		end if;
	else
		new_row <= (others => '0');
	end if;


	--hcounter COM
	if (hcount < h_display + h_fp + h_sp + h_bp - 1) then
		new_hcount <= hcount + 1;
	else
		new_hcount <= (others => '0');
	end if;

	--Vcounter COM
	if (Vcount < V_DISPLAY + V_FP + V_SP + V_BP - 1) then
		if (hcount = h_display + h_fp + H_MARGIN - 1) then
			new_Vcount <= Vcount + 1;
		else
			new_Vcount <= Vcount;
		end if;
	else
		if (hcount = h_display + h_fp + h_sp + h_bp - 1) then
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
		if (level = "00000000") then bg_select <= "000";
		elsif (level = "00000001" or level(7 downto 1) = "0000001") then bg_select <= "001"; -- levels 1 to 3
		elsif (level(7 downto 1) = "0000010" or level = "00000110") then bg_select <= "010"; -- levels 4 to 6
		elsif (level = "00000111" or level (7 downto 1) = "0000100") then bg_select <= "011"; -- levels 7 to 9
		elsif (level(7 downto 1)= "0001000" or level = "00010010") then bg_select <= "100"; -- levels 10 to 12
		elsif (level(7 downto 1)= "0001010" or level = "00010011") then bg_select <= "101"; -- levels 13 to 15
		elsif (level(7 downto 1)= "0001011" or level = "00011000") then bg_select <= "110"; -- levels 16 to 18
		elsif (level(7 downto 5)= "001" or level = "00011001") then bg_select <= "111"; -- levels 19 to 22
		else bg_select <= "111";
		end if;
	end process;
	
	
	-- Process: Timer
	process (timer1, timer2)
	begin
	if (timer1 < 63) then
		new_timer1 <= timer1 + 1;
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
	process (vga_done,reset)
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
	
	-- Stores new values of hcount and Vcount in the register.
	process(clk)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				--Assign to internal signal
				hcount <= (others => '0');
				Vcount <= (others => '0');
				
				xposition <= (others => '0');
				yposition <= (others => '0');
			
				column <= (others => '0');
				row <= (others => '0');

			else
				--Assign to internal signal
				hcount <= new_hcount;
				Vcount <= new_Vcount;
				
				column <= new_column;
				row <= new_row;
			
				xposition <= new_xposition;
				yposition <= new_yposition;
			end if;
		end if;
	end process;

	--Assign to output signals
	hcount_out <= hcount;
	Vcount_out <= Vcount;
	
	vga_done_out <= vga_done;
	timer1_out <= timer1;
	timer2_out <= timer2;
	column_out <= std_logic_vector(column);
	row_out <= std_logic_vector(row);
end architecture behaviour;
