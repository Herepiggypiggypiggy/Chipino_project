library ieee;
use ieee.std_logic_1164.all;

entity player_to_SPI is
   port(clk         : IN std_logic;
        reset       : IN std_logic;
        x_pos_out   : IN std_logic_vector (3 downto 0);
        y_pos_out   : IN std_logic_vector (3 downto 0);
        level       : IN std_logic_vector (4 downto 0);
        dir_mined   : IN std_logic_vector (2 downto 0);
        moved       : IN std_logic;
        to_spi      : OUT std_logic_vector (13 downto 0);
        send_spi    : OUT std_logic
        );
end player_to_SPI;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of player_to_SPI is
begin

    process (x_pos_out, y_pos_out, level, dir_mined, moved)
    begin
        if (moved = '1' and dir_mined(2) = '0') then
            send_spi <= '1';
            to_spi(3 downto 0) <= x_pos_out;
            to_spi(7 downto 4) <= y_pos_out;
            to_spi(12 downto 8) <= level;
            to_spi(13) <= '0';
        elsif (moved = '0' and dir_mined(2) = '1') then
            send_spi <= '1';
            if (dir_mined(1 downto 0) = "00") then -- left
                to_spi(3 downto 0) <= std_logic_vector(unsigned(x_pos_out)-1);
                to_spi(7 downto 4) <= y_pos_out;
            elsif (dir_mined(1 downto 0) = "01") then -- right
                to_spi(3 downto 0) <= std_logic_vector(unsigned(x_pos_out)+1);
                to_spi(7 downto 4) <= y_pos_out;
            elsif (dir_mined(1 downto 0) = "10") then -- up
                to_spi(3 downto 0) <= x_pos_out;
                to_spi(7 downto 4) <= std_logic_vector(unsigned(y_pos_out)-1);
            elsif (dir_mined(1 downto 0) = "11") then -- down
                to_spi(3 downto 0) <= x_pos_out;
                to_spi(7 downto 4) <= std_logic_vector(unsigned(y_pos_out)+1);
            end if;
            to_spi(12 downto 8) <= level;
            
        else
            send_spi <= '0';
            to_spi <= (others => '0');
        end if;
    end process;

end behaviour;