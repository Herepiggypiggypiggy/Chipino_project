library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity EPO_3_sound_tb is
end entity;

 
Architecture TB of EPO_3_sound_tb is
 
	signal clock_in : std_logic ;
	signal reset_in :  std_logic; --reset from the fpga
	signal notes    : std_logic_vector(1 downto 0);
begin

--miso(00110010) (00001110)
clock_in <= '1' after 0 ns, '0' after 5 ns when clock_in /= '0' else '1' after 5 ns;
notes <= "00" after 0 ns, "01" after 1000000000 ns;
reset_in <= '0' after 0 ns, '1'after 5 ns, '0' after 15 ns;
dut : entity work.EPO_3_sound
	port map (
	clock_in => clock_in,
	notes    => notes,
	reset_in => reset_in);

end Architecture;