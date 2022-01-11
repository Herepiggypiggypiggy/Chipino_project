library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.all;

architecture behaviour of module_test is
	
   type playermap_state is (playermiddle, playerleft, playerup, playerdown, playerright);
   signal state, new_state: playermap_state;

component player_fsm
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
			vga_done   	   : IN  std_logic;
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
end component;

component vga
	port (	clk 			: in std_logic;
			reset 			: in std_logic;
			game_state      : in std_logic_vector(1 downto 0);
			xplayer			: in std_logic_vector(3 downto 0);
			yplayer			: in std_logic_vector(3 downto 0);
			level 			: in std_logic_vector(7 downto 0);
			energy			: in std_logic_vector(11 downto 0);
			score 			: in std_logic_vector(15 downto 0);
			level_abs 		: in std_logic_vector(4 downto 0);
			map_data		: in std_logic_vector(71 downto 0);
			
			hsync			: out std_logic;
			vsync			: out std_logic;
			vga_done		: out std_logic;
			animation_done 	: out std_logic;
			red				: out std_logic_vector(3 downto 0);
			green			: out std_logic_vector(3 downto 0);
			blue			: out std_logic_vector(3 downto 0));
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

component spi_v3
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
port (	clk					: 	in	std_logic;
		reset				:	in 	std_logic;
		map_updated			:	in	std_logic;
		vga_done			:	in	std_logic;
		dir_mined			:	in	std_logic_vector(2 downto 0);
		map_data_volatile	:	in 	std_logic_vector(71 downto 0);
		
		map_data			:	out	std_logic_vector(71 downto 0));
end component;

signal  button_x_left   	: std_logic;
signal  button_x_right  	: std_logic;
signal  button_y_up     	: std_logic;
signal  button_y_down   	: std_logic;
signal  button_mining_int  	: std_logic;
signal  map_data_l      	: std_logic_vector(2 downto 0);
signal  map_data_r      	: std_logic_vector(2 downto 0);
signal  map_data_u      	: std_logic_vector(2 downto 0);
signal  map_data_d      	: std_logic_vector(2 downto 0);
signal  dir_mined       	: std_logic_vector(2 downto 0);
signal  moved	        	: std_logic;
signal	xplayer				: std_logic_vector(3 downto 0);
signal	yplayer				: std_logic_vector(3 downto 0);

signal  map_data			: std_logic_vector(71 downto 0);
signal 	map_data_volatile	: std_logic_vector(71 downto 0);
signal	level_d	 	    	: std_logic_vector(7 downto 0);
signal	energy_d			: std_logic_vector(11 downto 0);
signal	score_d 			: std_logic_vector(15 downto 0);
signal  level_abs	      	: std_logic_vector(4 downto 0);
signal  game_state  		: std_logic_vector(1 downto 0);
signal 	animation_done 		: std_logic;
signal 	vga_done 			: std_logic;
signal 	map_updated			: std_logic;

signal 	MOSI				: std_logic;
signal 	MISO				: std_logic;
signal 	SCLK				: std_logic;
signal 	SS					: std_logic;

signal 	send				: std_logic;
signal 	MOSI_data			: std_logic_vector(15 downto 0);


begin

fsm_com: player_fsm
port map (	clk,	
			reset,
			button_x_left,
			button_x_right,
			button_y_up,
			button_y_down,
			button_mining_int,
			map_data_l,
			map_data_r,
			map_data_u,
			map_data_d,
			vga_done,
			animation_done,

			dir_mined,
			level_abs,
			energy_d,
			score_d,
			level_d,
			yplayer,
			xplayer,
			moved,
			game_state);

vga_com: vga 
port map (  clk,
			reset,
			game_state,
			xplayer,
			yplayer,
			level_d,
			energy_d,
			score_d,
			level_abs,
			map_data,
			
			hsync,
			vsync,
			vga_done,
			animation_done,
			red,
			green,
			blue);  

not_arduino_com : not_arduino
port map (
	clk,
	reset,
	
	MOSI,
	SCLK,
	SS,
	
	MISO
);

spi_com	: spi_v3
port map (
	clk,
	reset,
	
	send,
	
	MISO,
	MOSI_data,
	
	map_data_volatile,
	
	SCLK,
	SS,
	MOSI
);

