library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Architecture of VGA
architecture behavioural of display_ctrl is 

	-- Constants: Timings
	constant H_DISPLAY 	: integer := 640;
	constant H_FP 		: integer := 16;
	constant H_SP 		: integer := 96;
	constant H_BP 		: integer := 48;

	constant V_DISPLAY 	: integer := 480;
	constant V_FP 		: integer := 10;
	constant V_SP 		: integer := 2;
	constant V_BP 		: integer := 33;
	
	-- Signals
	signal new_Hcount : unsigned(9 downto 0) := (others => '0');
	signal new_Vcount : unsigned(9 downto 0) := (others => '0');


	begin
	
	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: HS, VS, New value of counter.
	process (clk)
	begin
	if (rising_edge (clk)) then
		if (Hcount > "111101111" and Hcount < "1001010000") then --HSync_pulse
			hsync <= '0';
		else
			hsync <= '1';
		end if;	

		
		if (Vcount > "111101001" and Vcount < "111101100") then --VSync_pulse
			vsync <= '0';
		else	
			vsync <= '1';
		end if;

		if (Hcount > "1010000000" or Vcount > "111100000") then
			red 	<= 	(others => '0');
			green	<=	(others => '0');
			blue 	<=	(others => '0');
		else
			red 	<= 	in_red;
			green	<=	in_green;
			blue 	<=	in_blue;
		end if;
	end if;
	end process;
end architecture behavioural;
