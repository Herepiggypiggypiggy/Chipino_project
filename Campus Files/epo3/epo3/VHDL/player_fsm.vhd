library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity player_fsm is
    port (	clk            : IN  std_logic;
            reset          : IN  std_logic;
            button_x_left  : IN  std_logic;
            button_x_right : IN  std_logic;
            button_y_up    : IN  std_logic;
            button_y_down  : IN  std_logic;
            button_mining  : IN  std_logic;
            map_data_l     : IN  std_logic_vector(2 downto 0);
            map_data_r     : IN  std_logic_vector(2 downto 0);
            map_data_u     : IN  std_logic_vector(2 downto 0);
            map_data_d     : IN  std_logic_vector(2 downto 0);
            vga_done       : IN  std_logic;
            animation_done : IN  std_logic;
            
            dir_mined      : OUT std_logic_vector(2 downto 0);
            level_out      : OUT std_logic_vector(4 downto 0);
            energy_d_out   : OUT std_logic_vector(11 downto 0);
            score_d_out    : OUT std_logic_vector(15 downto 0);
            level_d_out    : OUT std_logic_vector(7 downto 0);
            y_pos_out      : OUT std_logic_vector(3 downto 0);
            x_pos_out      : OUT std_logic_vector(3 downto 0);
            moved	       : OUT std_logic;
            game_state     : OUT std_logic_vector(1 downto 0));
end player_fsm;

