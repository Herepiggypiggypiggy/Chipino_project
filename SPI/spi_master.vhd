library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity spi_master is 
	port (
	reset_in : in std_logic; 
--reset from the fpga
	clk : in std_logic; 
--clock input into the master
------------SPI-Interface-------------
	
	MOSI : out std_logic; --The output byte
	SCLK : out std_logic; --Serial clock
	MISO : in  std_logic; --the input into the master coming from the slave
------------From-SLAVE(FS)----------------------  

	RC_FS : in std_logic; -- if this equals 1 the slave is ready for the MOSI output (ready to receive)
	RS_FS : in std_logic; -- the SLAVE is ready to send out the MISO signal (ready to send)
-----------From-MASTER(FM)------------------------
	
	RS_FM  : out std_logic; -- confirmation that the MISO has been received
	RC_FM : out std_logic; -- ready to receive a new MISO (ready to receive)
	HS_FM : out std_logic; -- MASTER has sent the byte
	byte_MOSI : in std_logic_vector(15 downto 0)
	
);
end entity spi_master;
