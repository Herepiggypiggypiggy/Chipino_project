library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of module_test is
   type playermap_state is (playermiddle, playerleft, playerup, playerdown, playerright);
   signal state, new_state: playermap_state;
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
        dir_mined      : OUT std_logic_vector(2 downto 0);
        energy_lvl_out   : OUT std_logic_vector(8 downto 0);
	score_out    : OUT std_logic_vector(9 downto 0);
	level_out    : OUT std_logic_vector(4 downto 0);
	level_d_out    : OUT std_logic_vector(7 downto 0);
	score_d_out    : OUT std_logic_vector(15 downto 0);
	energy_d_out   : OUT std_logic_vector(11 downto 0);
        y_pos_out    : OUT std_logic_vector(3 downto 0);
        x_pos_out    : OUT std_logic_vector(3 downto 0);
	moved	: OUT std_logic;
	game_state : OUT std_logic_vector(1 downto 0);
	animation_done 	: in std_logic);
end component;

component VGA
port (	clk 		: in    std_logic;
        reset 		: in    std_logic;
        map_data	: in    std_logic_vector(71 downto 0);
        Xplayer		: in    std_logic_vector(3 downto 0);
        Yplayer		: in    std_logic_vector(3 downto 0);
        score 		: in    std_logic_vector(15 downto 0);
        energy		: in    std_logic_vector(11 downto 0);
        level 		: in    std_logic_vector(7 downto 0);
        game_state  : in    std_logic_vector(1 downto 0);
        timer1_out	: out   unsigned(5 downto 0);
        timer2_out	: out   unsigned(5 downto 0);
        hsync		: out   std_logic;
        vsync		: out   std_logic;
        red		    : out   std_logic_vector(3 downto 0);
        green		: out   std_logic_vector(3 downto 0);
        blue		: out   std_logic_vector(3 downto 0);
        vga_done_out: out   std_logic;
        animation_done 	: out std_logic);
end component;

signal  button_x_left   : std_logic;
signal  button_x_right  : std_logic;
signal  button_y_up     : std_logic;
signal  button_y_down   : std_logic;
signal  button_mining   : std_logic;
signal  map_data_l      : std_logic_vector(2 downto 0);
signal  map_data_r      : std_logic_vector(2 downto 0);
signal  map_data_u      : std_logic_vector(2 downto 0);
signal  map_data_d      : std_logic_vector(2 downto 0);


signal  dir_mined       : std_logic_vector(2 downto 0);
signal  energy_lvl_out  : std_logic_vector(8 downto 0);
signal  score_out       : std_logic_vector(9 downto 0);
signal  level_out       : std_logic_vector(4 downto 0);
signal  moved	        : std_logic;

signal  map_data	: std_logic_vector(71 downto 0);
signal	Xplayer		: std_logic_vector(3 downto 0);
signal	Yplayer		: std_logic_vector(3 downto 0);

signal  y_pos_out       : std_logic_vector(3 downto 0);
signal  x_pos_out       : std_logic_vector(3 downto 0);

signal	score 		: std_logic_vector(15 downto 0);
signal	energy		: std_logic_vector(11 downto 0);
signal	level 	    : std_logic_vector(7 downto 0);
signal  game_state  : std_logic_vector(1 downto 0);
signal  timer1		: unsigned(5 downto 0);
signal	timer2		: unsigned(5 downto 0);
signal  level_d_out     : std_logic_vector(7 downto 0);
signal  score_d_out     : std_logic_vector(15 downto 0);
signal  energy_d_out    : std_logic_vector(11 downto 0);

signal animation_done 	: std_logic;
signal vga_done_out : std_logic;


begin
level <=  std_logic_vector(level_d_out);
energy <=  std_logic_vector(energy_d_out);
score <=  std_logic_vector(score_d_out);
yplayer <=  std_logic_vector(y_pos_out);
xplayer <=  std_logic_vector(x_pos_out);

