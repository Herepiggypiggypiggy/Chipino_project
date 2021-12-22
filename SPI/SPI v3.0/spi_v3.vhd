library IEEE;
use IEEE.std_logic_1164.ALL;

entity spi_v3 is
   port(MOSI_data : in  std_logic_vector(15 downto 0);
        MOSI      : out std_logic;
        send      : in  std_logic;
        SCLK      : out std_logic;
        SS        : out std_logic;
        clk       : in  std_logic;
        reset     : in  std_logic;
        MISO      : in  std_logic;
        map_data_volitile  : out std_logic_vector(71 downto 0));
end spi_v3;
