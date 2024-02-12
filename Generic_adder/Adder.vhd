library ieee;
use ieee.std_logic_1164.all;
entity adder is
    generic
    (
        lengh: Integer := 8);
    port
    (
        y: in std_logic_vector(lengh - 1 downto 0);
        x: in std_logic_vector(lengh - 1 downto 0);
        hasel: out std_logic_vector(lengh - 1 downto 0);
        input: in std_logic;
        output, overflow: out std_logic);
end entity;
architecture behavioral of adder is
    component fulladder is
        port
        (
            y, x, input : in std_logic;
            output, hasel : out std_logic );
    end component;
    signal carry: std_logic_vector(lengh downto 0);
    signal hasel_sig: std_logic_vector(lengh - 1 downto 0);
    signal q: std_logic_vector(lengh - 1 downto 0); 
begin 
	lots_of_xor: for i in 0 to lengh - 1 generate
		q(i) <= y(i) xor input;
	end generate;
    adder_generator: for i in 0 to lengh - 1 generate
        adder_portmap: fulladder port map
        (
            y => q(i),
            x => x(i),
            input  => carry(i),
            hasel  => hasel_sig(i),
            output => carry(i + 1));
    end generate;
        carry(0) <= input;
	hase        <= hasel_sig;
        overflow    <= (carry(lengh) xor carry(lengh - 1));
	output      <= carry(lengh);
end architecture;
    
