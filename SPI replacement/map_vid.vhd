library IEEE;
use IEEE.std_logic_1164.ALL;

entity map_vid is
   port(moved	    : in  std_logic;
        dir_mined : in  std_logic_vector(2 downto 0);
	clk       : in  std_logic;
        reset     : in  std_logic;
        map_data  : out std_logic_vector(71 downto 0));
end map_vid;

