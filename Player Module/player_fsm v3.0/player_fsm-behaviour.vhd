library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of player_fsm is

	type player_fsm_state is (	mine_state,right_state,left_state,down_state,
								up_state, reset_state, central_state,
								mine_up_state, mine_down_state, mine_right_state, 
								mine_left_state, lvl_up_state, game_over_state, start_state, animate_state);
				
	signal x_pos, y_pos, x_pos_next, y_pos_next	: unsigned(3 downto 0);
	signal energy, energy_next					: unsigned(8 downto 0);
	signal score, score_next					: unsigned(9 downto 0);
	
	signal edge_detec3, edge_detec2, edge_detec1, edge_detec0	: std_logic_vector(3 downto 0);
	signal rise_left, rise_right, rise_up, rise_down, input		: std_logic;
	
	signal level, level_next 	: unsigned(4 downto 0);
	signal state, new_state		:	player_fsm_state;

	signal score_add		: unsigned(1 downto 0);
	signal energy_remove	: unsigned(1 downto 0);
	

	signal new_score_d		: unsigned(15 downto 0);
	signal score_d			: unsigned(15 downto 0);
	signal new_energy_d		: unsigned(11 downto 0);
	signal energy_d			: unsigned(11 downto 0);
	signal new_level_d		: unsigned(7 downto 0);
	signal level_d			: unsigned(7 downto 0);
	
	signal reached_high, reached_high_next	: unsigned(1 downto 0);
	
	constant mine_cost 	: unsigned(1 downto 0) := "11";

