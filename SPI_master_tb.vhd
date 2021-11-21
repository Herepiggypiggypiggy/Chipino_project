library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SPI_master_TB is
end entity;


Architecture TB of SPI_master_TB is

	signal clock_in : std_logic ;
	
begin

  clock_in <= not clock_in after 1 ns;

dut : entity work.SPI_Master
	port map (
	 clock_in => clock_in,
	MOSI => MOSI,
	SCLK => SCLK,
	MISO => MISO,
	RC_FS => RC_FS,
	RS_FS => RS_FS,
	RS_FM  => RS_FM,
	RC_FM => RC_FM );
end Architecture;




	--MOSI => MOSI,
	--SCLK => SCLK,
	--MISO => MISO,
	--RC_FS => RC_FS,
	--RS_FS => RS_FS,
	--RS_FM  => RS_FM,
	--RC_FM => RC_FM );
