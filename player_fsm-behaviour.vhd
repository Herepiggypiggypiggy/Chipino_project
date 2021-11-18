library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

architecture behaviour of player_fsm is

type player_fsm_state is (	mine_state,right_state,left_state,down_state,
				up_state, reset_state, central_state,
				mine_up_state, mine_down_state, mine_right_state					, mine_left_state);
	signal x_pos, y_pos, x_pos_next, y_pos_next: std_logic_vector(2 downto 0);
	signal energy, energy_next: std_logic_vector(7 downto 0);

	signal state, new_state:	player_fsm_state;

begin

	process(clk, reset)
	begin
		if (clk = '1' and clk'event) then
			if (reset = '1') then
				state <= reset_state;
			else
				state <= new_state;
			end if;
		end if;
	end process;

	process (state, reset, button_x_left, button_x_right, button_y_up,
	button_y_down, button_mining, map_data_l, map_data_r, map_data_d, 
		map_data_u)
    	begin
        	case state is 
            		when reset_state =>
			if (reset='0') then
                    	new_state <= central_state;
			else
				new_state <= reset_state;
			end if;
		
		when central_state =>
			if(button_mining = '1') then
				new_state <= mine_state;
			elsif(button_x_left = '1') then
				new_state <= left_state;
			elsif(button_x_right = '1') then
				new_state <= right_state;
			elsif(button_y_up = '1') then
				new_state <= up_state;
			elsif(button_y_down = '1') then
				new_state <= down_state;
			end if;
		
		when mine_state =>
			if(button_mining = '1' and button_x_left = '1') then
				new_state <= mine_left_state;
			elsif(button_mining = '1' and button_x_right = '1') then
				new_state <= mine_right_state;
			elsif(button_mining = '1' and button_y_up = '1') then
				new_state <= mine_up_state;
			elsif(button_mining = '1' and button_y_down = '1') then
				new_state <= mine_down_state;
			end if;
		
		when mine_left_state =>
			if(map_data_l = "001" or map_data_l = "010" or 
			map_data_l = "100" or map_data_l = "111") then
				dir_mined <= "100"; --left mined (00)
			else 
				dir_mined <= "000";				
				
			end if;
			new_state <= central_state;
		
		when mine_right_state =>
			if(map_data_r = "001" or map_data_r = "010" or 
			map_data_r = "100" or map_data_r = "111") then
				dir_mined <= "101"; --right mined (01)
			else 
				dir_mined <= "000";				
				
			end if;
			new_state <= central_state;
		
		when mine_up_state =>
			if(map_data_u = "001" or map_data_u = "010" or 
			map_data_u = "100" or map_data_u = "111") then
				dir_mined <= "110"; --up mined (10)
			else 
				dir_mined <= "000";				
				
			end if;
			new_state <= central_state;

		when mine_down_state =>
			if(map_data_d = "001" or map_data_d = "010" or 
			map_data_d = "100" or map_data_d = "111") then
				dir_mined <= "111"; --down mined (11)
			else 
				dir_mined <= "000";				
				
			end if;
			new_state <= central_state;

		when left_state =>
			if(button_x_left = '1' and button_mining = '0') then
				if(map_data_l = "000") then
					x_pos_next <= std_logic_vector(unsigned(x_pos)-'1');
					new_state <= central_state;
				elsif(map_data_l = "101") then
					--level_up <= '1';
					new_state <= reset_state;

				else
					new_state <= central_state;
				end if;
			end if;
			
		when right_state =>
			if(button_x_right = '1' and button_mining = '0') then
				if(map_data_r = "000") then
					x_pos_next <= std_logic_vector(unsigned(x_pos)+'1');
					new_state <= central_state;
				elsif(map_data_r = "101") then
					--level_up <= '1';
					new_state <= reset_state;

				else
					new_state <= central_state;
				end if;
			end if;

		when up_state =>
			if(button_y_up = '1' and button_mining = '0') then
				if(map_data_u = "000") then
					y_pos_next <= std_logic_vector(unsigned(y_pos)-'1');
					new_state <= central_state;
				elsif(map_data_u = "101") then
					--level_up <= '1';
					new_state <= reset_state;

				else
					new_state <= central_state;
				end if;
			end if;		

		when down_state =>
			if(button_y_down = '1' and button_mining = '0') then
				if(map_data_d = "000") then
					y_pos_next <= std_logic_vector(unsigned(y_pos)+'1');
					new_state <= central_state;
				elsif(map_data_d = "101") then
					--level_up <= '1';
					new_state <= reset_state;

				else
					new_state <= central_state;
				end if;
			end if;	

		when others =>
			new_state <= central_state;




		
	end case;
	end process;






end behaviour;
