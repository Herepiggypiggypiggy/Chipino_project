library IEEE;
use IEEE.std_logic_1164.ALL;

entity module_test is
port (	clk         	: in    std_logic;
        reset       	: in    std_logic;
	bleft		: in    std_logic;
	bright		: in    std_logic;
	up		: in    std_logic;
	down		: in    std_logic;
	mining		: in    std_logic;
        input		: in    std_logic_vector(2 downto 0);
        hsync		: out   std_logic;
        vsync		: out   std_logic;
        red		    : out   std_logic_vector(3 downto 0);
        green		: out   std_logic_vector(3 downto 0);
        blue		: out   std_logic_vector(3 downto 0));
end module_test;
