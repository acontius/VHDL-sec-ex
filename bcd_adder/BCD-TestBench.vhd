library ieee;
use ieee.std_logic_1164.all;
entity main_tb is
end entity;
architecture behavior of main_tb is
	component bcd_adder is
		generic
		(
			lengh: integer);
		port
	  (
		y, x: in std_logic_vector(lengh - 1 downto 0);
		hasel: out std_logic_vector(lengh - 1 downto 0);
		input: in std_logic;
		output: out std_logic);
	end component;
	signal y, x, hasel: std_logic_vector(3 downto 0) := (others => '0');
	signal output: std_logic :='0';
	signal input: std_logic := '0';
begin
	uut: bcd_adder
	generic map
	(
		lengh => 4)
	port map
	(   	
		y => y ,
		x => x ,
		input => input ,
		hasel => hasel ,
		output => output );
	x(0) <= not x(0) after 3 ns;
	x(1) <= not x(1) after 6 ns;
	x(2) <= not x(2) after 12 ns;
	x(3) <= not x(3) after 24 ns;
	y(0) <= not y(0) after 48 ns;
	y(1) <= not y(1) after 96 ns;
	y(2) <= not y(2) after 192 ns;
	y(3) <= not y(3) after 384 ns;
end architecture;
