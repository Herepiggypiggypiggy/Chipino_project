--The VGA module with all the diverent components.
--included: texture_controller, Tile selector, color_driver and display_controller.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is
port (	
	clk 			: in std_logic;
	reset 			: in std_logic;
	game_state      : in std_logic_vector(1 downto 0);
	xplayer			: in std_logic_vector(3 downto 0);
	yplayer			: in std_logic_vector(3 downto 0);
	level 			: in std_logic_vector(7 downto 0);
	energy			: in std_logic_vector(11 downto 0);
	score 			: in std_logic_vector(15 downto 0);
	level_abs 		: in std_logic_vector(7 downto 0);
	energy_abs		: in std_logic_vector(11 downto 0);
	score_abs 		: in std_logic_vector(15 downto 0);
	map_data		: in std_logic_vector(71 downto 0);
	
	hsync			: out std_logic;
	vsync			: out std_logic;
	vga_done		: out std_logic;
	animation_done 	: out std_logic;
	red				: out std_logic_vector(3 downto 0);
	green			: out std_logic_vector(3 downto 0);
	blue			: out std_logic_vector(3 downto 0);
	timer1_out		: out std_logic_vector(5 downto 0);
	timer2_out		: out std_logic_vector(5 downto 0)
);
end VGA;


