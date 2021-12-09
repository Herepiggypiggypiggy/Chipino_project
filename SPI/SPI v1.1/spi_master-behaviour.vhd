library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of spi_master is
	signal bit_counter_master : unsigned(4 downto 0); --2^5

	signal clock_count : integer:=0; --clock counter
	signal clock_counter_max : integer; --max clock counter
	signal clk_internal : std_logic;

	signal byte_MOSI_SPI_setup : std_logic_vector(7 downto 0);
	
	signal bit_counter_master_next : unsigned(4 downto 0);
	signal MOSI_next : std_logic; 

	signal MISO_setup : std_logic;
	signal bit_counter_slave : unsigned(3 downto 0);
	signal bit_counter_slave_next: unsigned(3 downto 0);
	signal HR_FM : std_logic;
	signal byte_MISO : std_logic_vector(15 downto 0);
	signal byte_MISO_storage : std_logic_vector(15 downto 0);
	
begin


--------clock counter--------
clock_counter_max <= 8;
clock_counter : process(clk)

begin
	if(rising_edge(clk)) then
		if((clock_count = clock_counter_max)) then
		 	clock_count <= 0;
		else
			clock_count <= clock_count +1;
		end if;
	end if;
end process;

--------SPI clock generator--------

SPI_clock_generator : process(clk)
begin
	if(rising_edge(clk)) then
	
		if(clock_count = clock_counter_max) then
			if(clk_internal = '0') then
				clk_internal <= '1';
				
			else
				clk_internal <= '0';
			end if;
			
		end if;
	end if;
	
end process;

byte_MOSI_SPI_setup <= "11110011";

			
SCLK <= clk_internal;

-----------MOSI-------------------------
MOSI_counter : process(clk_internal)
begin
	if(rising_edge(clk_internal)) then

		if(reset_in = '1' or RC_FS = '1') then
			MOSI <= '0';
			bit_counter_master <= (others => '0');
		else
			bit_counter_master <= bit_counter_master_next;
			MOSI <= MOSI_next;
		end if;
	end if;
end process;
MOSI_DATA : process(bit_counter_master, byte_MOSI_SPI_setup, byte_MOSI) 
begin


			if(bit_counter_master <8 ) then
				MOSI_next <= byte_MOSI_SPI_setup(to_integer(bit_counter_master)); 
				bit_counter_master_next <= bit_counter_master + 1;
				HS_FM <= '0';
				RS_FM <= '0';

		
			elsif(bit_counter_master >= 8 and bit_counter_master <24) then
				MOSI_next <= byte_MOSI(to_integer(bit_counter_master-8));
				bit_counter_master_next <= bit_counter_master + 1;
				HS_FM <= '0';
				RS_FM <= '0';

			
			elsif(bit_counter_master = 24) then
				HS_FM <= '1';
				RS_FM <= '1';
				MOSI_next <= '0';
				bit_counter_master_next<= (others => '0');
			else
				HS_FM <= '1';
				RS_FM <= '1';
				MOSI_next <= '0';
				bit_counter_master_next<= (others => '0');
			end if;

end process;


----------------MISO---------------------

--MISO_counter : process(clk_internal)
--begin
--	if(rising_edge(clk_internal)) then
--		if(reset_in = '1' or RS_FS = '1') then
--		bit_counter_slave <= (others => '0');
--		MISO_setup <= '0';
--	        else
--		bit_counter_slave <= bit_counter_slave_next;
--		MISO_setup <= MISO; 
--		end if;
--	end if;
--end process;
--
--MISO_DATA : process(bit_counter_slave, MISO_setup)
--begin
--		if(bit_counter_slave <16) then
--			byte_MISO(to_integer(bit_counter_slave)) <= MISO_setup;
--			bit_counter_slave_next <= bit_counter_slave +1;
--			RC_FM <= '0';
--		else
--			byte_MISO <= (others => '0');
--			bit_counter_slave_next <= (others => '0');
--			RC_FM <= '1';
--		end if;
--end process;
--
--MISO_storage : process(clk_internal)
--begin
--	if(RS_FS = '1') then
--		byte_MISO_storage <= byte_MISO;
--	else 
--		byte_MISO_storage <= byte_MISO_storage;
--	end if;
--end process;
end behaviour;

