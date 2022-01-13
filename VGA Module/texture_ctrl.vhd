library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity texture_ctrl is
port (	
	clk 			: in std_logic;
	reset 			: in std_logic;
	map_data		: in std_logic_vector(71 downto 0);
	xplayer			: in std_logic_vector(3 downto 0);
	yplayer			: in std_logic_vector(3 downto 0);
	score 			: in std_logic_vector(15 downto 0);
	energy			: in std_logic_vector(11 downto 0);
	level 			: in std_logic_vector(7 downto 0);
	level_abs 		: in std_logic_vector(4 downto 0);
	game_state  	: in std_logic_vector(1 downto 0);

	dim				: out std_logic_vector(3 downto 0);
	column_out		: out std_logic_vector(2 downto 0);
	row_out			: out std_logic_vector(2 downto 0);
	timer1_out		: out std_logic_vector(5 downto 0);
	timer2_out		: out std_logic_vector(5 downto 0);
	bg_select 		: out std_logic_vector(2 downto 0);
	tile_address	: out std_logic_vector(5 downto 0);
	hcount_out		: out std_logic_vector(9 downto 0);
	vcount_out		: out std_logic_vector(9 downto 0);
	vga_done_out	: out std_logic;
	animation_done 	: out std_logic
);
end texture_ctrl;