stable_map_com : stable_map
port map (
	clk,
	reset,
	
	map_updated,
	vga_done,
	
	dir_mined,
	
	map_data_volatile,
	map_data
);

process (clk, reset, button_left, button_right, button_up, button_down, button_mining, map_data)
begin
	
	if(button_left  = '1')  then  button_x_left     <= '1'; else button_x_left  <= '0'; end if;
	if(button_right = '1')  then  button_x_right    <= '1'; else button_x_right <= '0'; end if;
	if(button_up     = '1')  then  button_y_up       <= '1'; else button_y_up    <= '0'; end if;
	if(button_down   = '1')  then  button_y_down     <= '1'; else button_y_down  <= '0'; end if;
	if(button_mining = '1')  then  button_mining_int     <= '1'; else button_mining_int  <= '0'; end if;

	map_data_l <= map_data(53 downto 51);
	map_data_r <= map_data(20 downto 18);
	map_data_u <= map_data(35 downto 33);
	map_data_d <= map_data(38 downto 36);
	
end process;
   
--process (clk)
--   begin
--      if (clk'event and clk = '1') then
--         if reset = '1' then
--            state <= playermiddle;
--         else
--            state <= new_state;
--         end if;
--      end if;
--   end process;
--
--      
--process(clk,reset, bleft, bright, up, down, mining, map_data, state, button_x_left, button_y_up, button_y_down, button_x_right)
--begin
--
--if(bleft  = '1')  then  button_x_left     <= '1'; else button_x_left  <= '0'; end if;
--if(bright = '1')  then  button_x_right    <= '1'; else button_x_right <= '0'; end if;
--if(up     = '1')  then  button_y_up       <= '1'; else button_y_up    <= '0'; end if;
--if(down   = '1')  then  button_y_down     <= '1'; else button_y_down  <= '0'; end if;
--if(mining = '1')  then  button_mining     <= '1'; else button_mining  <= '0'; end if;
--
--map_data_l <= map_data(53 downto 51);
--map_data_r <= map_data(20 downto 18);
--map_data_u <= map_data(35 downto 33);
--map_data_d <= map_data(38 downto 36);
--
--
--  case state is
--         when playermiddle =>
--			map_data 	<= "000000000000000000011000000000000011011000000000000011000000000000000000";
--       		 if (button_x_left = '1') then
--			new_state <= playerleft;
--      		 elsif (button_y_up = '1') then
--			new_state <= playerup;
--      		 elsif (button_y_down = '1') then
--			new_state <= playerdown;
--      		 elsif (button_x_right = '1') then
--			new_state <= playerright;
--		 else
--			new_state <= playermiddle;
--           	 end if;
--
--         when playerleft =>
--			map_data 	<= "000000000000000000000000000000000000000000000000011011011000000011000000";
--       		 if (button_x_right = '1') then
--			new_state <= playermiddle;
--		 else
--			new_state <= playerleft;
--           	 end if;
--
--         when playerup =>
--			map_data 	<= "000000000000000000000011000000000000011011000000000000011000000000000000";
--       		 if (button_y_down = '1') then
--			new_state <= playermiddle;
--		 else
--			new_state <= playerup;
--           	 end if;
--
--         when playerdown =>
--			map_data 	<= "000000000000000011000000000000011011000000000000011000000000000000000000";
--       		 if (button_y_up = '1') then
--			new_state <= playermiddle;
--		 else
--			new_state <= playerdown;
--           	 end if;
--
--         when playerright =>
--			map_data 	<= "000000011000000011011011000000000000000000000000000000000000000000000000";
--       		 if (button_x_left = '1') then
--			new_state <= playermiddle;
--		 else
--			new_state <= playerright;
--           	 end if;
--      end case;





--case input is
	--when "000" => 
        --map_data <= "011011010011011100000001011011000000000000011011000101000011011000011011";
	--when "001" => 
       -- map_data <= "011011011011011011010011011011011100001011011000000000000000000101000000";
	--when others => 
        --map_data <= "011011011011011011010011011011011100001011011000000000000000000111000000";
--end case;



--end process;
end architecture;




