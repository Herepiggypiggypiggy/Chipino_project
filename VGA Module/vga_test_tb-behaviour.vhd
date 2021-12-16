library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.std_logic_textio.all;
use std.textio.all;

architecture behaviour of vga_test_tb is
   component vga_test
   port (	clk : in std_logic;
   	reset : in std_logic;
   	
   	input : in std_logic_vector(2 downto 0);
   
   	hsync		: out std_logic;
   	vsync		: out std_logic;
   	red		: out std_logic_vector(3 downto 0);
   	green		: out std_logic_vector(3 downto 0);
   	blue		: out std_logic_vector(3 downto 0));
   end component;
   signal clk : std_logic;
   signal reset : std_logic;
   signal input : std_logic_vector(2 downto 0);
   signal hsync		: std_logic;
   signal vsync		: std_logic;
   signal red		: std_logic_vector(3 downto 0);
   signal green		: std_logic_vector(3 downto 0);
   signal blue		: std_logic_vector(3 downto 0);
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
   test: vga_test port map (clk, reset, input, hsync, vsync, red, green, blue);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;

   input <= 	"000" after 0 ns,
		"001" after 17 ms,
		"010" after 34 ms;
end behaviour;