fsm_com: player_fsm
port map(   button_x_left,  --input
            button_x_right, --input
            button_y_up,    --input
            button_y_down,  --input
            button_mining,  --input
            map_data_l,     --input
            map_data_r,     --input
            map_data_u,     --input
            map_data_d,     --input
            clk,            --set
            reset,          --set
            dir_mined,      --not interesting
            energy_lvl_out, --not interesting
            score_out,      --not interesting
            level_out,      --not interesting
            level_d_out,          --input
            score_d_out,          --input
            energy_d_out,         --input
            y_pos_out,        --set
            x_pos_out,        --set
            moved,
	    game_state,
	    animation_done);         --not interesting

vga_com: VGA 
port map(   clk,        --set
            reset,      --set
            map_data,   --input
            Xplayer,    --set
            Yplayer,    --set
            score,      --set
            energy,     --set
            level,      --set
            game_state, --input
            timer1,     --not interesting
            timer2,     --not interesting
            hsync,      --set
            vsync,      --set
            red,        --set
            green,      --set
            blue,		--set
            vga_done_out,
            animation_done);      
   
process (clk)
   begin
      if (clk'event and clk = '1') then
         if reset = '1' then
            state <= playermiddle;
         else
            state <= new_state;
         end if;
      end if;
   end process;

      
process(clk,reset)
begin

if(bleft  = '1')  then  button_x_left     <= '1'; else button_x_left  <= '0'; end if;
if(bright = '1')  then  button_x_right    <= '1'; else button_x_right <= '0'; end if;
if(up     = '1')  then  button_y_up       <= '1'; else button_y_up    <= '0'; end if;
if(down   = '1')  then  button_y_down     <= '1'; else button_y_down  <= '0'; end if;
if(mining = '1')  then  button_mining     <= '1'; else button_mining  <= '0'; end if;

map_data_l <= map_data(53 downto 51);
map_data_r <= map_data(20 downto 18);
map_data_u <= map_data(35 downto 33);
map_data_d <= map_data(38 downto 36);


  case state is
         when playermiddle =>
			map_data 	<= "000000000000000000011000000000000011011000000000000011000000000000000000";
       		 if (button_x_left = '1') then
			new_state <= playerleft;
      		 elsif (button_y_up = '1') then
			new_state <= playerup;
      		 elsif (button_y_down = '1') then
			new_state <= playerdown;
      		 elsif (button_x_right = '1') then
			new_state <= playerright;
		 else
			new_state <= playermiddle;
           	 end if;

         when playerleft =>
			map_data 	<= "000000000000000000000000000000000000000000000000011011011000000011000000";
       		 if (button_x_right = '1') then
			new_state <= playermiddle;
		 else
			new_state <= playerleft;
           	 end if;

         when playerup =>
			map_data 	<= "000000000000000000000011000000000000011011000000000000011000000000000000";
       		 if (button_y_down = '1') then
			new_state <= playermiddle;
		 else
			new_state <= playerup;
           	 end if;

         when playerdown =>
			map_data 	<= "000000000000000011000000000000011011000000000000011000000000000000000000";
       		 if (button_y_up = '1') then
			new_state <= playermiddle;
		 else
			new_state <= playerdown;
           	 end if;

         when playerright =>
			map_data 	<= "000000011000000011011011000000000000000000000000000000000000000000000000";
       		 if (button_x_left = '1') then
			new_state <= playermiddle;
		 else
			new_state <= playerright;
           	 end if;
      end case;





--case input is
	--when "000" => 
        --map_data <= "011011010011011100000001011011000000000000011011000101000011011000011011";
	--when "001" => 
       -- map_data <= "011011011011011011010011011011011100001011011000000000000000000101000000";
	--when others => 
        --map_data <= "011011011011011011010011011011011100001011011000000000000000000111000000";
--end case;



end process;
end architecture;




