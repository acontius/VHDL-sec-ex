library ieee;
use ieee.std_logic_1164.all;
entity bcd_adder is
    generic
    (
        lengh: Integer := 8);
    port
    (
        y: in std_logic_vector(lengh - 1 downto 0);
        x: in std_logic_vector(lengh- 1 downto 0);
        hasel: out std_logic_vector(lengh - 1 downto 0);
        input: in std_logic;
        output: out std_logic);
end entity;
architecture behavioral of bcd_adder is
    component fulladder is
        port
        (
            a, z, input : in std_logic;
            output, hasel : out std_logic );
    end component;
    signal carry: std_logic_vector(lengh downto 0);
    signal carryend: std_logic_vector(lengh downto 0);
    signal hasel_sig: std_logic_vector(lengh - 1 downto 0);
    signal q: std_logic_vector(lengh-1 downto 0);
    signal six: std_logic_vector(lengh-1 downto 0);
    signal 6controler: std_logic ;
begin 	
    adder_generator: for i in 0 to lengh - 1 generate
        adder_portmap: fulladder port map
        (
            a => y(i),
            z => x(i),
            input => carry(i),
            hasel => hasel(i),
            output => carry(i + 1));
    end generate;
    carry(0) <= input;
	6controler <=  (carry(lengh)) or (hasel_sig(2) and hasel_sig(3)) or (hasel_sig(1) and hasel_sig(3));
	output <= 6controler;
	six(0)<= '0';
	six(1)<= 6contrler;
	six(2)<= 6contrler;
	six(3)<= '0';
	twadder_generator: for i in 0 to lengh - 1 generate
        twadder_portmap: fulladder port map
        (
            z => hasel(i),
            a => six(i),
            input => carryend(i),
            hasel => q(i),
            output => carryend(i + 1));
         end generate;
         carryend(0) <= input;
         hasel <= q;
end architecture;
    
