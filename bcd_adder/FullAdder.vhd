library ieee;
use ieee.std_logic_1164.all;
entity fulladder is
	port
	(
		z, a, input:  in std_logic;
		hasel, output: out std_logic);
end entity;

architecture behavioral of fulladder is

	
begin
	hasel  <= z xor a xor input;
	output <= (z and a) or (z and input) or (a and input);
	
end architecture;
