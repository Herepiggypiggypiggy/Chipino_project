library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity texture_ctrl is
port (
	clk 		: in std_logic;
	reset 		: in std_logic;

	map_data	: in std_logic_vector(71 downto 0);
	Xplayer		: in std_logic_vector(3 downto 0);
	Yplayer		: in std_logic_vector(3 downto 0);
	score 		: in std_logic_vector(9 downto 0);
	energy		: in std_logic_vector(7 downto 0);
	level_depth 	: in std_logic_vector(4 downto 0);
	
	column_out	: out std_logic_vector(4 downto 0);
	row_out		: out std_logic_vector(4 downto 0);
	
	tile_address	: out std_logic_vector(4 downto 0);
	
	Hcount_out	: out unsigned(9 downto 0);
	Vcount_out	: out unsigned(9 downto 0)
);
end texture_ctrl;

