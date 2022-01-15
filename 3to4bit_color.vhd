library IEEE;
use IEEE.std_logic_1164.ALL;

entity color3to4bit is
port (red_in    : in std_logic_vector(2 downto 0);
      green_in  : in std_logic_vector(2 downto 0);
      blue_in   : in std_logic_vector(2 downto 0);
      
      red       : out std_logic_vector(3 downto 0);
      green     : out std_logic_vector(3 downto 0);
      blue      : out std_logic_vector(3 downto 0));
end color3to4bit;
