library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of VGA is
--texture_controller
component texture_ctrl
port (
	clk 		: in std_logic;
	reset 		: in std_logic;

	map_data	: in std_logic_vector(71 downto 0);
	Xplayer		: in std_logic_vector(3 downto 0);
	Yplayer		: in std_logic_vector(3 downto 0);
	score 		: in std_logic_vector(15 downto 0);
	energy		: in std_logic_vector(11 downto 0);
	level 	: in std_logic_vector(7 downto 0);
	
	column_out		: out std_logic_vector(2 downto 0);
	row_out		: out std_logic_vector(2 downto 0);
	
	tile_address	: out std_logic_vector(4 downto 0);
	
	Hcount_out	: out unsigned(9 downto 0);
	Vcount_out	: out unsigned(9 downto 0);
	vga_done: out std_logic
);

end component;

--Tile
component tile_ctrl
port (	clk 		: in std_logic;
	reset 		: in std_logic;
	tile_address 	: in std_logic_vector(4 downto 0);
	row 		: in std_logic_vector(2 downto 0);
	column		: in std_logic_vector(2 downto 0);

	color_address   : out std_logic_vector(3 downto 0));
end component;
--color_driver
component color_ctrl
	port (	clk 		: in std_logic;
		reset 		: in std_logic;
		color_address 	: in std_logic_vector(3 downto 0);

		red 		: out std_logic_vector(3 downto 0);
		green		: out std_logic_vector(3 downto 0);
		blue 		: out std_logic_vector(3 downto 0)
	);
end component;

--display_controller
component display_ctrl
       port(	clk,reset 	: in std_logic;
		in_red		: in std_logic_vector(3 downto 0);
		in_green	: in std_logic_vector(3 downto 0);
		in_blue		: in std_logic_vector(3 downto 0);
		Hcount 		: in unsigned(9 downto 0);
		vcount 		: in unsigned(9 downto 0);
		hsync		: out std_logic;
		vsync		: out std_logic;
		red		: out std_logic_vector(3 downto 0);
		green		: out std_logic_vector(3 downto 0);
		blue		: out std_logic_vector(3 downto 0));
end component;


--Internal Signals
signal column		: std_logic_vector(2 downto 0);
signal row		: std_logic_vector(2 downto 0);


signal Hcount	: unsigned(9 downto 0);
signal Vcount	: unsigned(9 downto 0);




signal color_address	: std_logic_vector(3 downto 0);
signal in_red		: std_logic_vector(3 downto 0);
signal in_green		: std_logic_vector(3 downto 0);
signal in_blue		: std_logic_vector(3 downto 0);
signal tile_address: std_logic_vector(4 downto 0);

begin

--Port maps
texture_module : texture_ctrl port map(			clk, 
							reset, 
							map_data, 
							Xplayer, 
							Yplayer, 
							score, 
							energy,
							level,
							column,
							row,
							tile_address,
							Hcount,
							Vcount,
							vga_done); 

tile_module : tile_ctrl port map(				clk, 
							reset, 
							tile_address, 
							row, 
							column, 
							color_address); 

color_driver_module : color_ctrl port map(		clk, 
							reset, 
							color_address, 
							in_red, 
							in_green, 
							in_blue);
 
display_controller_module : display_ctrl port map(	clk, 
							reset, 
							in_red, 
							in_green, 
							in_blue,
							Hcount,
							Vcount, 
							hsync, 
							vsync,
							red,
							green,
							blue); 
end architecture;
