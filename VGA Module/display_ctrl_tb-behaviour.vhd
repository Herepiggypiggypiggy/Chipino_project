library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture behaviour of display_ctrl_tb is
    component display_ctrl
        port(
	clk,reset 	: in std_logic;
	IN_RED		: in std_logic_vector(3 downto 0);
	IN_GREEN	: in std_logic_vector(3 downto 0);
	IN_BLUE		: in std_logic_vector(3 downto 0);

	HS		: out std_logic;
	VS		: out std_logic;
	RED		: out std_logic_vector(3 downto 0);
	GREEN		: out std_logic_vector(3 downto 0);
	BLUE		: out std_logic_vector(3 downto 0));
    end component;

signal clk	: std_logic := '0';
signal reset	: std_logic;

signal IN_RED	: std_logic_vector(3 downto 0);
signal IN_GREEN	: std_logic_vector(3 downto 0);
signal IN_BLUE	: std_logic_vector(3 downto 0);

signal HS	: std_logic;
signal VS	: std_logic;
signal RED	: std_logic_vector(3 downto 0);
signal GREEN	: std_logic_vector(3 downto 0);
signal BLUE	: std_logic_vector(3 downto 0);
	
signal counter : std_logic_vector(9 downto 0);
begin
 test: display_ctrl port map (clk, reset, IN_RED,IN_GREEN,IN_BLUE,HS, VS, RED, GREEN, BLUE);

process (clk)
    variable count,count2 : integer:=0;
begin
    if rising_edge(clk) then
	counter <= std_logic_vector(to_unsigned(count2, counter'length));
	IN_RED <= counter(8)& "000";
	IN_GREEN <= counter(7 downto 4);
	IN_BLUE <= counter(3 downto 0);
	end if;
end process;
    clk <= not clk after 19.9 ns;
    reset <= '1' after 0 ns,  
             '0' after 40 ns; 
end behaviour;

