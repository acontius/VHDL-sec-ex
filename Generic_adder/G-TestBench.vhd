library ieee;
use ieee.std_logic_1164.all;
entity tb_adder is
end entity;
architecture behavior of tb_adder is
	component adder is
		generic
		(
		        lengh: integer);
		port
		(
			y, x: in std_logic_vector(lengh - 1 downto 0);
			input:  in std_logic;
			hasel: out std_logic_vector(lengh - 1 downto 0);
			output, overflow: out std_logic);
	end component;
	signal y, x, hasel: std_logic_vector(3 downto 0) := (others => '0');
	signal output, overflow: std_logic := '0';
	signal input: std_logic := '1';
begin
	uut: adder
	generic map
	(
		lengh => 4)
	port map
	(   	
		y => y ,
		x => x ,
		hasel => hasel ,
		input => input ,
		output => output ,
		overflow => overflow);
	x(0) <= not x(0) after 3   ns;
	x(1) <= not x(1) after 6   ns;
	x(2) <= not x(2) after 12  ns;
	x(3) <= not x(3) after 24  ns;
	y(0) <= not y(0) after 48  ns;
	y(1) <= not y(1) after 96  ns;
	y(2) <= not y(2) after 192 ns;
	y(3) <= not y(3) after 384 ns;
end architecture;
