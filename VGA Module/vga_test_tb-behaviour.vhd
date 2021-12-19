library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behavioural of VGA_tb is 
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


	signal clk : std_logic := '0';
	signal reset : std_logic;
	signal map_data		: std_logic_vector(71 downto 0);
	signal Xplayer		: std_logic_vector(3 downto 0);
	signal Yplayer		: std_logic_vector(3 downto 0);
	signal score 		: std_logic_vector(15 downto 0);
	signal energy		: std_logic_vector(11 downto 0);
	signal level		: std_logic_vector(7 downto 0);
	
	signal hsync		: std_logic;
	signal vga_done	: std_logic;
	signal vsync		: std_logic;
	signal red		: std_logic_vector(3 downto 0);
	signal green		: std_logic_vector(3 downto 0);
	signal blue		: std_logic_vector(3 downto 0);
	signal game_state      : std_logic_vector(1 downto 0);
	signal timer1_out		: unsigned(5 downto 0);
	signal timer2_out		: unsigned(5 downto 0);
begin
process (clk)
	file file_pointer: text is out "write.txt";
    	variable line_el: line;
begin
    	if rising_edge(clk) then
		  -- Write the time
        	write(line_el, now); -- write the line.
       	 	WRITE(line_el, string'(":")); -- write the line.

        	-- Write the hsync
        	write(line_el, string'(" "));
        	write(line_el, Hsync); -- write the line.

        	-- Write the vsync
        	write(line_el, string'(" "));
        	write(line_el, Vsync); -- write the line.

        	-- Write the red
        	write(line_el, string'(" "));
        	write(line_el, RED); -- write the line.

        	-- Write the green
        	write(line_el, string'(" "));
        	write(line_el, GREEN); -- write the line.

        	-- Write the blue
        	write(line_el, string'(" "));
        	write(line_el, BLUE); -- write the line.

        	writeline(file_pointer, line_el); -- write the contents into the file.
		end if;
end process;
  

test : VGA port map(clk, reset, map_data, Xplayer, Yplayer, score, energy, level,game_state,timer1_out,timer2_out,hsync, vsync, red,green,blue,vga_done); 

clk 		<= not clk 	after 20 ns;
reset 		<= '1' 		after 0 ns,
		   '0' 		after 40 ns;
game_state <= "01" after 0 ns;
Xplayer <= "1000" after 0 ns;
Yplayer <= "1000" after 0 ns;
map_data <= "011011000011011001000000011011010000101000011011100111000011011000011011" after 0 ns;

score 		<= (others => '0') after 0 ns;
energy		<= (others => '0') after 0 ns;
level	<= (others => '0') after 0 ns;
end behavioural;
