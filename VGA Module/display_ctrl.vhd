library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity of VGA
entity display_ctrl is
port (
	clk			: in std_logic;
	reset 		: in std_logic;

	in_red		: in std_logic_vector(3 downto 0);
	in_green	: in std_logic_vector(3 downto 0);
	in_blue		: in std_logic_vector(3 downto 0);

	hcount 		: in std_logic_vector(9 downto 0);
	vcount 		: in std_logic_vector(9 downto 0);
	
	dim			: in std_logic_vector(3 downto 0);
	
	hsync		: out std_logic;
	vsync		: out std_logic;

	red			: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue		: out std_logic_vector(3 downto 0)
);
end display_ctrl;

