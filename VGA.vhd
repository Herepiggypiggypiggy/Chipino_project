library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity VGA is
	port(
	clk,reset 	: in std_logic;
	IN_RED		: in std_logic_vector(2 downto 0);
	IN_GREEN	: in std_logic_vector(2 downto 0);
	IN_BLUE		: in std_logic_vector(2 downto 0);

	HS		: out std_logic;
	VS		: out std_logic;
	RED		: out std_logic_vector(2 downto 0);
	GREEN		: out std_logic_vector(2 downto 0);
	BLUE		: out std_logic_vector(2 downto 0));
end VGA;

architecture behaviour of VGA is 
	signal H_position :std_logic_vector(9 downto 0); 
	signal V_position :std_logic_vector(9 downto 0); 
	
	constant BlockWith : integer := 280;
	constant BlockPosX : integer := 200;
	constant BlockPosY : integer := 100;

	constant H_DISPLAY : integer := 640;
	constant H_FP : integer := 16;
	constant H_SP : integer := 96;
	constant H_BP : integer := 48;

	constant V_DISPLAY : integer := 480;
	constant V_FP : integer := 10;
	constant V_SP : integer := 2;
	constant V_BP : integer := 33;
	
	constant H_MARIGN : integer := 40;

	TYPE STATE_TYPE IS (readRGB, writeRGB);
	signal state : STATE_TYPE;




	begin
	process (clk,reset)
	variable Hcount : integer;
	variable Vcount : integer;
	begin
	if (rising_edge (clk)) then
		if (reset = '0') then
			Hcount := Hcount + 1;
			if (Hcount >= H_DISPLAY + H_FP and Hcount < H_DISPLAY + H_FP + H_SP) then
				HS <= '0';
				if (Hcount = H_DISPLAY + H_FP + H_MARIGN) then
					Vcount := Vcount + 1;
				end if;
			else
				HS <= '1';
				if (Hcount >= H_DISPLAY + H_FP + H_SP + H_BP) then
					Hcount := 0;
				end if;
			end if;
				
			if (Vcount >= V_DISPLAY +  V_FP and Vcount < V_DISPLAY + V_FP + V_SP) then
				VS <= '0';
			else	
				VS <= '1';
				if (Vcount >= V_DISPLAY + V_FP + V_SP + V_BP) then
					Vcount := 0;
				end if;
			end if;
		else
			Hcount := 0;
			Vcount := 0;
			HS <= '1';
			VS <= '1';		
		end if;
	end if;


        if (Hcount  >= BlockPosX and Hcount  < BlockPosX + BlockWith and Vcount >= BlockPosY and Vcount  < BlockPosY + BlockWith) then
		STATE <= writeRGB;
	else 
		STATE <= readRGB;
	end if;

	H_position <= std_logic_vector(to_unsigned(Hcount, H_position'length));
	V_position <= std_logic_vector(to_unsigned(Hcount, H_position'length));

	end process;

	process(STATE)
	begin
		if (STATE = writeRGB) then
			RED <= IN_RED;
			GREEN <= IN_GREEN;
			BLUE <= IN_BLUE;
		elsif (STATE = readRGB) then
			RED <= "000";
			GREEN <= "000";
			BLUE <= "000";
		end if;
	end process;
end architecture behaviour;
