
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity sound_ctrl is 
	port (	reset 		: in std_logic; --reset from the fpga
		clock 		: in std_logic; --clock input into the master   25.175 MHz
		song_select    	: in std_logic_vector(1 downto 0);
		timer1		: in std_logic_vector(5 downto 0);
		sound    	: out std_logic);
end entity sound_ctrl;

Architecture RTL of EPO_3_sound is
signal timer : unsigned(23 downto 0);
signal reset_timer : std_logic;
signal timer_max : unsigned(23 downto 0);
signal note_count : unsigned(23 downto 0);
signal note_timer : unsigned(23 downto 0);
signal new_note_timer : unsigned(23 downto 0);
--signal new_note_count : unsigned(23 downto 0);

begin
--------clock counter---------------

sync : process(clk, reset)

begin
	if(rising_edge(clk)) then
		if (reset = '1' or reset_timer) then
			timer <= (others <= '0');
			timer_max <= (others <= '0');
		else
			
			timer <= new_timer;
		end if;
	end if;
end process;

process (timer)
begin
	if (note_timer < note_count) then
		sound <= '0';
		note_reset <= '0';
	elsif (note_timer < shift_left(note_count,2))
		sound <= '1';
		note_reset <= '0';
	else 
		sound <= '0';
		note_reset <= '1';
	end if;
end process;

timer : process(timer)
begin
	if (reset = '1' or reset _timer = '1') then
		new_timer <= (others <= '0');
	else
		new_timer <= timer + 1; 
	end if
	
end process;


song : process(clock_in)
begin
	case state is
		when idle => 
			next_state <= note1
			new_timer_max <= "000000000000000000000000";
			timer_reset <= '1';
			note_count <= (others => '0');
		when note1 =>
			if (timer < timer_max) then
				next_state <= state;
				new_timer_max <= timer_max;
				timer_reset <= '0';
			else
				timer_reset <= '1';
				next_state <= note2;
				new_timer_max <= "000000000000000000000000"; --duration of nexed note
			end if;
			note_count <= "000000000000000000000000";-- number of clock cycles in half a periode
		when note2 => 
			if (timer < timer_max) then
				next_state <= state;
				new_timer_max <= timer_max;
				timer_reset <= '0';
			else
				timer_reset <= '1';
				next_state <= note3;
				new_timer_max <= "000000000000000000000000"; --duration of nexed note
			end if;
			note_count <= "000000000000000000000000";-- number of clock cycles in half a periode

		when note3 => 
			if (timer < timer_max) then
				next_state <= state;
				new_timer_max <= timer_max;
				timer_reset <= '0';
			else
				timer_reset <= '1';
				next_state <= note4;
				new_timer_max <= "000000000000000000000000"; --duration of nexed note
			end if;
			note_count <= "000000000000000000000000";-- number of clock cycles in half a periode
		when note4 => 
			if (timer < timer_max) then
				next_state <= state;
				new_timer_max <= timer_max;
				timer_reset <= '0';
			else
				timer_reset <= '1';
				next_state <= idle;
				new_timer_max <= "000000000000000000000000"; --duration of nexed note
			end if;
			note_count <= "000000000000000000000000";-- number of clock cycles in half a periode
		when others =>  
			if (timer < timer_max) then
				next_state <= state;
				new_timer_max <= timer_max;
				timer_reset <= '0';
			else
				timer_reset <= '1';
				next_state <= note2;
				new_timer_max <= "000000000000000000000000"; --duration of nexed note
			end if;
			note_count <= "000000000000000000000000"; -- number of clock cycles in half a periode
	end case
end process;

end Architecture;