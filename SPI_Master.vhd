library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity SPI_Master is 
	generic ( --There is no mode because one will be chosen before
	CLK_Frequency : integer := 2 --clock input from the fpga
		);

	port (
	reset_in : in std_logic; --reset from the fpga
	clock_in : in std_logic; --clock input into the master
------------SPI-Interface-------------
	
	MOSI : out std_logic_vector(7 downto 0); --The output byte
	SCLK : out std_logic; --Serial clock
	MISO : in  std_logic; --the input into the master coming from the slave

------------From-SLAVE(FS)----------------------  

	RC_FS : in std_logic; -- if this equals 1 the slave is ready for the MOSI output (ready to receive)
	RS_FS : in std_logic; -- the SLAVE is ready to send out the MISO signal (ready to send)
-----------From-MASTER(FM)------------------------
	
	RS_FM  : in std_logic; -- confirmation that the MISO has been received
	RC_FM : in std_logic -- ready to receive a new MISO (ready to receive)
	
	);
end entity SPI_Master;

Architecture RTL of SPI_Master is
	signal CPOL : std_logic; -- used for the mode
	signal CPHA : std_logic; -- used for the mode

	signal bit_count_master : std_logic_vector(2 downto 0);

	signal clock_count : integer; --clock counter
	signal clock_counter_max : integer; --max clock counter
	signal clock_internal : std_logic;


begin


--------clock counter--------
--clock_counter_max <= '1' when (to_integer(clock_count) = 4) else '0';
clock_counter_max <= 4;
clock_counter : process(clock_in)

begin
	if(rising_edge(clock_in)) then
		if(reset_in = '1' or (clock_count = clock_counter_max)) then
		 	clock_count <= 0;
		else
			clock_count <= clock_count +1;
		end if;
	end if;
end process;

--------SPI clock generator--------

SPI_clock_generator : process(clock_in)
begin
	if(rising_edge(clock_in)) then
	
		if(clock_count = clock_counter_max) then
			if(clock_internal = '0') then
				clock_internal <= '1';
				
			else
				clock_internal <= '0';
			end if;
			
		end if;
	end if;
	
end process;
			
SCLK <= clock_internal;




end Architecture;


















