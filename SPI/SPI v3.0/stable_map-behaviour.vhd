library IEEE;
use IEEE.std_logic_1164.ALL;

architecture behaviour of stable_map is

type stable_map_state is (central_state, update_state, reset_state, 
			break_l_state, break_r_state, break_u_state, break_d_state);

signal state, next_state : stable_map_state;
signal map_internal, map_next : std_logic_vector(71 downto 0);

begin

process (clk)
begin
	if (rising_edge(clk)) then
		if (reset = '1') then
			map_internal <= (others => '0');
			state <= reset_state;
		else
			map_internal <= map_next;
			state <= next_state;
		end if;
	end if;
end process;

process (map_updated, dir_mined, vga_done, map_data_volatile, 
	map_internal, state)
begin
case state is
	when reset_state => 
		next_state <= central_state;
		map_next <= (others => '0');

	when central_state =>
		map_next <= map_internal;

		if (map_updated = '1') then
			next_state <= update_state;
		elsif (dir_mined = "100") then
			next_state <= break_l_state;
		elsif (dir_mined = "101") then
			next_state <= break_r_state;
		elsif (dir_mined = "110") then
			next_state <= break_u_state;
		elsif (dir_mined = "111") then
			next_state <= break_d_state;
		else
			next_state <= central_state;
		end if;

	when update_state =>
		if (vga_done = '1') then
			map_next <= map_data_volatile;
			next_state <= reset_state;
		else
			map_next <= map_internal;
			next_state <= update_state;
		end if;

	when break_l_state =>
		if (vga_done = '1') then
			if (map_internal(20 downto 18) = "001"
			or map_internal(20 downto 18) = "010"
			or map_internal(20 downto 18) = "100") then -- if rock or ore -> ground
				map_next (20 downto 18) <= "000";
			elsif (map_internal(20 downto 18) = "111") then -- if rock with ladder
				map_next (20 downto 18) <= "101";
			else
				map_next (20 downto 18) <= map_internal (20 downto 18);
			end if;

			map_next (71 downto 21) <= map_internal (71 downto 21);
			map_next (17 downto  0) <= map_internal (17 downto 0);

			next_state <= central_state;
		else
			map_next <= map_internal;
			next_state <= update_state;
		end if;

	when break_r_state =>
		if (vga_done = '1') then
			if (map_internal(53 downto 51) = "001"
			or map_internal(53 downto 51) = "010"
			or map_internal(53 downto 51) = "100") then -- if rock or ore -> ground
				map_next (53 downto 51) <= "000";
			elsif (map_internal(53 downto 51) = "111") then -- if rock with ladder
				map_next (53 downto 51) <= "101";
			else
				map_next (53 downto 51) <= map_internal (20 downto 18);
			end if;

			map_next (71 downto 54) <= map_internal (71 downto 54);
			map_next (50 downto  0) <= map_internal (50 downto 0);

			next_state <= central_state;
		else
			map_next <= map_internal;
			next_state <= update_state;
		end if;

	when break_u_state =>
		if (vga_done = '1') then
			if (map_internal(35 downto 33) = "001"
			or map_internal(35 downto 33) = "010"
			or map_internal(35 downto 33) = "100") then -- if rock or ore -> ground
				map_next (35 downto 33) <= "000";
			elsif (map_internal(35 downto 33) = "111") then -- if rock with ladder
				map_next (35 downto 33) <= "101";
			else
				map_next (35 downto 33) <= map_internal (35 downto 33);
			end if;

			map_next (71 downto 36) <= map_internal (71 downto 36);
			map_next (32 downto  0) <= map_internal (32 downto 0);

			next_state <= central_state;
		else
			map_next <= map_internal;
			next_state <= update_state;
		end if;

	when break_d_state =>
		if (vga_done = '1') then
			if (map_internal(38 downto 36) = "001"
			or map_internal(38 downto 36) = "010"
			or map_internal(38 downto 36) = "100") then -- if rock or ore -> ground
				map_next (38 downto 36) <= "000";
			elsif (map_internal(38 downto 36) = "111") then -- if rock with ladder
				map_next (38 downto 36) <= "101";
			else
				map_next (38 downto 36) <= map_internal (38 downto 36);
			end if;

			map_next (71 downto 39) <= map_internal (71 downto 39);
			map_next (35 downto  0) <= map_internal (35 downto 0);

			next_state <= central_state;
		else
			map_next <= map_internal;
			next_state <= update_state;
		end if;

	when others =>
		next_state <= central_state;
		map_next <= map_internal;
end case;
end process;

end behaviour;

