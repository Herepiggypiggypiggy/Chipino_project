library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of VGA is
	
-- texture_ctrl
component texture_ctrl
port (
		clk 			: in std_logic;
		reset 			: in std_logic;
	
		map_data		: in std_logic_vector(71 downto 0);
		
		xplayer			: in std_logic_vector(3 downto 0);
		yplayer			: in std_logic_vector(3 downto 0);
		
		score 			: in std_logic_vector(15 downto 0);
		energy			: in std_logic_vector(11 downto 0);
		level 			: in std_logic_vector(7 downto 0);
	
		game_state      : in std_logic_vector(1 downto 0);
	
		dim				: out std_logic_vector(3 downto 0);
		
		column_out		: out std_logic_vector(2 downto 0);
		row_out			: out std_logic_vector(2 downto 0);
		
		timer1_out		: out std_logic_vector(5 downto 0);
		timer2_out		: out std_logic_vector(5 downto 0);
		
		bg_select 		: out std_logic_vector(2 downto 0);
		
		tile_address	: out std_logic_vector(5 downto 0);
		
		hcount_out		: out std_logic_vector(9 downto 0);
		vcount_out		: out std_logic_vector(9 downto 0);
		
		vga_done_out 	: out std_logic;
		
		animation_done 	: out std_logic
);
end component;

-- tile_ctrl
component tile_ctrl
port (	
		clk 			: in std_logic;
		reset 			: in std_logic;
		
		tile_address 	: in std_logic_vector(5 downto 0);
		
		row 			: in std_logic_vector(2 downto 0);
		column			: in std_logic_vector(2 downto 0);
		
		bg_select		: in std_logic_vector(2 downto 0);
		
		timer1			: in std_logic_vector(5 downto 0);
		timer2			: in std_logic_vector(5 downto 0);
		
		color_address   : out std_logic_vector(4 downto 0)
);
end component;

-- color_ctrl
component color_ctrl
port (	
		clk 			: in std_logic;
		reset 			: in std_logic;
		
		color_address 	: in std_logic_vector(4 downto 0);

		red 			: out std_logic_vector(3 downto 0);
		green			: out std_logic_vector(3 downto 0);
		blue 			: out std_logic_vector(3 downto 0)
);
end component;

-- display_ctrl
component display_ctrl
port(
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
end component;


--Internal Signals
	signal column			: std_logic_vector(2 downto 0);
	signal row				: std_logic_vector(2 downto 0);


	signal hcount			: std_logic_vector(9 downto 0);
	signal vcount			: std_logic_vector(9 downto 0);

	signal color_address	: std_logic_vector(4 downto 0);
	
	signal in_red			: std_logic_vector(3 downto 0);
	signal in_green			: std_logic_vector(3 downto 0);
	signal in_blue			: std_logic_vector(3 downto 0);
	
	signal tile_address		: std_logic_vector(5 downto 0);
	
	signal bg_select		: std_logic_vector(2 downto 0);
	
	signal dim				: std_logic_vector(3 downto 0);
	
	signal timer1			: std_logic_vector(5 downto 0);
	signal timer2			: std_logic_vector(5 downto 0);

begin

	timer1_out <= timer1;
	timer2_out <= timer2;

--Port maps
texture_module : texture_ctrl 
port map (			
	clk, reset, 
	map_data, 
	xplayer, yplayer, 
	score, energy, level,
	game_state,
	dim,
	column, row,
	timer1,	timer2,
	bg_select,
	tile_address,
	hcount,	vcount,
	vga_done_out,
	animation_done
); 

tile_module : tile_ctrl 
port map (				
	clk, reset, 
	tile_address, 
	row, column, 
	bg_select,
	timer1, timer2,
	color_address
); 

color_driver_module : color_ctrl 
port map (		
	clk, reset, 
	color_address, 
	in_red, in_green, in_blue
);
 
display_controller_module : display_ctrl 
port map (	
	clk, reset, 
	in_red, in_green, in_blue,
	hcount, vcount,
	dim, 
	hsync, vsync,
	red, green, blue
); 
end architecture;


