library IEEE;
use IEEE.std_logic_1164.all;

architecture behavioural of color_tb is 
	
component color_driver
	port (	
		clk 		: in std_logic;
		reset 		: in std_logic;
		color_address 	: in std_logic_vector(3 downto 0);

		red 		: out std_logic_vector(2 downto 0);
		green		: out std_logic_vector(2 downto 0);
		blue 		: out std_logic_vector(2 downto 0)
	);
end component;
	
	signal clk 		: std_logic := '0';
	signal reset 		: std_logic;

	signal color_address 	: std_logic_vector(3 downto 0);

	signal red 		: std_logic_vector(2 downto 0);
	signal green		: std_logic_vector(2 downto 0);
	signal blue 		: std_logic_vector(2 downto 0);

begin

	test : color_driver port map(clk, reset, color_address, red, green, blue); 

	clk 		<= not clk 	after 20 ns;
	reset 		<= '1' 		after 0 ns,
		 	   '0' 		after 40 ns,
		 	   '1' 		after 700 ns;
	-- Test every colour
	color_address 	<= "0000" 	after 0 ns,
			   "0001" 	after 60 ns,
			   "0010" 	after 100 ns,
			   "0011" 	after 140 ns,
		 	   "0100" 	after 180 ns,
			   "0101" 	after 220 ns,
			   "0110" 	after 260 ns,
			   "0111" 	after 300 ns,
			   "1000" 	after 340 ns,
			   "1001" 	after 380 ns,
			   "1010" 	after 420 ns,
			   "1011" 	after 460 ns,
			   "1100" 	after 500 ns,
			   "1101" 	after 540 ns,
			   "1110" 	after 580 ns,
			   "1111" 	after 620 ns;

end behavioural;
