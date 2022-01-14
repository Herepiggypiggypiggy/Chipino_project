library IEEE;
use IEEE.std_logic_1164.all;

architecture behavioural of color_ctrl is
	
begin
process (clk, reset, color_address)
begin
	-- Select color depending on the address --
	case color_address is
		-- Black --
		when "00000" =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
		-- White --
		when "00001" =>
			red <= "1111";
			green <= "1111";
			blue <= "1111";
		-- Magenta--
		when "00010" =>
			red <= "1101";
			green <= "0000";
			blue <= "1111";
		-- Background Red --
		when "00011" =>
			red <= "1101";
			green <= "0100";
			blue <= "0001";
		-- Dark Grey --
		when "00100" =>
			red <= "0100";
			green <= "0100";
			blue <= "0100";
		-- Light Grey --
		when "00101" =>
			red <= "0111";
			green <= "0111";
			blue <= "0111";
		-- Orange -- 
		when "00110" =>
			red <= "1111";
			green <= "1001";
			blue <= "0000";
		-- Yellow --
		when "00111" =>
			red <= "1111";
			green <= "1010";
			blue <= "0000";
		-- Denim Blue --
		when "01000" =>
			red <= "0000";
			green <= "0101";
			blue <= "1101";
		-- Mole Brown --
		when "01001" =>
			red <= "0110";
			green <= "0100";
			blue <= "0011";
		-- Diamond --
		when "01010" =>
			red <= "0001";
			green <= "1111";
			blue <= "1111";
		-- Lighter Grey --
		when "01011" =>
			red <= "1001";
			green <= "1001";
			blue <= "1001";
		-- Light Yellow --
		when "01100" =>
			red <= "1111";
			green <= "1101";
			blue <= "0011";
		-- Light Blue --
		when "01101" =>
			red <= "0001";
			green <= "0111";
			blue <= "1101";
		-- Dark Diamond --
		when "01110" =>
			red <= "0011";
			green <= "1101";
			blue <= "1101";
		-- Light Orange --
		when "01111" =>
			red <= "1111";
			green <= "1011";
			blue <= "0101";
		-- Swamp Green --
		when "10000" =>
			red <= "0000";
			green <= "0100";
			blue <= "0100";
		-- Spirit Blue --
		when "10001" =>
			red <= "0100";
			green <= "1010";
			blue <= "1110";
		-- Caustic Green --
		when "10010" =>
			red <= "1010";
			green <= "1100";
			blue <= "0010";
		-- Lavender --
		when "10011" =>
			red <= "1100";
			green <= "1000";
			blue <= "1100";
		-- Ice --
		when "10100" =>
			red <= "1100";
			green <= "1110";
			blue <= "1110";
		-- Lava --
		when "10101" =>
			red <= "1110";
			green <= "0100";
			blue <= "0000";
		-- Lightest grey --
   		when "10110" =>
   		       red <= "1100";
     		       green <= "1100";
     		       blue <= "1100";
		-- Beige --
   		when "10111" =>
   		       red <= "1110";
     		       green <= "1100";
     		       blue <= "1000";

		-- Green --
   		when "11000" =>
   		       red <= "0000";
     		       green <= "1000";
     		       blue <= "0000";

		-- Green --
   		when "11001" =>
   		       red <= "0000";
     		       green <= "0100";
     		       blue <= "0000";

		-- Exception: use black
		when others =>
			red <= "0000";
			green <= "0000";
			blue <= "0000";
	end case;
end process;
end architecture behavioural;


