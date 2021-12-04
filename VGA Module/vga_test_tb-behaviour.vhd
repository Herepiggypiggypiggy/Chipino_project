library IEEE;
use IEEE.std_logic_1164.ALL;

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
   test: vga_test port map (clk, reset, input, hsync, vsync, red, green, blue);
   clk <= '0' after 0 ns,
          '1' after 20 ns when clk /= '1' else '0' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;

   input <= 	"001" after 0 ns,
		"010" after 16.7 ms;
end behaviour;


