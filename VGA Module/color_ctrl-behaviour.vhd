library IEEE;
use IEEE.std_logic_1164.all;

architecture behavioural of color_ctrl is
	
begin
process (clk, reset, color_address)
begin
	-- Select color depending on the address --
	case color_address is
		-- Black --
		when "0000" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- White --
		when "0001" =>
			red <= "1110";
			green <= "1110";
			blue <= "1110";
		-- **Placeholder**--
		when "0010" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- Background Red --
		when "0011" =>
			red <= "1100";
			green <= "0100";
			blue <= "0000";
		-- Dark Grey --
		when "0100" =>
			red <= "0100";
			green <= "0100";
			blue <= "0100";
		-- Light Grey --
		when "0101" =>
			red <= "0110";
			green <= "0110";
			blue <= "0110";
		-- Orange -- 
		when "0110" =>
			red <= "1110";
			green <= "1000";
			blue <= "0000";
		-- Yellow --
		when "0111" =>
			red <= "1110";
			green <= "1010";
			blue <= "0000";
		-- Denim Blue --
		when "1000" =>
			red <= "0000";
			green <= "0100";
			blue <= "1100";
		-- Mole Brown --
		when "1001" =>
			red <= "0110";
			green <= "0100";
			blue <= "0100";
		-- Diamond --
		when "1010" =>
			red <= "0010";
			green <= "1110";
			blue <= "1110";
		-- Lighter Grey --
		when "1011" =>
			red <= "1001";
			green <= "1001";
			blue <= "1001";
		-- Light Yellow --
		when "1100" =>
			red <= "1111";
			green <= "1101";
			blue <= "0011";
		-- Light Blue --
		when "1101" =>
			red <= "0001";
			green <= "0111";
			blue <= "1101";
		-- Dark Diamond --
		when "1110" =>
			red <= "0011";
			green <= "1101";
			blue <= "1101";
		-- Light Orange --
		when "1111" =>
			red <= "1111";
			green <= "1011";
			blue <= "0101";
		-- Exception: use black
		when others =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
	end case;
end process;
end architecture behavioural;



