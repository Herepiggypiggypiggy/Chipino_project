library IEEE;
use IEEE.std_logic_1164.ALL;

entity module_test is
port (	
	clk   			: in    std_logic;
	reset   		: in    std_logic;
	
	button_left		: in    std_logic;
	button_right	: in    std_logic;
	button_up		: in    std_logic;
	button_down		: in    std_logic;
	button_mining	: in    std_logic;
	
	input			: in    std_logic_vector(2 downto 0);
	
    hsync			: out   std_logic;
    vsync			: out   std_logic;
    
    red				: out   std_logic_vector(3 downto 0);
    green			: out   std_logic_vector(3 downto 0);
    blue			: out   std_logic_vector(3 downto 0));
end module_test;
