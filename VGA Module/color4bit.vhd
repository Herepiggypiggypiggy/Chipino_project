	library IEEE;
use IEEE.std_logic_1164.all;

entity color_driver is
port (
	clk 		: in std_logic;
	reset 		: in std_logic;
	color_address 	: in std_logic_vector(3 downto 0);

	red 		: out std_logic_vector(3 downto 0);
	green		: out std_logic_vector(3 downto 0);
	blue 		: out std_logic_vector(3 downto 0)

);
end color_driver;

architecture behavioural of color_driver is
	
begin
process (clk, reset, color_address)
begin
-- If reset is high, always select black --
if (reset = '1') then
	red <= "0000";
	green <= "0000";
	blue <= "0000";
else
	-- Select color depending on the address --
	case color_address is
		-- Black --
		when "0000" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- White --
		when "0001" =>
			red <= "1111";
			green <= "1111";
			blue <= "1111";
		-- **Placeholder**--
		when "0010" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- Background Red --
		when "0011" =>
			red <= "1101";
			green <= "0100";
			blue <= "0001";
		-- Dark Grey --
		when "0100" =>
			red <= "0100";
			green <= "0100";
			blue <= "0100";
		-- Light Grey --
		when "0101" =>
			red <= "0111";
			green <= "0111";
			blue <= "0111";
		-- Orange -- 
		when "0110" =>
			red <= "1111";
			green <= "1001";
			blue <= "0000";
		-- Yellow --
		when "0111" =>
			red <= "1111";
			green <= "1010";
			blue <= "0000";
		-- Denim Blue --
		when "1000" =>
			red <= "0000";
			green <= "0101";
			blue <= "1101";
		-- Mole Brown --
		when "1001" =>
			red <= "0110";
			green <= "0100";
			blue <= "0011";
		-- Diamond --
		when "1010" =>
			red <= "0001";
			green <= "1111";
			blue <= "1111";
		-- **Placeholder** --
		when "1011" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- **Placeholder** --
		when "1100" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- **Placeholder** --
		when "1101" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- **Placeholder** --
		when "1110" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- **Placeholder** --
		when "1111" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- Exception: use black
		when others =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
	end case;
		
end if;
end process;
end architecture behavioural;



