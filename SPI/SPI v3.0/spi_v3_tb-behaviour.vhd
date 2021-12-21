library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of spi_v3_tb is
   component spi_v3
      port(MOSI_data : in  std_logic_vector(15 downto 0);
           MOSI      : out std_logic;
           send      : in  std_logic;
           SCLK      : out std_logic;
           SS        : out std_logic;
           clk       : in  std_logic;
           reset     : in  std_logic;
           MISO      : in  std_logic;
           map_data  : out std_logic_vector(71 downto 0));
   end component;
   signal MOSI_data : std_logic_vector(15 downto 0);
   signal MOSI      : std_logic;
   signal send      : std_logic;
   signal SCLK      : std_logic;
   signal SS        : std_logic;
   signal clk       : std_logic;
   signal reset     : std_logic;
   signal MISO      : std_logic;
   signal map_data  : std_logic_vector(71 downto 0);
begin
   test: spi_v3 port map (MOSI_data, MOSI, send, SCLK, SS, clk, reset, MISO, map_data);
   MOSI_data(0) <= '0' after 0 ns;
   MOSI_data(1) <= '1' after 0 ns;
   MOSI_data(2) <= '0' after 0 ns;
   MOSI_data(3) <= '1' after 0 ns;
   MOSI_data(4) <= '0' after 0 ns;
   MOSI_data(5) <= '0' after 0 ns;
   MOSI_data(6) <= '0' after 0 ns;
   MOSI_data(7) <= '0' after 0 ns;
   MOSI_data(8) <= '0' after 0 ns;
   MOSI_data(9) <= '0' after 0 ns;
   MOSI_data(10) <= '0' after 0 ns;
   MOSI_data(11) <= '0' after 0 ns;
   MOSI_data(12) <= '0' after 0 ns;
   MOSI_data(13) <= '1' after 0 ns;
   MOSI_data(14) <= '0' after 0 ns;
   MOSI_data(15) <= '0' after 0 ns;
   send <= '0' after 0 ns,
		'1' after 300 ns,
		'0' after 340 ns;
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
   MISO <= '0' after 0 ns,
	   '1' after 2900 ns,
	   '0' after 3540 ns,
	   '1' after 4180 ns,
	   '0' after 4820 ns,
	   '1' after 5460 ns,
	   '0' after 8020 ns,
	   '1' after 8660 ns,
	   '0' after 9300 ns,
	   '1' after 9940 ns,
	   '0' after 10580 ns,
	   '1' after 11220 ns,
	   '0' after 11860 ns,
	   '1' after 12500 ns,
	   '0' after 15060 ns,
	   '1' after 75220 ns,
	   '0' after 75860 ns;
end behaviour;
