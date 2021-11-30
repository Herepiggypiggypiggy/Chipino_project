library IEEE;
use IEEE.std_logic_1164.all;  

entity tile_ctrl is
port(
	clk		: in  std_logic;
	reset		: in  std_logic;

	tile_address	: in  std_logic_vector(4 downto 0);
	row		: in  std_logic_vector(4 downto 0);
	column		: in  std_logic_vector(4 downto 0);

	color_address	: out std_logic_vector(3 downto 0)
);
end tile_ctrl;