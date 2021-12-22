library IEEE;
use IEEE.std_logic_1164.ALL;

entity stable_map is
   port(clk          : in  std_logic;
        reset        : in  std_logic;
        map_updated  : in  std_logic;
        dir_mined    : in  std_logic_vector(2 downto 0);
        vga_done_out : in  std_logic;
        map_data_vol : in  std_logic_vector(71 downto 0);
        map_data     : out std_logic_vector(71 downto 0));
end stable_map;

