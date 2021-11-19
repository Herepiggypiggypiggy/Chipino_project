library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of player_fsm is

type player_fsm_state is (	mine_state,right_state,left_state,down_state,
				up_state, reset_state, central_state,
				mine_up_state, mine_down_state, mine_right_state					, mine_left_state, lvl_up_state);
	signal x_pos, y_pos, x_pos_next, y_pos_next: std_logic_vector(3 downto 0);
	signal energy, energy_next: std_logic_vector(7 downto 0);
	signal score, score_next: std_logic_vector(9 downto 0);
	signal edge_detec1, edge_detec0: std_logic_vector(3 downto 0);
	signal rise_left, rise_right, rise_up, rise_down: std_logic;

	signal state, new_state:	player_fsm_state;

	constant mine_cost : std_logic_vector(1 downto 0) := "11";

begin
	
	-- detecting a rising edge of a directional button press
	rise_left <= not edge_detec1(0) and edge_detec0(0);
	rise_right <= not edge_detec1(1) and edge_detec0(1);
	rise_up <= not edge_detec1(2) and edge_detec0(2);
	rise_down <= not edge_detec1(3) and edge_detec0(3);

	-- setting outputs to internal signals
	y_pos_out <= y_pos;
	x_pos_out <= x_pos;
	energy_lvl_out <= energy;
	score_out <= score;

	-- clocked process
	process(clk, reset)
	begin
		if (clk = '1' and clk'event) then
			if (reset = '1') then
				state <= reset_state;
				edge_detec1 <= "0000";
				edge_detec0 <= "0000";
			else
				state <= new_state;
				
				edge_detec0(0) <= button_x_left;
				edge_detec0(1) <= button_x_right;
				edge_detec0(2) <= button_y_up;
				edge_detec0(3) <= button_y_down;

				edge_detec1 <= edge_detec0;
				
			end if;
			
			energy <= energy_next;
			score <= score_next;
			x_pos <= x_pos_next;
			y_pos <= y_pos_next;
		end if;
		
	end process;

	-- combinatiorial process with all the states
	process (state, reset, button_x_left, button_x_right, button_y_up,
	button_y_down, button_mining, map_data_l, map_data_r, map_data_d, 
		map_data_u)
    	begin
        	case state is 
            		when reset_state => 	-- we go to the reset state when we start the chip and when there is a game over
			dir_mined <= "000";				-- the first bit detirmines if a mining action took place, the last two bits determine the direction
			x_pos_next <= "0100";			-- the spawn location for the player is (8,3)
			y_pos_next <= "0011";
			new_state <= central_state;
			score_next <= "0000000000";		-- reset score to 0
			energy_next <= "11001000";		-- reset energy to 200
		
		when central_state => --central state where we read the inputs of the player

			-- define all outputs
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			dir_mined <= "000";
			score_next <= score;
			energy_next <= energy;

			-- check energy for game over and go to different states depending on input, 
			-- also don't enter mine state if energy is less than the energy it costs to mine
			if(energy = "00000000") then
				new_state <= reset_state;
			elsif(button_mining = '1' and unsigned(energy) >= unsigned(mine_cost)) then
				new_state <= mine_state;
			elsif(rise_left = '1') then
				new_state <= left_state;
			elsif(rise_right = '1') then
				new_state <= right_state;
			elsif(rise_up = '1') then
				new_state <= up_state;
			elsif(rise_down = '1') then
				new_state <= down_state;
			end if;

		
		when mine_state => --the mine button is pressed, now we read the input direction

			-- define all outputs
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;
			dir_mined <= "000";
			score_next <= score;
			energy_next <= energy;

			-- check in which direction the player is mining
			if(button_mining = '1' and button_x_left = '1') then
				new_state <= mine_left_state;
			elsif(button_mining = '1' and button_x_right = '1') then
				new_state <= mine_right_state;
			elsif(button_mining = '1' and button_y_up = '1') then
				new_state <= mine_up_state;
			elsif(button_mining = '1' and button_y_down = '1') then
				new_state <= mine_down_state;
			end if;
		
		when mine_left_state => --player mining to the left

			-- define all outputs
			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;

			-- depending on what tile is to the left of the player do the following:
			-- send the left mined command (dir_mined <= "100") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score
			if(map_data_l = "001") then -- mine rock
				dir_mined <= "100"; --left mined (00)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			elsif(map_data_l = "010") then -- mine gold
				dir_mined <= "100"; --left mined (00)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+1);
			elsif(map_data_l = "100") then -- mine dimond
				dir_mined <= "100"; --left mined (00)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+2);
			elsif(map_data_l = "111") then -- mine rock with ladder
				dir_mined <= "100"; --left mined (00)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_next <= energy;
				score_next <= score;	
				
			end if;
			
		
		when mine_right_state => --player mining to the right

			-- define all outputs
			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;

			-- depending on what tile is to the right of the player do the following:
			-- send the right mined command (dir_mined <= "101") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score 
			if(map_data_r = "001") then --  mine rock
				dir_mined <= "101"; --right mined (01)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			elsif(map_data_r = "010") then -- mine gold
				dir_mined <= "101"; --right mined (01)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+1);
			elsif(map_data_r = "100") then -- mine dimond
				dir_mined <= "101"; --right mined (01)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+2);
			elsif(map_data_r = "111") then -- mine rock with ladder
				dir_mined <= "101"; --right mined (01)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_next <= energy;
				score_next <= score;	
				
			end if;
			
		
		when mine_up_state => --player mining up 

			-- define all outputs
			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;

			-- depending on what tile is above the player do the following:
			-- send the up mined command (dir_mined <= "110") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score
			if(map_data_u = "001") then -- mine rock
				dir_mined <= "110"; --up mined (10)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			elsif(map_data_u = "010") then -- mine gold
				dir_mined <= "110"; --up mined (10)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+1);
			elsif(map_data_u = "100") then -- mine dimond
				dir_mined <= "110"; --up mined (10)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+2);
			elsif(map_data_u = "111") then -- mine rock with ladder
				dir_mined <= "110"; --up mined (10)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_next <= energy;
				score_next <= score;	
				
			end if;
			

		when mine_down_state => --player mining down

			-- define all outputs
			new_state <= central_state;
			x_pos_next <= x_pos; 
			y_pos_next <= y_pos;

			-- depending on what tile is below the player do the following:
			-- send the down mined command (dir_mined <= "111") or don't mine (dir_mined <= "000")
			-- decrease energy by mine_cost (3) or keep energy constant
			-- increse score by one, increase score by two or don't increase score
			if(map_data_d = "001") then -- mine rock
				dir_mined <= "111"; --down mined (11)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			elsif(map_data_d = "010") then -- mine gold
				dir_mined <= "111"; --down mined (11)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+1);
			elsif(map_data_d = "100") then -- mine dimond
				dir_mined <= "111"; --down mined (11)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= std_logic_vector(unsigned(score)+2);
			elsif(map_data_d = "111") then -- mine rock with ladder
				dir_mined <= "111"; --down mined (11)
				energy_next <= std_logic_vector(unsigned(energy)-unsigned(mine_cost));
				score_next <= score;
			else -- don't mine
				dir_mined <= "000";
				energy_next <= energy;
				score_next <= score;	
				
			end if;
			

		when left_state => --move to the left

			-- define all outputs
			dir_mined <= "000";
			y_pos_next <= y_pos;
			score_next <= score;
			
				-- if map data left is ground then change position and decrease energy by one
				-- if map data left is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_l = "000") then
					x_pos_next <= std_logic_vector(unsigned(x_pos)-1);
					energy_next <= std_logic_vector(unsigned(energy)-1);
					new_state <= central_state;
					
				elsif(map_data_l = "101") then
					energy_next <= energy;
					new_state <= lvl_up_state;
					x_pos_next <= x_pos;
					
				else
					new_state <= central_state;
					energy_next <= energy;
					x_pos_next <= x_pos;
				end if;
			
		when right_state => --move to the right

			-- define all outputs
			dir_mined <= "000";
			y_pos_next <= y_pos;
			score_next <= score;

				-- if map data right is ground then change position and decrease energy by one
				-- if map data right is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_r = "000") then
					x_pos_next <= std_logic_vector(unsigned(x_pos)+1);
					energy_next <= std_logic_vector(unsigned(energy)-1);
					new_state <= central_state;
				elsif(map_data_r = "101") then
					energy_next <= energy;
					new_state <= lvl_up_state;
					x_pos_next <= x_pos;

				else
					new_state <= central_state;
					energy_next <= energy;
					x_pos_next <= x_pos;
				end if;

		when up_state => --move up

			-- define all outputs
			dir_mined <= "000";
			x_pos_next <= x_pos;
			score_next <= score;

				-- if map data up is ground then change position and decrease energy by one
				-- if map data up is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_u = "000") then
					y_pos_next <= std_logic_vector(unsigned(y_pos)-1);
					energy_next <= std_logic_vector(unsigned(energy)-1);
					new_state <= central_state;
				elsif(map_data_u = "101") then
					energy_next <= energy;
					new_state <= lvl_up_state;
					y_pos_next <= y_pos;

				else
					new_state <= central_state;
					energy_next <= energy;
					y_pos_next <= y_pos;
				end if;	

		when down_state => --move down

			-- define all outputs
			dir_mined <= "000";
			x_pos_next <= x_pos;
			score_next <= score;

				-- if map data down is ground then change position and decrease energy by one
				-- if map data down is ladder go to lvl_up_state
				-- in all other cases don't move the player
				if(map_data_d = "000") then
					y_pos_next <= std_logic_vector(unsigned(y_pos)+1);
					energy_next <= std_logic_vector(unsigned(energy)-1);
					new_state <= central_state;
				elsif(map_data_d = "101") then
					energy_next <= energy;
					new_state <= lvl_up_state;
					y_pos_next <= y_pos;

				else
					new_state <= central_state;
					energy_next <= energy;
					y_pos_next <= y_pos;
				end if;

		when lvl_up_state => --level up by ladder, energy restored, score stays the same
			dir_mined <= "000";
			x_pos_next <= "0100";
			y_pos_next <= "0011";
			new_state <= central_state;
			energy_next <= "11001000";
			score_next <= score;

		when others => -- in the event of an error don't change anything and go to the central state
			new_state <= central_state;
			dir_mined <= "000";
			y_pos_next <= y_pos;
			x_pos_next <= x_pos;
			score_next <= score;
			energy_next <= energy;

	end case;
	end process;

end behaviour;
