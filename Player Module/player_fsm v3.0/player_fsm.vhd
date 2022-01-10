library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity player_fsm is
port (
	clk            	: in  std_logic;
    reset          	: in  std_logic;
	button_x_left  	: in  std_logic;
    button_x_right 	: in  std_logic;
    button_y_up    	: in  std_logic;
    button_y_down  	: in  std_logic;
    button_mining  	: in  std_logic;
    animation_done  : in  std_logic;
    vga_done   		: in  std_logic;
    map_data_l     	: in  std_logic_vector(2 downto 0);
    map_data_r     	: in  std_logic_vector(2 downto 0);
    map_data_u     	: in  std_logic_vector(2 downto 0);
    map_data_d     	: in  std_logic_vector(2 downto 0);
    
    moved	       	: out std_logic;
    game_state     	: out std_logic_vector(1 downto 0);
    dir_mined      	: out std_logic_vector(2 downto 0);
    x_pos_out      	: out std_logic_vector(3 downto 0);
    y_pos_out      	: out std_logic_vector(3 downto 0);
    level      		: out std_logic_vector(4 downto 0);
	level_abs    	: out std_logic_vector(7 downto 0);
	energy 			: out std_logic_vector(8 downto 0);
	energy_abs   	: out std_logic_vector(11 downto 0);
	score      		: out std_logic_vector(9 downto 0);
	score_abs    	: out std_logic_vector(15 downto 0)
);
end player_fsm;
