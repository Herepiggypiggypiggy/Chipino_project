library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of module_test is
	
   type playermap_state is (playermiddle, playerleft, playerup, playerdown, playerright);
   signal state, new_state: playermap_state;

component player_fsm
<<<<<<< Updated upstream
<<<<<<< Updated upstream
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
=======
port( button_x_left  : IN  std_logic;
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
      energy_lvl_out : OUT std_logic_vector(8 downto 0);
	   score_out      : OUT std_logic_vector(9 downto 0);
	   level_out      : OUT std_logic_vector(4 downto 0);
	   level_d_out    : OUT std_logic_vector(7 downto 0);
	   score_d_out    : OUT std_logic_vector(15 downto 0);
	   energy_d_out   : OUT std_logic_vector(11 downto 0);
      y_pos_out      : OUT std_logic_vector(3 downto 0);
      x_pos_out      : OUT std_logic_vector(3 downto 0);
	   moved	         : OUT std_logic;
	   game_state     : OUT std_logic_vector(1 downto 0));
end component;

component vga
port( clk 			   : in std_logic;
		reset 			: in std_logic;
		map_data		   : in std_logic_vector(71 downto 0);
		Xplayer			: in std_logic_vector(3 downto 0);
		Yplayer			: in std_logic_vector(3 downto 0);
		score 			: in std_logic_vector(15 downto 0);
		energy			: in std_logic_vector(11 downto 0);
		level 			: in std_logic_vector(7 downto 0);
		score_abs 		: in std_logic_vector(15 downto 0);
		energy_abs		: in std_logic_vector(11 downto 0);
		level_abs 		: in std_logic_vector(7 downto 0);
		game_state     : in std_logic_vector(1 downto 0);
	
		timer1_out		: out std_logic_vector(5 downto 0);
		timer2_out		: out std_logic_vector(5 downto 0);
		hsync			   : out std_logic;
		vsync			   : out std_logic;
		red				: out std_logic_vector(3 downto 0);
		green			   : out std_logic_vector(3 downto 0);
		blue			   : out std_logic_vector(3 downto 0);
		vga_done_out	: out std_logic;
		animation_done : out std_logic);
>>>>>>> Stashed changes
=======
port (
	clk            	: in  	std_logic;
	reset          	: in  	std_logic;
	
	button_x_left  	: in  	std_logic;
    button_x_right 	: in  	std_logic;
    button_y_up    	: in  	std_logic;
    button_y_down  	: in  	std_logic;
    button_mining  	: in  	std_logic;
    
    animation_done 	: in 	std_logic;
    
    map_data_l     	: in  	std_logic_vector(2 downto 0);
    map_data_r     	: in  	std_logic_vector(2 downto 0);
    map_data_u     	: in  	std_logic_vector(2 downto 0);
    map_data_d     	: in  	std_logic_vector(2 downto 0);
    
    moved			: out 	std_logic;
    
    game_state 		: out 	std_logic_vector(1 downto 0);
    dir_mined      	: out 	std_logic_vector(2 downto 0);
    
    x_pos_out    	: out 	std_logic_vector(3 downto 0);
    y_pos_out    	: out 	std_logic_vector(3 downto 0);
    
    level_out    	: out 	std_logic_vector(4 downto 0);
	level_d_out    	: out 	std_logic_vector(7 downto 0);
	
	energy_out  	: out 	std_logic_vector(8 downto 0);
	energy_d_out   	: out 	std_logic_vector(11 downto 0);
	
	score_out    	: out 	std_logic_vector(9 downto 0);
	score_d_out    	: out 	std_logic_vector(15 downto 0)
);
end component;

component VGA
port (	
	clk 			: in    std_logic;
	reset 			: in    std_logic;
	
	game_state  	: in    std_logic_vector(1 downto 0);
	
    xplayer			: in    std_logic_vector(3 downto 0);
    yplayer			: in    std_logic_vector(3 downto 0);
    
    level 			: in    std_logic_vector(7 downto 0);
    energy			: in    std_logic_vector(11 downto 0);
    score 			: in    std_logic_vector(15 downto 0);
    
    map_data		: in    std_logic_vector(71 downto 0);
    
    hsync			: out   std_logic;
    vsync			: out   std_logic;
    
    vga_done		: out   std_logic;
    animation_done 	: out 	std_logic;
    
    red		   	 	: out   std_logic_vector(3 downto 0);
    green			: out   std_logic_vector(3 downto 0);
    blue			: out   std_logic_vector(3 downto 0);
    
    timer1_out		: out   unsigned(5 downto 0);
    timer2_out		: out   unsigned(5 downto 0)
    
);
end component;

