library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SPI_master_TB is
end entity;

 
Architecture TB of SPI_master_TB is
 
	signal clock_in : std_logic ;
	signal reset_in :  std_logic; --reset from the fpga

------------SPI-Interface-------------
	
	signal MOSI : std_logic; --The output byte
	signal SCLK :  std_logic; --Serial clock
	signal MISO :   std_logic; --the input into the master coming from the slave

------------From-SLAVE(FS)----------------------  

	signal RC_FS : std_logic; -- if this equals 1 the slave is ready for the MOSI output (ready to receive)
	signal RS_FS : std_logic; -- the SLAVE is ready to send out the MISO signal (ready to send)
-----------From-MASTER(FM)------------------------
	
	signal RS_FM  : std_logic; -- confirmation that the MISO has been received
	signal RC_FM : std_logic; -- ready to receive a new MISO (ready to receive) 
	
	signal HS_FM : std_logic;
	signal byte_MOSI : std_logic_vector(15 downto 0);
	


begin


clock_in <= '1' after 0 ns, '0' after 5 ns when clock_in /= '0' else '1' after 5 ns;

byte_MOSI <= "0011001100110011";

reset_in <= '0' after 120 ns, '1' after 180 ns, '0'after 220 ns;



dut : entity work.SPI_Master
	port map (
	 clock_in => clock_in,
	reset_in => reset_in,
	MOSI => MOSI,
	SCLK => SCLK,
	MISO => MISO,
	RC_FS => RC_FS,
	RS_FS => RS_FS,
	RS_FM  => RS_FM,
	HS_FM => HS_FM,
	byte_MOSI => byte_MOSI,
	RC_FM => RC_FM );




end Architecture;




	--MOSI => MOSI,
	--SCLK => SCLK,
	--MISO => MISO,
	--RC_FS => RC_FS,
	--RS_FS => RS_FS,
	--RS_FM  => RS_FM,
	--RC_FM => RC_FM );
