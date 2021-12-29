library ieee;
use ieee.std_logic_1164.all;

entity player_MOSI_data is
   port(clk         : IN std_logic;
        reset       : IN std_logic;
        x_pos_out   : IN std_logic_vector (3 downto 0);
        y_pos_out   : IN std_logic_vector (3 downto 0);
        level_out   : IN std_logic_vector (4 downto 0);
        dir_mined   : IN std_logic_vector (2 downto 0);
        moved       : IN std_logic;
        MOSI_data   : OUT std_logic_vector (15 downto 0);
        send        : OUT std_logic
        );
end player_MOSI_data;

library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of player_MOSI_data is
begin

    process (x_pos_out, y_pos_out, level_out, dir_mined, moved)
    begin
        if (moved = '1' and dir_mined(2) = '0') then
            send <= '1';
            MOSI_data(3 downto 0) <= x_pos_out;
            MOSI_data(7 downto 4) <= y_pos_out;
            MOSI_data(12 downto 8) <= level_out;
            MOSI_data(13) <= '1';
            MOSI_data(15 downto 14) <= (others => '0');
        elsif (moved = '0' and dir_mined(2) = '1') then
            send <= '1';
            if (dir_mined(1 downto 0) = "00") then -- left
                MOSI_data(3 downto 0) <= std_logic_vector(unsigned(x_pos_out)-1);
                MOSI_data(7 downto 4) <= y_pos_out;
            elsif (dir_mined(1 downto 0) = "01") then -- right
                MOSI_data(3 downto 0) <= std_logic_vector(unsigned(x_pos_out)+1);
                MOSI_data(7 downto 4) <= y_pos_out;
            elsif (dir_mined(1 downto 0) = "10") then -- up
                MOSI_data(3 downto 0) <= x_pos_out;
                MOSI_data(7 downto 4) <= std_logic_vector(unsigned(y_pos_out)-1);
            elsif (dir_mined(1 downto 0) = "11") then -- down
                MOSI_data(3 downto 0) <= x_pos_out;
                MOSI_data(7 downto 4) <= std_logic_vector(unsigned(y_pos_out)+1);
            end if;
            MOSI_data(12 downto 8) <= level_out;
            MOSI_data(13) <= '0';
            MOSI_data(15 downto 14) <= (others => '0');
            
        else
            send <= '0';
            MOSI_data <= (others => '0');
        end if;
    end process;

end behaviour;