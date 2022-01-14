library IEEE;
use IEEE.std_logic_1164.ALL;

entity spi_v3 is
port (
	clk					: 	in 		std_logic;
	reset 				: 	in 		std_logic;
	send 				: 	in 		std_logic;
	MISO 				: 	in 		std_logic;
	MOSI_data 			: 	in 		std_logic_vector(15 downto 0);
	
	SCLK				: 	out 	std_logic;
	SS					: 	out 	std_logic;
	MOSI				: 	out 	std_logic;
	map_updated			:	out		std_logic;
	map_data_volatile 	: 	out 	std_logic_vector(71 downto 0)
);
end spi_v3;
