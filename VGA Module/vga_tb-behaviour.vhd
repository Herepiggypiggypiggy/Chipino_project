library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behavioural of VGA_tb is 
component VGA
port (	clk 		: in std_logic;
	reset 		: in std_logic;

	map_data		: in std_logic_vector(71 downto 0);
	Xplayer		: in std_logic_vector(3 downto 0);
	Yplayer		: in std_logic_vector(3 downto 0);
	score 		: in std_logic_vector(9 downto 0);
	energy		: in std_logic_vector(7 downto 0);
	level_depth 		: in std_logic_vector(4 downto 0);
	
	hsync		: out std_logic;
	vsync		: out std_logic;
	red		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue		: out std_logic_vector(3 downto 0));
end component;


	signal clk : std_logic;
	signal reset : std_logic;
	signal map_data		: std_logic_vector(71 downto 0);
	signal Xplayer		: std_logic_vector(3 downto 0);
	signal Yplayer		: std_logic_vector(3 downto 0);
	signal score 		: std_logic_vector(9 downto 0);
	signal energy		: std_logic_vector(7 downto 0);
	signal level_depth 		: std_logic_vector(4 downto 0);
	
	signal hsync		: std_logic;
	signal vsync		: std_logic;
	signal red		: std_logic_vector(3 downto 0);
	signal green		: std_logic_vector(3 downto 0);
	signal blue		: std_logic_vector(3 downto 0);
begin
VGA_test : VGA port map(clk, reset, map_data, Xplayer, Yplayer, score, energy, level_depth, hsync,	vsync, red	,green	,blue); 

clk 		<= not clk 	after 20 ns;
reset 		<= '1' 		after 0 ns,
		   '0' 		after 40 ns;

Xplayer <= "1000" after 0 ns;
Yplayer <= "1000" after 0 ns;
map_data <= "011011000011011001000000011011010000101000011011100111000011011000011011" after 0 ns;

score 		<= (others => '0') after 0 ns;
energy		<= (others => '0') after 0 ns;
level_depth 	<= (others => '0') after 0 ns;
end behavioural;
