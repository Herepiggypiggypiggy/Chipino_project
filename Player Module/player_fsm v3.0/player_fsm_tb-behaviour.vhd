library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of player_fsm_tb is
   component player_fsm
       port(button_x_left  : IN  std_logic;
        button_x_right : IN  std_logic;
        button_y_up    : IN  std_logic;
        button_y_down  : IN  std_logic;
        button_mining  : IN  std_logic;
        map_data_l     : IN  std_logic_vector(2 downto 0);
        map_data_r     : IN  std_logic_vector(2 downto 0);
        map_data_u     : IN  std_logic_vector(2 downto 0);
        map_data_d     : IN  std_logic_vector(2 downto 0);
        CLK            : IN  std_logic;
        reset          : IN  std_logic;
	vga_done       : IN  std_logic;
	animation_done   : IN  std_logic;
        dir_mined      : OUT std_logic_vector(2 downto 0);
        --energy_lvl_out   : OUT std_logic_vector(8 downto 0);
	--score_out    : OUT std_logic_vector(9 downto 0);
	level_out    : OUT std_logic_vector(4 downto 0);
	level_d_out    : OUT std_logic_vector(7 downto 0);
	score_d_out    : OUT std_logic_vector(15 downto 0);
	energy_d_out   : OUT std_logic_vector(11 downto 0);
        y_pos_out    : OUT std_logic_vector(3 downto 0);
        x_pos_out    : OUT std_logic_vector(3 downto 0);
	moved	: OUT std_logic;
	game_state : OUT std_logic_vector(1 downto 0));
   end component;


signal  level_d_out    : std_logic_vector(7 downto 0);
signal 	score_d_out    : std_logic_vector(15 downto 0);
signal 	energy_d_out   : std_logic_vector(11 downto 0);

   signal button_x_left  : std_logic;
   signal button_x_right : std_logic;
   signal button_y_up    : std_logic;
   signal button_y_down  : std_logic;
   signal button_mining  : std_logic;
   signal animate_done	 : std_logic;
   signal vga_done_out 	 : std_logic;
   signal map_data_l     : std_logic_vector(2 downto 0);
   signal map_data_r     : std_logic_vector(2 downto 0);
   signal map_data_u     : std_logic_vector(2 downto 0);
   signal map_data_d     : std_logic_vector(2 downto 0);
   signal CLK            : std_logic;
   signal reset          : std_logic;
   signal dir_mined      : std_logic_vector(2 downto 0);
   --signal energy_lvl_out   : std_logic_vector(8 downto 0);
   signal y_pos_out    : std_logic_vector(3 downto 0);
   signal x_pos_out    : std_logic_vector(3 downto 0);
	--signal score_out : std_logic_vector(9 downto 0);
	signal level_out : std_logic_vector(4 downto 0);
	signal moved		: std_logic;
begin
   test: player_fsm port map (button_x_left, button_x_right, button_y_up, button_y_down, button_mining, map_data_l, map_data_r, map_data_u, map_data_d, CLK, reset, vga_done_out, animate_done);
   	button_x_left <= '0' after 0 ns,
			'1' after 200 ns,
			'0' after 400 ns,
			'1' after 1800 ns,
			'0' after 2000 ns,
			'1' after 2200 ns,
			'0' after 2400 ns;
   button_x_right <= '0' after 0 ns,
		'1' after 1000 ns,
		'0' after 1200 ns;
   button_y_up <= '0' after 0 ns,
		'1' after 600 ns,
		'0' after 800 ns;
   button_y_down <= '0' after 0 ns,
		'1' after 1400 ns,
		'0' after 1600 ns,
		'1' after 2600 ns,
		'0' after 2800 ns;
   button_mining <= '0' after 0 ns,
		'1' after 150 ns,
		'0' after 400 ns,
		'1' after 650 ns,
		'0' after 800 ns,
		'1' after 1000 ns,
		'0' after 1200 ns,
		'1' after 1800 ns,
		'0' after 2000 ns,
		'1' after 2200 ns,
		'0' after 2400 ns;
   map_data_l(0) <= '0' after 0 ns;
   map_data_l(1) <= '0' after 0 ns;
   map_data_l(2) <= '1' after 0 ns;
   map_data_r(0) <= '0' after 0 ns;
   map_data_r(1) <= '0' after 0 ns;
   map_data_r(2) <= '1' after 0 ns;
   map_data_u(0) <= '0' after 0 ns;
   map_data_u(1) <= '1' after 0 ns;
   map_data_u(2) <= '0' after 0 ns;
   map_data_d(0) <= '1' after 0 ns;
   map_data_d(1) <= '0' after 0 ns;
   map_data_d(2) <= '1' after 0 ns;
   CLK <= '1' after 0 ns, '0' after 20 ns when CLK /= '0' else '1' after 20 ns;
   reset <= '1' after 0 ns,
            '0' after 80 ns;
 vga_done_out <= '0'after 0 ns,
		 '1'after 50 ns;
 animate_done <= '0'after 0 ns,
		 '1'after 50 ns;
end behaviour;
