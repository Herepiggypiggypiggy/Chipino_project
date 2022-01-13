library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;

entity EPO_3_sound is 
	port (
	reset_in : in std_logic; --reset from the fpga
	clock_in : in std_logic; --clock input into the master   25.175 MHz
	notes    : in std_logic_vector(1 downto 0);
	sound    : out std_logic
		);
end entity EPO_3_sound;

Architecture RTL of EPO_3_sound is
	signal clock_counter_max : unsigned(18 downto 0); --2^5 decides the frequeny
	signal clock_counter_max_next : unsigned(18 downto 0); --2^5
	signal clock_count : unsigned(18 downto 0);
	signal clock_internal : std_logic:='0';
	signal clock_internal_next : std_logic:='0';
	signal clock_count_next : unsigned(18 downto 0);
	signal song_count_next : unsigned(23 downto 0);
	signal song_count : unsigned(23 downto 0);
	signal song_counter_max : unsigned(23 downto 0); --2^5 decides the time played

begin
--------clock counter---------------

clock_counter : process(clock_count, clock_counter_max)

begin
	if(clock_count = clock_counter_max) then
		clock_count_next <= (others => '0');
	else

		clock_count_next <= clock_count +1;	
	end if;
end process;


-------clock internal-------------------

music : process(clock_internal)
begin
	if(clock_internal = '0') then
		clock_internal_next <= '1';
	else
		clock_internal_next <= '0';
	end if;
sound <= clock_internal;
end process;
--------frequency generator clock generator--------

frequency_generator : process(clock_in)
begin
	if(rising_edge(clock_in)) then
	
		if(reset_in = '1' or clock_count = clock_counter_max) then
			clock_count <= (others => '0');
			clock_internal <= clock_internal_next;
			--if(clock_internal = '0') then
				--clock_internal_next <= '1';
				
			--else
				--clock_internal <= '0';
			--end if;
		else
		clock_count <= clock_count_next;
		end if;
	end if;
end process;



-- 1100000000010001111011000 = 1s
song1 : process(clock_in)
begin
	if(rising_edge(clock_in)) then
		if(reset_in = '1') then
			song_count <= (others => '0');
			clock_counter_max <= (others => '0');
		else
			clock_counter_max <= clock_counter_max_next;
			song_count <= song_count_next;

		end if;
	end if;
end process;

frequency_notes : process(notes,song_count, clock_count)
begin
	case notes is
		when "00" =>
			if(song_count = "10001101110011111011011000") then
				song_count_next <= (others => '0');
				clock_counter_max_next <= (others => '0');
			elsif (song_count <= "101110011100011010011000") then
				clock_counter_max_next <= "1101111101111111111";
				song_count_next <= song_count +1;
				
			elsif(song_count > "101110011100011010011000" and song_count <= "1100000000010001111011000") then
				clock_counter_max_next <= "0001010011110000111";
				song_count_next <= song_count +1;	
				
		
			--else
				--clock_counter_max_next <= "1100011100011001110";
				--song_count_next <= song_count +1;	

			end if;
		when "01" =>
			if(song_count = "11010101100111111000000000") then --the reset timing
				song_count_next <= (others => '0');
				clock_counter_max_next <= (others => '0');
			elsif (song_count <= "11110100001001000000000") then -- f4
				clock_counter_max_next <= "1101111101111111111";
				song_count_next <= song_count +1;				
			elsif(song_count > "11110100001001000000000" and song_count <= "111101000010010000000000") then --F#4
				clock_counter_max_next <= "1101111101111111111";
				song_count_next <= song_count +1;	
			elsif(song_count > "111101000010010000000000" and song_count <= "1011011100011011000000000") then --F4
				clock_counter_max_next <= "1101111101111111111";
				song_count_next <= song_count +1;	
			elsif(song_count > "1011011100011011000000000" and song_count <= "1111010000100100000000000") then --G#4
				clock_counter_max_next <= "0001110101100100101";
				song_count_next <= song_count +1;	
			elsif(song_count > "1111010000100100000000000" and song_count <= "10011000100101101000000000") then --F4
				clock_counter_max_next <= "1101111101111111111";
				song_count_next <= song_count +1;	
			elsif(song_count > "10011000100101101000000000" and song_count <= "10110111000110110000000000") then--F#4
				--clock_counter_max_next <= "1101111101111111111";
				clock_counter_max_next <= "0001010011110000111";
				song_count_next <= song_count +1;	
			elsif(song_count > "10110111000110110000000000" and song_count < "11010101100111111000000000") then--F4
				clock_counter_max_next <= "1101111101111111111";
				song_count_next <= song_count +1;	
			else
				clock_counter_max_next <= "0000000000000000000";
				song_count_next <= song_count +1;	
			end if;
		when "10" =>
			if(song_count = "11010101100111111000000000") then --the reset timing
				song_count_next <= (others => '0');
				clock_counter_max_next <= (others => '0');
			elsif (song_count <= "11110100001001000000000") then -- D3
				--clock_counter_max_next <= "0101001100100011000";
				clock_counter_max_next <= "0001010011110000111";
				song_count_next <= song_count +1;				
			elsif(song_count > "11110100001001000000000" and song_count <= "111101000010010000000000") then --C7
				--clock_counter_max_next <= "0101001100100011000";
				clock_counter_max_next <= "0001000110011100011";
				song_count_next <= song_count +1;	
			elsif(song_count > "111101000010010000000000" and song_count <= "1011011100011011000000000") then --D3
				--clock_counter_max_next <= "0101001100100011000";
				clock_counter_max_next <= "0000101001111000011";
				song_count_next <= song_count +1;	
			elsif(song_count > "1011011100011011000000000" and song_count <= "1111010000100100000000000") then --C7
				--clock_counter_max_next <= "0000010111010101000";
				clock_counter_max_next <= "0000010111011111100";
				song_count_next <= song_count +1;	
			elsif(song_count > "1111010000100100000000000" and song_count <= "10011000100101101000000000") then --D3
				clock_counter_max_next <= "0101001100100011000";
				song_count_next <= song_count +1;	
			elsif(song_count > "10011000100101101000000000" and song_count <= "10110111000110110000000000") then--A3
				clock_counter_max_next <= "0011011101111100100";
				song_count_next <= song_count +1;	
			elsif(song_count > "10110111000110110000000000" and song_count < "11010101100111111000000000") then--B3
				clock_counter_max_next <= "0011000101101110111";
				song_count_next <= song_count +1;	
			else
				clock_counter_max_next <= "0000000000000000000";
				song_count_next <= song_count +1;	
			end if;
		when "11" =>
			clock_counter_max_next <= "1010011101101101010"; --342890
		when others =>
			clock_counter_max_next <= (others => '0');

	
	end case;
end process;
end Architecture;