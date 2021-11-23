library IEEE;
use IEEE.std_logic_1164.all;

entity color_driver is
port (
	clk 		: in std_logic;
	reset 		: in std_logic;
	color_address 	: in std_logic_vector(3 downto 0);

	red 		: out std_logic_vector(2 downto 0);
	green		: out std_logic_vector(2 downto 0);
	blue 		: out std_logic_vector(2 downto 0)

);
end color_driver;

architecture behavioural of color_driver is
	
begin
process (clk, reset, color_address)
begin
-- If reset is high, always select black --
if (reset = '1') then
	red <= "000";
	green <= "000";
	blue <= "000";
else
	-- Select color depending on the address --
	case color_address is
		-- Black --
		when "0000" =>
			red <= "000";
			green <= "000";
			blue <= "000";
		-- Red --
		when "0001" =>
			red <= "111";
			green <= "000";
			blue <= "000";
		-- Green --
		when "0011" =>
			red <= "000";
			green <= "111";
			blue <= "000";
		-- Blue --
		when "0100" =>
			red <= "000";
			green <= "000";
			blue <= "111";
		-- Gray --
		when "0101" =>
			red <= "100";
			green <= "100";
			blue <= "100";
		-- Pink -- 
		when "0110" =>
			red <= "111";
			green <= "000";
			blue <= "111";
		-- Yellow --
		when "0111" =>
			red <= "111";
			green <= "111";
			blue <= "000";
		-- Light Blue --
		when "1000" =>
			red <= "000";
			green <= "111";
			blue <= "111";
		-- Dark Blue --
		when "1001" =>
			red <= "000";
			green <= "000";
			blue <= "100";
		-- Dark Green --
		when "1010" =>
			red <= "000";
			green <= "100";
			blue <= "000";
		-- **Placeholder** --
		when "1011" =>
			red <= "000";
			green <= "000";
			blue <= "000";
		-- **Placeholder** --
		when "1100" =>
			red <= "000";
			green <= "000";
			blue <= "000";
		-- **Placeholder** --
		when "1101" =>
			red <= "000";
			green <= "000";
			blue <= "000";
		-- **Placeholder** --
		when "1110" =>
			red <= "000";
			green <= "000";
			blue <= "000";
		-- White --
		when "1111" =>
			red <= "111";
			green <= "111";
			blue <= "111";
		-- Exception: use black
		when others =>
			red <= "000";
			green <= "000";
			blue <= "000";
	end case;
		
end if;
end process;
end architecture behavioural;



