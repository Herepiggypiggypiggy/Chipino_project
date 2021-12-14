library IEEE;
use IEEE.std_logic_1164.all;

architecture behavioural of color_ctrl_tb is 
	
component color_ctrl
	port (	clk 		: in std_logic;
		reset 		: in std_logic;
		color_address 	: in std_logic_vector(4 downto 0);

		red 		: out std_logic_vector(2 downto 0);
		green		: out std_logic_vector(2 downto 0);
		blue 		: out std_logic_vector(2 downto 0)
	);
end component;
	
	signal clk 		: std_logic;
	signal reset 		: std_logic;
	signal color_address 	: std_logic_vector(4 downto 0);
	signal red 		: std_logic_vector(2 downto 0);
	signal green		: std_logic_vector(2 downto 0);
	signal blue 		: std_logic_vector(2 downto 0);

begin

	test : color_ctrl port map(clk, reset, color_address, red, green, blue); 

	clk 		<= not clk 	after 20 ns;
	reset 		<= '1' 		after 0 ns,
		 	   '0' 		after 40 ns,
		 	   '1' 		after 700 ns;
	-- Test every colour
	color_address 	<= "00000" 	after 0 ns,
			   "00001" 	after 60 ns,
			   "00010" 	after 100 ns,
			   "00011" 	after 140 ns,
		 	   "00100" 	after 180 ns,
			   "00101" 	after 220 ns,
			   "00110" 	after 260 ns,
			   "00111" 	after 300 ns,
			   "01000" 	after 340 ns,
			   "01001" 	after 380 ns,
			   "01010" 	after 420 ns,
			   "01011" 	after 460 ns,
			   "01100" 	after 500 ns,
			   "01101" 	after 540 ns,
			   "01110" 	after 580 ns,
			   "01111" 	after 620 ns;

end behavioural;
