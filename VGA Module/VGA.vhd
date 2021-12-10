--The VGA module with all the diverent components.
--included: texture_controller, Tile selector, color_driver and display_controller.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity VGA is
port (	
	clk 		: in std_logic;
	reset 		: in std_logic;

	map_data	: in std_logic_vector(71 downto 0);

	Xplayer		: in std_logic_vector(3 downto 0);
	Yplayer		: in std_logic_vector(3 downto 0);

	score 		: in std_logic_vector(15 downto 0);
	energy		: in std_logic_vector(11 downto 0);
	level 		: in std_logic_vector(7 downto 0);
	
	hsync		: out std_logic;
	vsync		: out std_logic;

	red		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue		: out std_logic_vector(3 downto 0);

	vga_done	: out std_logic
);
end VGA;
