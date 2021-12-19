library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of VGA_TEST is
component VGA
port (	
	clk 		: in std_logic;
	reset 		: in std_logic;

	map_data	: in std_logic_vector(71 downto 0);

	Xplayer		: in std_logic_vector(3 downto 0);
	Yplayer		: in std_logic_vector(3 downto 0);

	score 		: in std_logic_vector(15 downto 0);
	energy		: in std_logic_vector(11 downto 0);
	level 		: in std_logic_vector(7 downto 0);
	game_state      : in std_logic_vector(1 downto 0);
	timer1_out		: out  unsigned(5 downto 0);
	timer2_out		: out  unsigned(5 downto 0);
	hsync		: out std_logic;
	vsync		: out std_logic;
	red		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue		: out std_logic_vector(3 downto 0);

	vga_done_out	: out std_logic
);
end component;

signal  map_data			:std_logic_vector(71 downto 0);
signal	Xplayer		: std_logic_vector(3 downto 0);
signal	Yplayer		: std_logic_vector(3 downto 0);
signal	score 		: std_logic_vector(15 downto 0);
signal	energy		: std_logic_vector(11 downto 0);
signal	level 	: std_logic_vector(7 downto 0);
	signal game_state      : std_logic_vector(1 downto 0);
	signal timer1_out		: unsigned(5 downto 0);
	signal timer2_out		: unsigned(5 downto 0);

begin
test : VGA port map(clk, reset, map_data, Xplayer, Yplayer, score, energy, level,game_state,timer1_out,timer2_out,hsync, vsync, red,green,blue,vga_done_out); 

process(clk,reset)
begin

case input is
	when "000" => 
		map_data <= "011011010011011100000001011011000000000000011011000111000011011000011011";
		game_state <= "00";
		Xplayer <= "0111";
		Yplayer <= "0111";
		score 		<= "0000000000100000";
		energy		<= "000000000001";
		level 		<= "00000001";
	when "001" => 
		map_data <= "011011010011011100000001011011000000000000011011000111000011011000011011";
		game_state <= "01";
		Xplayer <= "0101";
		Yplayer <= "0011";
		score 		<= "0000000000100000";
		energy		<= "000000000001";
		level 		<= "00000001";
	when "010" => 
		map_data <= "011011011011011011010011011011011100001011011000000000000000000111000000";
        		game_state <= "01";
		Xplayer <= "0111";
		Yplayer <= "0110";
		score 		<= "0000000000100000";
		energy		<= "000000000001";
		level 		<= "00000001";
	when "011" => 
		map_data <= "011011010011011100000001011011000000000000011011000111000011011000011110";
		game_state <= "01";
		Xplayer <= "0001";
		Yplayer <= "0111";
		score 		<= "0000000000100000";
		energy		<= "000000000001";
		level 		<= "00000001";
	when others => 
		map_data <= "011011010011011100000001011011000000000000011011000111000011011000011110";
		game_state <= "01";
		score 		<= (others => '0');
		energy		<= (others => '0');
		level 		<= (others => '0');
end case;



end process;
end architecture;





