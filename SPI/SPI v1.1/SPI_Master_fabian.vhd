library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity SPI_Master is 
	port (
	reset_in : in std_logic; --reset from the fpga
	clock_in : in std_logic; --clock input into the master
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
end entity SPI_Master;

Architecture RTL of SPI_Master is
	signal bit_counter_master : unsigned(4 downto 0); --2^5

	signal clock_count : integer:=0; --clock counter
	signal clock_counter_max : integer; --max clock counter
	signal clock_internal : std_logic;

	signal byte_MOSI_SPI_setup : std_logic_vector(7 downto 0);
	
	signal bit_counter_master_next : unsigned(4 downto 0);
	signal MOSI_next : std_logic; 

	signal MISO_setup : std_logic;
	signal bit_counter_slave : integer;
	signal bit_counter_slave_next: unsigned(3 downto 0);
	signal HR_FM : std_logic;
	signal byte_MISO : std_logic_vector(8 downto 0);
	signal byte_MISO_storage : std_logic_vector(8 downto 1);
	signal bit_counter_slave_max : integer; 
begin


--------clock counter--------
clock_counter_max <= 8;
clock_counter : process(clock_in)

begin
	if(rising_edge(clock_in)) then
		if((clock_count = clock_counter_max)) then
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

byte_MOSI_SPI_setup <= "11110011";

			
SCLK <= clock_internal;

-----------MOSI-------------------------
MOSI_counter : process(clock_internal)
begin
	if(rising_edge(clock_internal)) then

		if(reset_in = '1' or RC_FS = '1') then
			MOSI <= '0';
			bit_counter_master <= (others => '0');
		else
			bit_counter_master <= bit_counter_master_next;
			MOSI <= MOSI_next;
		end if;
	end if;
end process;
MOSI_DATA : process(bit_counter_master) 
begin


			if(bit_counter_master <8 ) then
				MOSI_next <= byte_MOSI_SPI_setup(to_integer(bit_counter_master)); 
				bit_counter_master_next <= bit_counter_master + 1;

		
			elsif(bit_counter_master >= 8 and bit_counter_master <24) then
				MOSI_next <= byte_MOSI(to_integer(bit_counter_master-8));
				bit_counter_master_next <= bit_counter_master + 1;

			
			elsif(bit_counter_master = 24) then
				HS_FM <= '1';
				RS_FM <= '1';
				MOSI_next <= '0';

			end if;

end process;


----------------MISO---------------------

--MISO_counter : process(clock_internal)
--begin
	--if(rising_edge(clock_internal)) then
		--if(reset_in = '1' or RS_FS = '1') then
		--bit_counter_slave <= (others => '0');
--		MISO_setup <= '0';
	 --       else
		--bit_counter_slave <= bit_counter_slave_next;
		--MISO_setup <= MISO; 
		--end if;
	--end if;
--end process;

--MISO_DATA : process(bit_counter_slave)
--begin
		--if(bit_counter_slave <16) then
			--byte_MISO(to_integer(bit_counter_slave)) <= MISO_setup;
			--bit_counter_slave_next <= bit_counter_slave +1;
		--elsif(bit_counter_slave = 16) then
			--RC_FM <= '1';
			
		--end if;
	
--end process;

--MISO_storage : process(clock_internal)
--begin
	--if(RS_FS = '1') then
		--byte_MISO_storage <= byte_MISO;
	--else 
		--byte_MISO_storage <= byte_MISO_storage;
	--end if;
--end process;

bit_counter_slave_max <= 8;

MISO_DATA : process(clock_internal)
begin 
	if(rising_edge(clock_internal)) then
		if(reset_in = '1' or bit_counter_slave = bit_counter_slave_max) then
			--byte_MISO <= "000000000";
			bit_counter_slave <= 0;
		else
			byte_MISO(8) <= MISO;
			byte_MISO(7 downto 0) <= byte_MISO(8 downto 1);
			bit_counter_slave <= bit_counter_slave + 1;
		end if;
	end if;
end process;
		

MISO_storage : process(bit_counter_slave, bit_counter_slave_max)
begin
	if(bit_counter_slave = bit_counter_slave_max) then
		byte_MISO_storage(8 downto 1) <= byte_MISO(8 downto 1);
	else 
		byte_MISO_storage <= byte_MISO_storage;
	end if;
end process;

end Architecture;

















