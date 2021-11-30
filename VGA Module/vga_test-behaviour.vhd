library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of VGA_TEST is
component VGA
port (	clk 		: in std_logic;
	reset 		: in std_logic;

	map_data	: in std_logic_vector(71 downto 0);
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

signal  map_data			:std_logic_vector(71 downto 0);
signal	Xplayer		: std_logic_vector(3 downto 0);
signal	Yplayer		: std_logic_vector(3 downto 0);
signal	score 		: std_logic_vector(9 downto 0);
signal	energy		: std_logic_vector(7 downto 0);
signal	level_depth 	: std_logic_vector(4 downto 0);

begin
test: VGA port map(clk,reset,map_data,Xplayer,Yplayer,score,energy,level_depth,hsync,vsync,red,green,blue);

process(clk,reset,input)
begin
case input is
	when "001" => map_data <= "011011000011011001000000011011010000101000011011100111000011011000011011";
	when "010" => map_data <= "110110110110110110110110110110110110110110110110110110110110110110110110";
	when "011" => map_data <= (others => '0');
	when others => map_data <= (others => '0');
end case;
Xplayer <= "1000";
Yplayer <= "1000";

score 		<= (others => '0');
energy		<= (others => '0');
level_depth 	<= (others => '0');
end process;
end architecture;

