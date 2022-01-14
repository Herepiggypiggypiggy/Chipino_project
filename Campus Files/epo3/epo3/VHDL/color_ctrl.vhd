library IEEE;
use IEEE.std_logic_1164.all;

entity color_ctrl is
port (
	clk 		: in std_logic;
	reset 		: in std_logic;
	color_address 	: in std_logic_vector(4 downto 0);

	red 		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue 		: out std_logic_vector(3 downto 0)
);
end color_ctrl;

