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

	constant pixel_num : integer := 16;
	
	-- Signals
	signal new_Hcount : unsigned(9 downto 0) := (others => '0');
	signal new_Vcount : unsigned(9 downto 0) := (others => '0');
	
	signal Hcount : unsigned(9 downto 0) := (others => '0');
	signal Vcount : unsigned(9 downto 0) := (others => '0');

	signal Xposition : unsigned(3 downto 0) := (others => '0');
	signal Yposition : unsigned(3 downto 0) := (others => '0');
	
	signal new_Xposition : unsigned(3 downto 0) := (others => '0');
	signal new_Yposition : unsigned(3 downto 0) := (others => '0');
	
	begin
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.
	process (Hcount,Vcount,Xposition,Yposition,Xplayer,Yplayer)
	begin
	

	--Tile Type selector
	if    (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) - 3) 	then tile_address <= "00" & map_data(71 downto 69);
	elsif (Xposition = unsigned(Xplayer) - 1 	and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "00" & map_data(68 downto 66);
	elsif (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "00" & map_data(65 downto 63);
	elsif (Xposition = unsigned(Xplayer) + 1 	and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "00" & map_data(62 downto 60);
	elsif (Xposition = unsigned(Xplayer) - 2 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(59 downto 57);
	elsif (Xposition = unsigned(Xplayer) - 1 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(56 downto 54);
	elsif (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(53 downto 51);
	elsif (Xposition = unsigned(Xplayer) + 1 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(50 downto 48);
	elsif (Xposition = unsigned(Xplayer) + 2  	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "00" & map_data(47 downto 45);
	elsif (Xposition = unsigned(Xplayer) - 3  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(44 downto 42);
	elsif (Xposition = unsigned(Xplayer) - 2  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(41 downto 39);
	elsif (Xposition = unsigned(Xplayer) - 1  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(38 downto 36);
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(35 downto 33);
	elsif (Xposition = unsigned(Xplayer) + 2	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(32 downto 30);
	elsif (Xposition = unsigned(Xplayer) + 3 	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(29 downto 27);
	elsif (Xposition = unsigned(Xplayer) - 2 	and Yposition = unsigned(Yplayer)) 	then tile_address <= "00" & map_data(26 downto 24);
	elsif (Xposition = unsigned(Xplayer) - 1  	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(23 downto 21);
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(20 downto 18);
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(17 downto 15);
	elsif (Xposition = unsigned(Xplayer) + 2	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "00" & map_data(14 downto 12);
	elsif (Xposition = unsigned(Xplayer) - 1	and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "00" & map_data(11 downto 9);
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "00" & map_data(8 downto 6);
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "00" & map_data(5 downto 3);
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) + 3) 	then tile_address <= "00" & map_data(2 downto 0);
	else tile_address <= "00" & map_data(2 downto 0);
	end if;

	--Colum selector
	case to_integer(Hcount) mod pixel_num is
		when 0 => 	column <= "00000";
			  	new_Xposition <= Xposition + 1;
		when 1 	=> column <= "00001";
		when 2 	=> column <= "00010";
		when 3 	=> column <= "00011";
		when 4 	=> column <= "00100";
		when 5 	=> column <= "00101";
		when 6 	=> column <= "00110";
		when 7 	=> column <= "00111";
		when 8 	=> column <= "01000";
		when 9 	=> column <= "01001";
		when 10 => column <= "01011";
		when 11 => column <= "01111";
		when 12 => column <= "10000";
		when 13 => column <= "10001";
		when 14 => column <= "10011";
		when 15 => column <= "10111";
		when others => 	column 	<= (others => '0');
			       	new_Xposition <= Xposition;
	end case;


	--Row selector
	case to_integer(Vcount) mod pixel_num is
		when 0 	=> 	row <= "00000";
			 	new_Yposition <= Yposition + 1;
		when 1 	=> row <= "00001";
		when 2 	=> row <= "00010";
		when 3 	=> row <= "00011";
		when 4 	=> row <= "00100";
		when 5 	=> row <= "00101";
		when 6 	=> row <= "00110";
		when 7 	=> row <= "00111";
		when 8 	=> row <= "01000";
		when 9 	=> row <= "01001";
		when 10 => row <= "01011";
		when 11 => row <= "01111";
		when 12 => row <= "10000";
		when 13 => row <= "10001";
		when 14 => row <= "10011";
		when 15 => row <= "10111";
		when others => 	row <= (others => '0');
				new_Yposition <= Yposition;
	end case;
	
	
	--Hcounter COM
	if 	(Hcount < H_DISPLAY + H_FP + H_SP + H_BP) then
			  new_Hcount <= Hcount + 1;

	else
			  new_Hcount <= (others => '0');
	end if;

	--Vcounter COM
	if 	(Hcount > H_DISPLAY + H_FP and Hcount <= H_DISPLAY + H_FP + H_SP) then --HSync_pulse
		if 	(Hcount = 	H_DISPLAY + H_FP + H_MARGIN) then
					new_Vcount <= Vcount + 1;

		elsif 	(Vcount > V_DISPLAY + V_FP + V_SP + V_BP) then
			 new_Vcount 	<= 	(others => '0');
		else

			 new_Vcount <= Vcount;
		end if;
	else
		new_Vcount <= Vcount;
	end if;	
	end process;

	-- Process: Sequential
	-- Stores new values of Hcount and Vcount in the register.
	process(clk,reset)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				--Assign to internal signal
				Hcount <= (others => '0');
				Vcount <= (others => '0');
				
				Xposition <= (others => '0');
				Yposition <= (others => '0');

				--Assign to output signal
				Hcount_con <= (others => '0');
				Vcount_con <= (others => '0');
			else
				--Assign to internal signal
				Hcount <= new_Hcount;
				Vcount <= new_Vcount;
				
				Xposition <= new_Xposition;
				Yposition <= new_Yposition;

				--Assign to output signal
				Hcount_con <= new_Hcount;
				Vcount_con <= new_Vcount;
			end if;
		end if;
	end process;
end architecture behaviour;
