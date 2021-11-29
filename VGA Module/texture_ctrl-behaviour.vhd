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

	constant pixel_num : integer := 24;
	
	-- Signals
	signal Hcount : unsigned(9 downto 0);
	signal Vcount : unsigned(9 downto 0);
	
	signal new_Hcount : unsigned(9 downto 0);
	signal new_Vcount : unsigned(9 downto 0);
	
	signal column : unsigned(4 downto 0);
	signal row : unsigned(4 downto 0);

	signal new_column : unsigned(4 downto 0);
	signal new_row : unsigned(4 downto 0);
	
	signal Xposition : unsigned(4 downto 0);
	signal Yposition : unsigned(4 downto 0);
	
	signal new_Xposition : unsigned(4 downto 0);
	signal new_Yposition : unsigned(4 downto 0);
	
	
	
	begin
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: New value of counter.
	
	process (row,column,Yposition,Hcount)
	begin

	--Tile Type selector
	if    (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) - 3) 	then tile_address <= "10" & map_data(71 downto 69);
	elsif (Xposition = unsigned(Xplayer) - 1 	and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "10" & map_data(68 downto 66);
	elsif (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "10" & map_data(65 downto 63);
	elsif (Xposition = unsigned(Xplayer) + 1 	and Yposition = unsigned(Yplayer) - 2) 	then tile_address <= "10" & map_data(62 downto 60);
	elsif (Xposition = unsigned(Xplayer) - 2 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "10" & map_data(59 downto 57);
	elsif (Xposition = unsigned(Xplayer) - 1 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "10" & map_data(56 downto 54);
	elsif (Xposition = unsigned(Xplayer) 		and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "10" & map_data(53 downto 51);
	elsif (Xposition = unsigned(Xplayer) + 1 	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "10" & map_data(50 downto 48);
	elsif (Xposition = unsigned(Xplayer) + 2  	and Yposition = unsigned(Yplayer) - 1) 	then tile_address <= "10" & map_data(47 downto 45);
	elsif (Xposition = unsigned(Xplayer) - 3  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(44 downto 42);
	elsif (Xposition = unsigned(Xplayer) - 2  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(41 downto 39);
	elsif (Xposition = unsigned(Xplayer) - 1  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(38 downto 36);
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(35 downto 33);
	elsif (Xposition = unsigned(Xplayer) + 2	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(32 downto 30);
	elsif (Xposition = unsigned(Xplayer) + 3 	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(29 downto 27);
	elsif (Xposition = unsigned(Xplayer) - 2 	and Yposition = unsigned(Yplayer)) 	then tile_address <= "10" & map_data(26 downto 24);
	elsif (Xposition = unsigned(Xplayer) - 1  	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "10" & map_data(23 downto 21);
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "10" & map_data(20 downto 18);
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "10" & map_data(17 downto 15);
	elsif (Xposition = unsigned(Xplayer) + 2	and Yposition = unsigned(Yplayer) + 1) 	then tile_address <= "10" & map_data(14 downto 12);
	elsif (Xposition = unsigned(Xplayer) - 1	and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "10" & map_data(11 downto 9);
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "10" & map_data(8 downto 6);
	elsif (Xposition = unsigned(Xplayer) + 1  	and Yposition = unsigned(Yplayer) + 2) 	then tile_address <= "10" & map_data(5 downto 3);
	elsif (Xposition = unsigned(Xplayer)		and Yposition = unsigned(Yplayer) + 3) 	then tile_address <= "10" & map_data(2 downto 0);
	else tile_address <= "10" & map_data(2 downto 0);
	end if;


	if (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_Xposition <= (others => '0');
	else
		if (column = "10111") then
			new_Xposition <= Xposition + 1;
		else
			new_Xposition <= Xposition;
		end if;
	end if;

	if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1 and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_Yposition <= (others => '0');
	else
		if (row = "10111" and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
			new_Yposition <= Yposition + 1;
		else
			new_Yposition <= Yposition;
		end if;
	end if;
	
	end process;

	process(Hcount,Vcount)
	begin
	
	--Colum selector
	if (Hcount < H_DISPLAY + H_FP + H_SP + H_BP - 1) then
	case to_integer(Hcount) mod pixel_num is
		when 23 => new_column <= "00000";		
		when 0 	=> new_column <= "00001";		
		when 1 	=> new_column <= "00010";		
		when 2 	=> new_column <= "00011";
		when 3 	=> new_column <= "00100";
		when 4 	=> new_column <= "00101";
		when 5 	=> new_column <= "00110";
		when 6 	=> new_column <= "00111";
		when 7 	=> new_column <= "01000";
		when 8 	=> new_column <= "01001";
		when 9  => new_column <= "01010";
		when 10 => new_column <= "01011";
		when 11 => new_column <= "01100";
		when 12 => new_column <= "01101";
		when 13 => new_column <= "01110";
		when 14 => new_column <= "01111";
		when 15 => new_column <= "10000";
		when 16 => new_column <= "10001";
		when 17 => new_column <= "10010";
		when 18 => new_column <= "10011";
		when 19 => new_column <= "10100";
		when 20 => new_column <= "10101";
		when 21 => new_column <= "10110";
		when 22 => new_column <= "10111";
		when others => new_column <= "00000";
	end case;
	else
		new_column <= "00000";
	end if;
	
	--Row selector
	if (Vcount = V_DISPLAY + V_FP + V_SP + V_BP - 1 and Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
		new_row <= "00000";
	elsif (Hcount = H_DISPLAY + H_FP + H_SP + H_BP - 1) then
	case to_integer(Vcount) mod pixel_num is
		when 23 => new_row <= "00000";		
		when 0 	=> new_row <= "00001";		
		when 1 	=> new_row <= "00010";		
		when 2 	=> new_row <= "00011";
		when 3 	=> new_row <= "00100";
		when 4 	=> new_row <= "00101";
		when 5 	=> new_row <= "00110";
		when 6 	=> new_row <= "00111";
		when 7 	=> new_row <= "01000";
		when 8 	=> new_row <= "01001";
		when 9  => new_row <= "01010";
		when 10 => new_row <= "01011";
		when 11 => new_row <= "01100";
		when 12 => new_row <= "01101";
		when 13 => new_row <= "01110";
		when 14 => new_row <= "01111";
		when 15 => new_row <= "10000";
		when 16 => new_row <= "10001";
		when 17 => new_row <= "10010";
		when 18 => new_row <= "10011";
		when 19 => new_row <= "10100";
		when 20 => new_row <= "10101";
		when 21 => new_row <= "10110";
		when 22 => new_row <= "10111";
		when others => new_row <= "00000";
	end case;
	else
		new_row <= row;
	
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