component not_arduino
port (
	clk		: in 	std_logic;
	reset	: in 	std_logic;
	MOSI	: in 	std_logic;
	SCLK	: in 	std_logic;
	SS		: in 	std_logic;
	
	MISO	: out	std_logic
);
end component;

component SPI
port (
	clk					:	in 	std_logic;
	reset				: 	in 	std_logic;
	send				: 	in 	std_logic;
	MISO				:	in 	std_logic;
	MOSI_data			:	in 	std_logic_vector(15 downto 0);
	
	map_data_volatile	:	out std_logic_vector(71 downto 0);
	SCLK				: 	out	std_logic;
	SS					:	out std_logic;
	MOSI				:	out std_logic	
);
end component;

component stable_map
port (
	clk					: 	in	std_logic;
	reset				:	in 	std_logic;
	map_updated			:	in	std_logic;
	vga_done		:	in	std_logic;
	dir_mined			:	in	std_logic_vector(2 downto 0);
	map_data_volatile	:	in 	std_logic_vector(71 downto 0);
	
	map_data			:	out	std_logic_vector(71 downto 0)
);
>>>>>>> Stashed changes
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

signal  moved	        : std_logic;

signal	xplayer			: std_logic_vector(3 downto 0);
signal	yplayer			: std_logic_vector(3 downto 0);

signal  map_data		: std_logic_vector(71 downto 0);

signal  x_pos_out       : std_logic_vector(3 downto 0);
signal  y_pos_out       : std_logic_vector(3 downto 0);

signal	level 	    	: std_logic_vector(7 downto 0);
signal	energy			: std_logic_vector(11 downto 0);
signal	score 			: std_logic_vector(15 downto 0);

signal  level_out       : std_logic_vector(4 downto 0);
signal  energy_out  	: std_logic_vector(8 downto 0);
signal  score_out       : std_logic_vector(9 downto 0);

signal  level_d_out     : std_logic_vector(7 downto 0);
signal  energy_d_out    : std_logic_vector(11 downto 0);
signal  score_d_out     : std_logic_vector(15 downto 0);

signal  game_state  	: std_logic_vector(1 downto 0);

signal  timer1			: unsigned(5 downto 0);
signal	timer2			: unsigned(5 downto 0);

signal animation_done 	: std_logic;
signal vga_done 	: std_logic;


begin
level 	<=  std_logic_vector(level_d_out);
energy 	<=  std_logic_vector(energy_d_out);
score 	<=  std_logic_vector(score_d_out);

xplayer <=  std_logic_vector(x_pos_out);
yplayer <=  std_logic_vector(y_pos_out);

fsm_com: player_fsm
port map (   
	clk,	
	reset,
	
	button_x_left,
	button_x_right,
	button_y_up,
	button_y_down,
	button_mining,
	
	animation_done,
	
	map_data_l,
	map_data_r,
	map_data_u,
	map_data_d,
	
	moved,
	
	game_state,
	dir_mined,
	
	x_pos_out,
	y_pos_out,
	
	level_out,
	level_d_out,
	
	energy_out,
	energy_d_out,
	
	score_out,
	score_d_out,
);

vga_com: VGA 
port map (   
	clk,
	reset,
	
	game_state,
	
	xplayer,
	yplayer,
	
	level,
	energy,
	score,
	
	map_data,
	
	hsync,
	vsync,
	
	vga_done,
	animation_done,
	
	red,
	green,
	blue,
	
	timer1_out,
	timer2_out
);  
   
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

      
process(clk,reset, bleft, bright, up, down, mining, map_data, state, button_x_left, button_y_up, button_y_down, button_x_right)
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




