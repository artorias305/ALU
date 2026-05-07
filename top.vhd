library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
			SW : in std_logic_vector(17 downto 0);
			
			H0 : out std_logic_vector(6 downto 0);
			H1 : out std_logic_vector(6 downto 0);
			H2 : out std_logic_vector(6 downto 0);
			H3 : out std_logic_vector(6 downto 0);
			H4 : out std_logic_vector(6 downto 0)
	);
end entity;

architecture bhv of top is
	signal a, b : std_logic_vector(3 downto 0);
	signal opcode : std_logic_vector(2 downto 0);
	signal resultado : std_logic_vector(3 downto 0);
	signal cout, zero, overflow : std_logic;
	signal equ, grt, lst : std_logic;
	signal flags : std_logic_vector(3 downto 0);
	begin
		a <= SW(3 downto 0);
		b <= SW(7 downto 4);
		opcode <= SW(10 downto 8);
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
		flags(0) <= cout;
		flags(1) <= zero;
		flags(2) <= overflow;
		flags(3) <= equ or grt or lst;
		HEX_A: entity work.decoderhex port map(hex => a, seg => H0);
		HEX_B: entity work.decoderhex port map(hex => b, seg => H1);
		HEX_OP: entity work.decoderhex port map(hex => '0' & opcode, seg => H2);
		HEX_RES: entity work.decoderhex port map(hex => resultado, seg => H3);
		HEX_FLAGS: entity work.decoderhex port map(hex => flags, seg => H4);
end architecture;
