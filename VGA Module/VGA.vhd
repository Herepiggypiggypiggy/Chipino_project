library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Entity of VGA
entity VGA is
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
end VGA;

-- Architecture of VGA
architecture behaviour of VGA is 
	-- Constants: Placement and width of square.
	constant BlockWith : integer := 280;
	constant BlockPosX : integer := 200;
	constant BlockPosY : integer := 100;

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
	constant H_MARIGN : integer := 40;
	
	-- Signals
	signal Hcount : unsigned(9 downto 0) := (others => '0');
	signal Vcount : unsigned(9 downto 0) := (others => '0');

	signal new_Hcount : unsigned(9 downto 0) := (others => '0');
	signal new_Vcount : unsigned(9 downto 0) := (others => '0');

	begin

	-- Process: Combinatorial
	-- Takes the signals from the register and computes outputs: HS, VS, New value of counter.
	process (Hcount,Vcount)
	begin
		new_Hcount <= Hcount + 1;
		if (Hcount >= H_DISPLAY + H_FP and Hcount < H_DISPLAY + H_FP + H_SP) then --HSync_pulse
			HS <= '0';
			if (Hcount = H_DISPLAY + H_FP + H_MARIGN) then
				new_Vcount <= Vcount + 1;
			end if;
		else
			HS <= '1';
			if (Hcount >= H_DISPLAY + H_FP + H_SP + H_BP) then
				new_Hcount <= (others => '0');
			end if;
		end if;	
		if (Vcount >= V_DISPLAY +  V_FP and Vcount < V_DISPLAY + V_FP + V_SP) then --VSync_pulse
			VS <= '0';
		else	
			VS <= '1';
			if (Vcount >= V_DISPLAY + V_FP + V_SP + V_BP) then
				new_Vcount 	<= 	(others => '0');
			end if;
		end if;

		if (Hcount >= H_DISPLAY or Vcount >= V_DISPLAY) then
			RED 	<= 	(others => '0');
			GREEN	<=	(others => '0');
			BLUE 	<=	(others => '0');
		else
			-- Assigns Outputs color when the Hcount and Vcount are in the square.   (TEMP)
			if (Hcount >= BlockPosX and Hcount <= BlockPosX + BlockWith and Vcount >= BlockPosY and Vcount <= BlockPosY + BlockWith) then
				RED 	<= 	"1111";
				GREEN	<=	"1111";
				BLUE 	<=	"0000";
			else
				RED 	<= 	(others => '0');
				GREEN	<=	(others => '0');
				BLUE 	<=	(others => '0');
			end if;
		end if;

		
	end process;

	-- Process: Sequential
	-- Stores new values of Hcount and Vcount in the register.
	process(clk,reset)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				Hcount <= (others => '0');
				Vcount <= (others => '0');
			else
				Hcount <= new_Hcount;
				Vcount <= new_Vcount;
			end if;
		end if;
	end process;
end architecture behaviour;