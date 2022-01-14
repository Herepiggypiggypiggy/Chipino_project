library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package parameter_def is
    constant h_display : unsigned(9 downto 0);
    constant h_fp      : unsigned(9 downto 0);
    constant h_sp      : unsigned(9 downto 0);
    constant h_bp      : unsigned(9 downto 0);

    constant v_display : unsigned(9 downto 0);
    constant V_FP      : unsigned(9 downto 0);
    constant V_SP      : unsigned(9 downto 0);
    constant V_BP      : unsigned(9 downto 0);

    constant h_margin  : unsigned(9 downto 0);

    constant pixel_num       : unsigned(4 downto 0);
    constant pixel_tile_data : unsigned(2 downto 0);
    constant pixel_tile      : unsigned(1 downto 0);

    constant info_lv       : unsigned(4 downto 0);
    constant info_lv_space : unsigned(4 downto 0);

    constant visibility_in : unsigned(21 downto 0);
    constant visibility_out : unsigned(21 downto 0);
end parameter_def;

package body parameter_def is
    constant h_display : unsigned(9 downto 0) := "1010000000";--640
    constant h_fp      : unsigned(9 downto 0) := "0000010000";--16
    constant h_sp      : unsigned(9 downto 0) := "0001100000";--96
    constant h_bp      : unsigned(9 downto 0) := "0000110000";--48

    constant V_DISPLAY : unsigned(9 downto 0) := "0111100000";--480
    constant V_FP      : unsigned(9 downto 0) := "0000001010";--10
    constant V_SP      : unsigned(9 downto 0) := "0000000010";--2
    constant V_BP      : unsigned(9 downto 0) := "0000100001";--33

    constant h_margin  : unsigned(9 downto 0) := "0000101000";--40

    constant pixel_num       : unsigned(4 downto 0) := "11111"; --31
    constant pixel_tile_data : unsigned(2 downto 0) := "111";   --7
    constant pixel_tile      : unsigned(1 downto 0) := "11";    --3

    constant info_lv       : unsigned(4 downto 0) := "00001";--1
    constant info_lv_SPACE : unsigned(4 downto 0) := "00001";--1

    constant visibility_in  : unsigned(21 downto 0) := "0000000000100100000000";--2304
    constant visibility_out : unsigned(21 downto 0) := "0000000001100100000000";--6400
end parameter_def;