begin
	
	-- detecting a rising edge of a directional button press
	rise_left  <= (not edge_detec3(0)) and edge_detec2(0) and edge_detec1(0) and edge_detec0(0);
	rise_right <= (not edge_detec3(1)) and edge_detec2(1) and edge_detec1(1) and edge_detec0(1);
	rise_up    <= (not edge_detec3(2)) and edge_detec2(2) and edge_detec1(2) and edge_detec0(2);
	rise_down  <= (not edge_detec3(3)) and edge_detec2(3) and edge_detec1(3) and edge_detec0(3);

	-- determine of a button has been pressed
	input <= button_x_left or button_x_right or button_y_up or button_y_down or button_mining;

	-- setting outputs to internal signals
	y_pos_out <= std_logic_vector(y_pos);
	x_pos_out <= std_logic_vector(x_pos);
	level_out <= std_logic_vector(level);

	-- clocked process
	process(clk, reset)
	begin
		if (clk = '1' and clk'event) then
			if (reset = '1') then
				state <= reset_state;
				edge_detec3 <= "0000";
				edge_detec2 <= "0000";
				edge_detec1 <= "0000";
				edge_detec0 <= "0000";

				energy_d_out <= "000100000000";--100
				score_d_out <= (others => '0');
				level_d_out <= (others => '0');

				energy_d <= "000100000000";
				score_d <= (others => '0');
				level_d <= (others => '0');
				
				score <= (others => '0');
				energy <= "001100100";	
				level <= "00001";
				
				x_pos <= "0100";			-- the spawn location for the player is (8,3)
				y_pos <= "0011";
				
				reached_high <= (others => '0');
			else
				state <= new_state;
				
				edge_detec0(0) <= button_x_left;
				edge_detec0(1) <= button_x_right;
				edge_detec0(2) <= button_y_up;
				edge_detec0(3) <= button_y_down;

				edge_detec1 <= edge_detec0;
				edge_detec2 <= edge_detec1;
				edge_detec3 <= edge_detec2;

				energy_d_out <= std_logic_vector(new_energy_d);
				score_d_out <= std_logic_vector(new_score_d);
				level_d_out <= std_logic_vector(new_level_d);

				energy_d <= new_energy_d;
				score_d <= new_score_d;
				level_d <= new_level_d;

				score <= score_next;
				energy <= energy_next;
				level <= level_next;
				x_pos <= x_pos_next;
				y_pos <= y_pos_next;
				
				reached_high <= reached_high_next;
				
			end if;
			
		end if;
	end process;

	

	
	-- combinatiorial process with all the states
	process (	state, reset, button_x_left, button_x_right, button_y_up,
				button_y_down, button_mining, map_data_l, map_data_r, map_data_d, 
				map_data_u, rise_left, rise_right,rise_up,rise_down,score_add,
				score_d, level_d, energy_d, energy_remove, x_pos, y_pos,
				score, energy, level, reached_high, vga_done, input, animation_done)
    begin
	if (state = lvl_up_state) then
			new_score_d <= score_d;	
			
			if(reached_high = "01") then
				new_energy_d <= "000100100101";
			elsif(reached_high = "10") then
				new_energy_d <= "000101010000";
			elsif(reached_high = "11") then
				new_energy_d <= "000101110101";
			else
				new_energy_d <= "000100000000";
			end if;
			
		
			if (level_d(3 downto 0) + 1 < 10) then
				new_level_d(3 downto 0) <= level_d(3 downto 0) + 1;
				new_level_d (7 downto 4) <= level_d(7 downto 4);
			else
				new_level_d(3 downto 0) <= (others => '0');
				if (level_d(7 downto 4) + 1 < 10) then
					new_level_d(7 downto 4) <= level_d(7 downto 4) + 1;
				else
					new_level_d(7 downto 4) <= (others => '0');
				end if;
			end if;
			
	elsif (state = reset_state) then
			new_score_d <= (others => '0');
			new_level_d <= "00000001";
			new_energy_d <= "000100000000";
			
	elsif (state = start_state) then
			new_score_d <= (others => '0');
			new_level_d <= "00000001";
			new_energy_d <= energy_d;
			
	elsif (state = game_over_state) then
			
			new_score_d <= (others => '0');
			new_level_d <= (others => '0');
			if(level > 4 and level <= 9 and reached_high = 0) then
				new_energy_d <= "000100100101";
			elsif(level > 9 and level <= 14 and reached_high <= 1) then
				new_energy_d <= "000101010000";
			elsif(level > 14 and reached_high <= 2) then
				new_energy_d <= "000101110101";
			else
				new_energy_d <= "000100000000";
			end if;
		
	else
		new_level_d <= level_d;
		if (score_d(3 downto 0) + score_add < 10) then
			new_score_d(3 downto 0) <= score_d(3 downto 0) + score_add;
			new_score_d(7 downto 4) <= score_d(7 downto 4);
			new_score_d(11 downto 8) <= score_d(11 downto 8);
			new_score_d(15 downto 12) <= score_d(15 downto 12);
		else
			new_score_d(3 downto 0) <= (others => '0');
			if (score_d(7 downto 4) + 1 < 10) then
				new_score_d(7 downto 4) <= score_d(7 downto 4) + 1;

				new_score_d(11 downto 8) <= score_d(11 downto 8);
				new_score_d(15 downto 12) <= score_d(15 downto 12);
			else
				new_score_d(7 downto 4) <= (others => '0');
				if (score_d(11 downto 8) + 1 < 10) then
					new_score_d(11 downto 8) <= score_d(11 downto 8) + 1;

					new_score_d(15 downto 12) <= score_d(15 downto 12);
				else
					new_score_d(11 downto 8) <= (others => '0');
					if (score_d(15 downto 12) + 1 < 10) then
						new_score_d(15 downto 12) <= score_d(15 downto 12) + 1;
					else
						new_score_d(15 downto 12) <= (others => '0');
					end if;
				end if;
			end if;
		end if;

		
		if (energy_d(3 downto 0) - energy_remove > 10) then
			new_energy_d(3 downto 0) <= 9 - (15  - (energy_d(3 downto 0) - energy_remove));
			if (energy_d(7 downto 4) - 1 > 10) then
				new_energy_d(7 downto 4) <= 9 - (15  - (energy_d(3 downto 0) - 1));
				if (energy_d(11 downto 8) - 1 > 10) then
					new_energy_d(11 downto 8) <= 9 - (15  - (energy_d(3 downto 0) - 1));
				else
					new_energy_d(11 downto 8) <= energy_d(11 downto 8) -  1;
				end if;
			else
				new_energy_d(7 downto 4) <= energy_d(7 downto 4) -  1;
				new_energy_d (11 downto 8) <= energy_d(11 downto 8);
			end if;
		else
			new_energy_d(3 downto 0) <= energy_d(3 downto 0) -  energy_remove;
			new_energy_d (7 downto 4) <= energy_d(7 downto 4);
			new_energy_d (11 downto 8) <= energy_d(11 downto 8);
		end if;
	end if;

	-- *******
	-- * FSM *
	-- *******

   	case state is 
     	when reset_state => 	-- we go to the reset state when we start the chip and when there is a game over
			dir_mined <= "000";				-- the first bit detirmines if a mining action took place, the last two bits determine the direction
			x_pos_next <= "0100";			-- the spawn location for the player is (8,3)
			y_pos_next <= "0011";
			score_next <= (others => '0');		-- reset score to 0
			energy_next <= "001100100";		-- reset energy to 100
 			level_next <= "00001"; --game over back to level 1

			new_state <= start_state;

			score_add <=  (others => '0');
			energy_remove <= (others => '0');
			moved <= '0';
			game_state <= "00";
			reached_high_next <= "00";

		when start_state =>
			dir_mined <= "000";
			x_pos_next <= "0100";			-- the spawn location for the player is (8,3)
			y_pos_next <= "0011";
			score_next <= (others => '0');		-- reset score to 0
			energy_next <= energy;
 			level_next <= "00001"; --game over back to level 0

			-- keep start screen untill a button is pressed.
			if (input = '1') then
				new_state <= animate_state;
			else
				new_state <= start_state;
			end if;
			

			score_add <=  (others => '0');
			energy_remove <= (others => '0');
			moved <= '0';
			game_state <= "00";
			reached_high_next <= reached_high;

		when animate_state =>
			dir_mined <= "000";
			x_pos_next <= x_pos;
			y_pos_next <= y_pos;
			score_next <= (others => '0');
			energy_next <= energy;
 			level_next <= level;

			-- keep start screen untill a button is pressed.
			if (animation_done = '1') then
				new_state <= central_state;
			else
				new_state <= animate_state;
			end if;
			

			score_add <=  (others => '0');
			energy_remove <= (others => '0');
			moved <= '0';
			game_state <= "11"; -- game state 11 is used for the start animation.
			reached_high_next <= "00";

		when central_state => --central state where we read the inputs of the player

			-- define all outputs

			score_add <= "00";
			energy_remove <= "00";
			game_state <= "01";
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			dir_mined <= "000";
			score_next <= score;
			energy_next <= energy;
			level_next <= level;
			moved <= '0';
			reached_high_next <= reached_high;
			-- check energy for game over and go to different states depending on input, 
			-- also don't enter mine state if energy is less than the energy it costs to mine
			if(energy = "000000000") then
				new_state <= game_over_state;
			elsif(button_mining = '1' and energy >= mine_cost) then
				new_state <= mine_state;
			elsif(rise_left = '1') then
				new_state <= left_state;
			elsif(rise_right = '1') then
				new_state <= right_state;
			elsif(rise_up = '1') then
				new_state <= up_state;
			elsif(rise_down = '1') then
				new_state <= down_state;
			else
				new_state <= central_state;
			end if;

		
		when mine_state => --the mine button is pressed, now we read the input direction

			-- define all outputs
			score_add <= "00";
			energy_remove <= "00";
			game_state <= "01";
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			dir_mined <= "000";
			score_next <= score;
			energy_next <= energy;
			level_next <= level;
			moved <= '0';
			reached_high_next <= reached_high;
			-- check in which direction the player is mining
			if (vga_done = '1') then
				if(button_mining = '1' and button_x_left = '1') then
					new_state <= mine_left_state;
				elsif(button_mining = '1' and button_x_right = '1') then
					new_state <= mine_right_state;
				elsif(button_mining = '1' and button_y_up = '1') then
					new_state <= mine_up_state;
				elsif(button_mining = '1' and button_y_down = '1') then
					new_state <= mine_down_state;
				else
					new_state <= central_state;
				end if;
			else
				new_state <= mine_state;
			end if;
		
		when mine_left_state => --player mining to the left

			-- define all outputs

			game_state <= "01";
			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			level_next <= level;
			moved <= '0';
			reached_high_next <= reached_high;
			-- depending on what tile is to the left of the player do the following:
			-- send the left mined command (dir_mined <= "100") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score
			if(map_data_l = "001") then -- mine rock
				dir_mined <= "100"; --left mined (00)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "00";
				score_next <= score; 
			elsif(map_data_l = "010") then -- mine gold
				dir_mined <= "100"; --left mined (00)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "01";
				score_next <= score + 1;
			elsif(map_data_l = "100") then -- mine dimond
				dir_mined <= "100"; --left mined (00)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "10";
				score_next <= score + 2;
			elsif(map_data_l = "111") then -- mine rock with ladder
				dir_mined <= "100"; --left mined (00)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "00";
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_next <= energy;
				energy_remove <= "00";
				score_add <= "00";
				score_next <= score;	
			end if;
			
		
		when mine_right_state => --player mining to the right

			-- define all outputs

			game_state <= "01";

			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			level_next <= level;
			moved <= '0';
			reached_high_next <= reached_high;
			-- depending on what tile is to the right of the player do the following:
			-- send the right mined command (dir_mined <= "101") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score 
			if(map_data_r = "001") then --  mine rock
				dir_mined <= "101"; --right mined (01)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "00";
				score_next <= score;
			elsif(map_data_r = "010") then -- mine gold
				dir_mined <= "101"; --right mined (01)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "01";
				score_next <= score + 1;
			elsif(map_data_r = "100") then -- mine dimond
				dir_mined <= "101"; --right mined (01)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "10";
				score_next <= score + 2;
			elsif(map_data_r = "111") then -- mine rock with ladder
				dir_mined <= "101"; --right mined (01)
				energy_remove <= mine_cost;
				energy_next <= energy;
				score_add <= "00";
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_remove <= "00";
				energy_next <= energy;
				score_add <= "00";
				score_next <= score;		
			end if;
			
		
		when mine_up_state => --player mining up 

			-- define all outputs

			game_state <= "01";

			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			level_next <= level;
			moved <= '0';
			reached_high_next <= reached_high;
			-- depending on what tile is above the player do the following:
			-- send the up mined command (dir_mined <= "110") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score
			if(map_data_u = "001") then -- mine rock
				dir_mined <= "110"; --up mined (10)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "00";
				score_next <= score;
			elsif(map_data_u = "010") then -- mine gold
				dir_mined <= "110"; --up mined (10)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "01";
				score_next <= score + 1;
			elsif(map_data_u = "100") then -- mine dimond
				dir_mined <= "110"; --up mined (10)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "10";
				score_next <= score + 2;
			elsif(map_data_u = "111") then -- mine rock with ladder
				dir_mined <= "110"; --up mined (10)
				energy_remove <= mine_cost;
				energy_next <= energy;
				score_add <= "00";
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_next <= energy;
				energy_remove <= "00";
				score_add <= "00";
				score_next <= score;	
			end if;
			

		when mine_down_state => --player mining down

			-- define all outputs
			game_state <= "01";
			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			level_next <= level;
			moved <= '0';
			reached_high_next <= reached_high;
			-- depending on what tile is below the player do the following:
			-- send the down mined command (dir_mined <= "111") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score
			if(map_data_d = "001") then -- mine rock
				dir_mined <= "111"; --down mined (11)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "00";
				score_next <= score;
			elsif(map_data_d = "010") then -- mine gold
				dir_mined <= "111"; --down mined (11)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "01";
				score_next <= score + 1;
			elsif(map_data_d = "100") then -- mine dimond
				dir_mined <= "111"; --down mined (11)
				energy_next <= energy - mine_cost;
				energy_remove <= mine_cost;
				score_add <= "10";
				score_next <= score + 2;
			elsif(map_data_d = "111") then -- mine rock with ladder
				dir_mined <= "111"; --down mined (11)
				energy_remove <= mine_cost;
				energy_next <= energy;
				score_add <= "00";
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_remove <= "00";
				energy_next <= energy;
				score_add <= "00";
				score_next <= score;	
				
			end if;
			

		when left_state => --move to the left

			-- define all outputs
			game_state <= "01";
			
			score_add <=  (others => '0');

			dir_mined <= "000";
			y_pos_next <= y_pos;
			score_next <= score;
			level_next <= level;
			
			reached_high_next <= reached_high;
			
				-- if map data left is ground then change position and decrease energy by one
				-- if map data left is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_l = "000") then
					x_pos_next <= x_pos - 1;
					energy_next <= energy - 1;
					energy_remove <= "01";
					new_state <= central_state;
					moved <= '1';

				elsif(map_data_l = "101") then
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= lvl_up_state;
					x_pos_next <= x_pos;
					moved <= '1';
					
				else
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= central_state;
					x_pos_next <= x_pos;
					moved <= '0';
				end if;
			
		when right_state => --move to the right

			-- define all outputs
			game_state <= "01";
			
			score_add <=  (others => '0');

			dir_mined <= "000";
			y_pos_next <= y_pos;
			score_next <= score;
			level_next <= level;
			
			reached_high_next <= reached_high;

				-- if map data right is ground then change position and decrease energy by one
				-- if map data right is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_r = "000") then
					x_pos_next <= x_pos + 1;
					energy_next <= energy - 1;
					energy_remove <= "01";
					new_state <= central_state;
					moved <= '1';
				elsif(map_data_r = "101") then
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= lvl_up_state;
					x_pos_next <= x_pos;
					moved <= '1';

				else
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= central_state;
					x_pos_next <= x_pos;
					moved <= '0';
				end if;

		when up_state => --move up

			-- define all outputs
			game_state <= "01";
			score_add <=  (others => '0');
			
			dir_mined <= "000";
			x_pos_next <= x_pos;
			score_next <= score;
			level_next <= level;
			
			reached_high_next <= reached_high;
			
				-- if map data up is ground then change position and decrease energy by one
				-- if map data up is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_u = "000") then
					y_pos_next <= y_pos - 1;
					energy_next <= energy - 1;
					energy_remove <= "01";
					new_state <= central_state;
					moved <= '1';
				elsif(map_data_u = "101") then
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= lvl_up_state;
					y_pos_next <= x_pos;
					moved <= '1';

				else
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= central_state;
					y_pos_next <= x_pos;
					moved <= '0';
				end if;	

		when down_state => --move down

			--define all outputs
			game_state <= "01";
			score_add <=  (others => '0');
			
			dir_mined <= "000";
			x_pos_next <= x_pos;
			score_next <= score;
			level_next <= level;
			
			reached_high_next <= reached_high;

				-- if map data down is ground then change position and decrease energy by one
				-- if map data down is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_d = "000") then
					y_pos_next <= y_pos + 1;
					energy_next <= energy - 1;
					energy_remove <= "01";
					new_state <= central_state;
					moved <= '1';

				elsif(map_data_d = "101") then
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= lvl_up_state;
					y_pos_next <= x_pos;
					moved <= '1';

				else
					energy_next <= energy;
					energy_remove <= "00";
					new_state <= central_state;
					y_pos_next <= x_pos;
					moved <= '0';
				end if;

		when lvl_up_state => --level up by ladder, energy restored, score stays the same
			dir_mined <= "000";
			x_pos_next <= "0100";
			y_pos_next <= "0011";
			new_state <= central_state;
			game_state <= "01";
			score_add <=  (others => '0');
			energy_remove <= "00";
			
			
			if(reached_high = "01") then
				
				energy_next <= "001111101";	-- 125
			elsif(reached_high = "10") then
				
				energy_next <= "010010110"; -- 150
			elsif(reached_high = "11") then
				
				energy_next <= "010101111"; -- 175
			else
				
				energy_next <= "001100100";	-- 100
			end if;
			score_next <= score;
			level_next <= level + 1;
			moved <= '0';
			reached_high_next <= reached_high;

		when game_over_state =>
			dir_mined <= "000";				-- the first bit detirmines if a mining action took place, the last two bits determine the direction
			x_pos_next <= "0100";			-- the spawn location for the player is (8,3)
			y_pos_next <= "0011";
			game_state <= "10";
			score_next <= (others => '0');		-- reset score to 0
			
			level_next <= "00000"; --game over back to level 0
			
			if(level > 4 and level <= 9 and reached_high = 0) then
				energy_next <= "001111101";	-- 125
				reached_high_next <= "01";
			elsif(level > 9 and level <= 14 and reached_high <= 1) then
				energy_next <= "010010110"; -- 150
				reached_high_next <= "10";	
			elsif(level > 14 and reached_high <= 2) then
				energy_next <= "010101111"; -- 175
				reached_high_next <= "11";
			else
				energy_next <= "001100100";	-- 100
				reached_high_next <= reached_high;
			end if;
			
			if (animation_done = '1' and input = '1') then
				new_state <= start_state;
			else
				new_state <= game_over_state;
			end if;
			
			score_add <=  (others => '0');
			energy_remove <= (others => '0');
			moved <= '0';

		when others => -- in the event of an error don't change anything and go to the central state
			new_state <= central_state;
			dir_mined <= "000";
			y_pos_next <= y_pos;
			x_pos_next <= x_pos;
			score_add <=  (others => '0');
			energy_remove <= "00";
			energy_next <= energy;
			score_next <= score;
			level_next <= level;
			moved <= '0';
			game_state <= "01";
			reached_high_next <= reached_high;
	end case;
	end process;
end behaviour;
