library IEEE;
use IEEE.std_logic_1164.ALL;

entity not_arduino is
   port(clk   : in  std_logic;
        reset : in  std_logic;
        MOSI  : in  std_logic;
        SCLK  : in  std_logic;
        SS    : in  std_logic;
        MISO  : out std_logic);
end not_arduino;

