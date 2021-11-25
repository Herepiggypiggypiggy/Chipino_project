library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity of VGA
entity display_controller is
	port(
	clk,reset 	: in std_logic;
	IN_RED		: in std_logic_vector(3 downto 0);
	IN_GREEN	: in std_logic_vector(3 downto 0);
	IN_BLUE		: in std_logic_vector(3 downto 0);
	Hcount 		: in unsigned(9 downto 0);
	Vcount 		: in unsigned(9 downto 0);
	hsync		: out std_logic;
	vsync		: out std_logic;
	red		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue		: out std_logic_vector(3 downto 0));
end display_controller;

-- Architecture of VGA
architecture behaviour of display_controller is 

	-- Constants: Timings.
	constant H_DISPLAY : integer := 640;
	constant H_FP : integer := 16;
	constant H_SP : integer := 96;
	constant H_BP : integer := 48;

	constant V_DISPLAY : integer := 480;
	constant V_FP : integer := 10;
	constant V_SP : integer := 2;
	constant V_BP : integer := 33;
	
	-- Signals
	signal new_Hcount : unsigned(9 downto 0) := (others => '0');
	signal new_Vcount : unsigned(9 downto 0) := (others => '0');

	begin

	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: HS, VS, New value of counter.
	process (clk)
	begin
	if (rising_edge (clk)) then
		if (Hcount > H_DISPLAY + H_FP and Hcount <= H_DISPLAY + H_FP + H_SP) then --HSync_pulse
			hsync <= '0';
		else
			hsync <= '1';
		end if;	

		
		if (Vcount > V_DISPLAY + V_FP and Vcount <= V_DISPLAY + V_FP + V_SP) then --VSync_pulse
			vsync <= '0';
		else	
			vsync <= '1';
		end if;

		if (Hcount > H_DISPLAY or Vcount > V_DISPLAY) then
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
end architecture behaviour;
