library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of color3to4bit is
begin
process(red_in,green_in,blue_in)
begin
	case red_in is
		when "000" => red <= "0000";
		when "001" => red <= "0011";
		when "010" => red <= "0100";
		when "011" => red <= "0111";
		when "100" => red <= "1001";
		when "101" => red <= "1010";
		when "110" => red <= "1101";
		when "111" => red <= "1111";
		when others => red <= "0000";
	end case;

	case green_in is
		when "000" => green <= "0000";
		when "001" => green <= "0011";
		when "010" => green <= "0100";
		when "011" => green <= "0111";
		when "100" => green <= "1001";
		when "101" => green <= "1010";
		when "110" => green <= "1101";
		when "111" => green <= "1111";
		when others => green <= "0000";
	end case;

	case blue_in is
		when "000" => blue <= "0000";
		when "001" => blue <= "0011";
		when "010" => blue <= "0100";
		when "011" => blue <= "0111";
		when "100" => blue <= "1001";
		when "101" => blue <= "1010";
		when "110" => blue <= "1101";
		when "111" => blue <= "1111";
		when others => blue <= "0000";
	end case;
end process;
end architecture;
