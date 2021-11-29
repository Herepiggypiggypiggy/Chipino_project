library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use ieee.std_logic_textio.all;
use std.textio.all;

architecture behaviour of display_ctrl_tb2 is
    component display_ctrl
        port(
	clk,reset 	: in std_logic;
	IN_RED		: in std_logic_vector(3 downto 0);
	IN_GREEN	: in std_logic_vector(3 downto 0);
	IN_BLUE		: in std_logic_vector(3 downto 0);
	Hcount 		: in unsigned(9 downto 0);
	Vcount 		: in unsigned(9 downto 0);
	hsync		: out std_logic;
	vsync		: out std_logic;
	red		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue		: out std_logic_vector(3 downto 0));
    end component;

	signal clk	: std_logic;
	signal reset	: std_logic;

	signal IN_RED	: std_logic_vector(3 downto 0);
	signal IN_GREEN	: std_logic_vector(3 downto 0);
	signal IN_BLUE	: std_logic_vector(3 downto 0);

	signal hsync	: std_logic;
	signal vsync	: std_logic;
	signal RED	: std_logic_vector(3 downto 0);
	signal GREEN	: std_logic_vector(3 downto 0);
	signal BLUE	: std_logic_vector(3 downto 0);

	-- Constants: Timings.
	constant H_DISPLAY : integer := 640;
	constant H_FP : integer := 16;
	constant H_SP : integer := 96;
	constant H_BP : integer := 48;

	constant V_DISPLAY : integer := 480;
	constant V_FP : integer := 10;
	constant V_SP : integer := 2;
	constant V_BP : integer := 33;

	-- Constants: For HS and VS intersection
	constant H_MARGIN : integer := 40;
	
	-- Signals
	signal new_Hcount : unsigned(9 downto 0) := (others => '0');
	signal new_Vcount : unsigned(9 downto 0) := (others => '0');
	
	signal Hcount : unsigned(9 downto 0) := (others => '0');
	signal Vcount : unsigned(9 downto 0) := (others => '0');
	signal hcounter, vcounter : std_logic_vector(9 downto 0);
begin
	test: display_ctrl port map (clk, reset, IN_RED,IN_GREEN,IN_BLUE,Hcount,vcount,hsync, vsync, RED, GREEN, BLUE);

process (clk)
	file file_pointer: text is out "write.txt";
    	variable line_el: line;
begin
	hcounter <=std_logic_vector(hcount);
	vcounter <=std_logic_vector(vcount);
    	if rising_edge(clk) then
		IN_RED <= hcounter(8)& "000" and  vcounter(8)& "000";
		IN_GREEN <= hcounter(7 downto 4) and  vcounter(7 downto 4);
		IN_BLUE <= hcounter (3 downto 0) and  vcounter(3 downto 0);
		  -- Write the time
        	write(line_el, now); -- write the line.
       	 	WRITE(line_el, string'(":")); -- write the line.

        	-- Write the hsync
        	write(line_el, string'(" "));
        	write(line_el, Hsync); -- write the line.

        	-- Write the vsync
        	write(line_el, string'(" "));
        	write(line_el, Vsync); -- write the line.

        	-- Write the red
        	write(line_el, string'(" "));
        	write(line_el, RED); -- write the line.

        	-- Write the green
        	write(line_el, string'(" "));
        	write(line_el, GREEN); -- write the line.

        	-- Write the blue
        	write(line_el, string'(" "));
        	write(line_el, BLUE); -- write the line.

        	writeline(file_pointer, line_el); -- write the contents into the file.
		end if;
end process;
    	clk <= not clk after 19.9 ns;
   	reset <= 	'1' after 0 ns,  
             		'0' after 40 ns; 
process(clk,reset)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				--Assign to internal signal
				Hcount <= (others => '0');
				Vcount <= (others => '0');	
			else
				--Assign to internal signal
				Hcount <= new_Hcount;
				Vcount <= new_Vcount;
			end if;
		end if;
	end process;
	process (Hcount,Vcount)
	begin
	
	--Hcounter COM
	if 	(Hcount < H_DISPLAY + H_FP + H_SP + H_BP) then
			  new_Hcount <= Hcount + 1;
	else
			  new_Hcount <= (others => '0');
	end if;

	--Vcounter COM
	if 	(Hcount > H_DISPLAY + H_FP and Hcount <= H_DISPLAY + H_FP + H_SP) then --HSync_pulse
		if 	(Hcount = 	H_DISPLAY + H_FP + H_MARGIN) then
					new_Vcount <= Vcount + 1;

		elsif 	(Vcount > V_DISPLAY + V_FP + V_SP + V_BP) then
			 new_Vcount 	<= 	(others => '0');
		else

			 new_Vcount <= Vcount;
		end if;
	else
		new_Vcount <= Vcount;
	end if;	
	end process;
end behaviour;

