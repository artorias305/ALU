library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
			SW : in std_logic_vector(17 downto 0);
			
			H0, H2, H4, H6 : out std_logic_vector(6 downto 0);
			LEDR : out std_logic_vector(5 downto 0)
	);
end entity;

architecture bhv of top is
	signal a, b : std_logic_vector(3 downto 0);
	signal opcode : std_logic_vector(2 downto 0);
	signal resultado : std_logic_vector(3 downto 0);
	signal cout, zero, overflow : std_logic;
	signal equ, grt, lst : std_logic;
	
	begin
		a <= SW(10 downto 7);
		b <= SW(6 downto 3);
		opcode <= SW(2 downto 0);
		ULA: entity work.ula port map(
			a => a,
			b => b,
			opcode => opcode,
			resultado => resultado,
			cout => cout,
			zero => zero,
			overflow => overflow,
			equ => equ,
			grt => grt,
			lst => lst
		);
		
		LEDR(0) <= cout;
		LEDR(1) <= zero;
		LEDR(2) <= overflow;
		LEDR(3) <= equ;
		LEDR(4) <= grt;
		LEDR(5) <= lst;
		
		HEX_OP: entity work.decoderhex port map(hex => "0" & opcode, seg => H0);
		HEX_B: entity work.decoderhex port map(hex => b, seg => H2);
		HEX_A: entity work.decoderhex port map(hex => a, seg => H4);
		HEX_RES: entity work.decoderhex port map(hex => resultado, seg => H6);
end architecture;
