library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.parameter_def.all;

-- Architecture of VGA
architecture behavioural of display_ctrl is 
	-- Signals
	signal new_hsync : std_logic;
	signal new_vsync : std_logic;

	type state_type is (hsync_on, hsync_off, vsync_on, vsync_off, display_on, display_off);

	signal hsync_state       : state_type;
	signal new_hsync_state   : state_type;

	signal vsync_state       : state_type;
	signal new_vsync_state   : state_type;

	signal display_state   	   : state_type;
	signal new_display_state   : state_type;

	signal new_red   	   : std_logic_vector(3 downto 0);
	signal new_green   	   : std_logic_vector(3 downto 0);
	signal new_blue   	   : std_logic_vector(3 downto 0);

	begin
	
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: HS, VS, New value of counter.

	hstate_process: process(hcount)
	begin 
		if (unsigned(hcount) > h_display + h_fp - 2 and unsigned(hcount) < h_display + h_fp + h_sp - 1) then -- -1 ofset because of 1 clkcycle delay
			new_hsync_state <= hsync_off;
		else
			new_hsync_state <= hsync_on;
	end if;	
	end process hstate_process;

	vstate_process: process(vcount)
	begin
		if (unsigned(vcount) > v_display + v_fp - 1 and unsigned(vcount) <  v_display + v_fp + v_sp) then
			new_vsync_state <= vsync_off;
		else	
			new_vsync_state <= vsync_on;
		end if;
	end process vstate_process;

	hsync_process: process(hsync_state)
	begin
		if hsync_state = hsync_on then
			hsync <= '1';
		else
			hsync <= '0';
		end if;	
	end process;

	vsync_process: process(vsync_state)
	begin
		if vsync_state = vsync_on then
			vsync <= '1';
		else
			vsync <= '0';
		end if;	
	end process;

	
	display: process(hcount, vcount, display_state)
	begin
		if (unsigned(hcount) > "1010000000" or unsigned(vcount) > "111100000") then
			new_display_state <= display_off;
		else
			new_display_state <= display_on;
		end if;
	end process display;

	RGB: process(in_red, in_green, in_blue, dim,display_state)
	begin
		if (display_state = display_on) then
				if(dim > "0000") then	
					if (unsigned(in_red) > unsigned(dim)) then
						new_red 	<= 	std_logic_vector(unsigned(in_red) - unsigned(dim));
					else
						new_red 	<= 	(others => '0');
					end if;
					
					if (unsigned(in_green) > unsigned(dim)) then
						new_green 	<= 	std_logic_vector(unsigned(in_green) - unsigned(dim));
					else
						new_green 	<= 	(others => '0');
					end if;
					
					if (unsigned(in_blue) > unsigned(dim)) then
						new_blue 	<= 	std_logic_vector(unsigned(in_blue) - unsigned(dim));
					else
						new_blue 	<= 	(others => '0');
					end if;	
					
				else
					new_red 	<= 	in_red;	
					new_green 	<= 	in_green;	
					new_blue 	<= 	in_blue;		
				end if;
				
		else
			new_red 	<= 	(others => '0');	
			new_green 	<= 	(others => '0');	
			new_blue 	<= 	(others => '0');
		end if;
	end process RGB;

	process(clk)
	begin
		if (rising_edge (clk)) then
			if reset = '1' then
				vsync_state <= vsync_on;
				hsync_state <= hsync_on;
				display_state <= display_on;	
			else
				vsync_state <= new_vsync_state;
				hsync_state <= new_hsync_state;
				display_state <= new_display_state;

				red 	<= 	new_red;	
				green 	<= 	new_green;	
				blue 	<= 	new_blue;		
			end if;
		end if;
	end process;
end architecture behavioural;



