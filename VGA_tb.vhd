

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use ieee.std_logic_textio.all;
use std.textio.all;


entity VGA_tb is
end VGA_tb;



architecture behaviour of VGA_tb is
    component VGA
        port(
	clk,reset 	: in std_logic;
	IN_RED		: in std_logic_vector(2 downto 0);
	IN_GREEN	: in std_logic_vector(2 downto 0);
	IN_BLUE		: in std_logic_vector(2 downto 0);

	HS		: out std_logic;
	VS		: out std_logic;
	RED		: out std_logic_vector(2 downto 0);
	GREEN		: out std_logic_vector(2 downto 0);
	BLUE		: out std_logic_vector(2 downto 0));
    end component;

signal clk	: std_logic := '0';
signal reset	: std_logic;

signal IN_RED	: std_logic_vector(2 downto 0);
signal IN_GREEN	: std_logic_vector(2 downto 0);
signal IN_BLUE	: std_logic_vector(2 downto 0);

signal HS	: std_logic;
signal VS	: std_logic;
signal RED	: std_logic_vector(2 downto 0);
signal GREEN	: std_logic_vector(2 downto 0);
signal BLUE	: std_logic_vector(2 downto 0);
	
signal counter : std_logic_vector(9 downto 0);
begin
 test: VGA port map (clk, reset, IN_RED,IN_GREEN,IN_BLUE,HS, VS, RED, GREEN, BLUE);
process (clk)
    file file_pointer: text is out "write.txt";
    variable line_el: line;
    variable count,count2 : integer:=0;
begin

    if rising_edge(clk) then

        -- Write the time
        write(line_el, now); -- write the line.
        WRITE(line_el, string'(":")); -- write the line.

        -- Write the hsync
        write(line_el, string'(" "));
        write(line_el, HS); -- write the line.

        -- Write the vsync
        write(line_el, string'(" "));
        write(line_el, VS); -- write the line.

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
	count := count + 1;
	if (count >= 800) then
		count := 0;
	count2 :=  count2+1;
		if count2 >= 512 then
			count2 :=  0;
			
		end if;
	counter <= std_logic_vector(to_unsigned(count2, counter'length));
	IN_RED <= counter(8 downto 6);
	IN_GREEN <= counter(5 downto 3);
	IN_BLUE <= counter(2 downto 0);
	
	end if;
    end if;

    
end process;
   
    clk <= not clk after 19.9 ns;
    reset <= '1' after 0 ns,  
             '0' after 40 ns; 
    
    
end behaviour;

