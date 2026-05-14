library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
			SW : in std_logic_vector(17 downto 0);
			
			HEX0, HEX2, HEX4, HEX6 : out std_logic_vector(6 downto 0);
			HEX3, HEX5, HEX7 : out std_logic_vector(6 downto 0);
			LEDR : out std_logic_vector(5 downto 0)
	);
end entity;

architecture bhv of top is
	signal a, b : std_logic_vector(3 downto 0);
	signal opcode : std_logic_vector(2 downto 0);
	signal resultado : std_logic_vector(3 downto 0);
	signal cout, zero, overflow : std_logic;
	signal equ, grt, lst : std_logic;
	signal negado_res, negado_a, negado_b : std_logic_vector(3 downto 0);
	signal valor_a, valor_b, valor_res : std_logic_vector(3 downto 0);
	
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

		NEGADO_RES: entity work.negador port map(v => resultado, o => negado_res);
		NEGADO_A: entity work.negador port map(v => a, o => negado_a);
		NEGADO_B: entity work.negador port map(v => b, o => negado_b);
		
		LEDR(0) <= cout;
		LEDR(1) <= zero;
		LEDR(2) <= overflow;
		LEDR(3) <= equ;
		LEDR(4) <= grt;
		LEDR(5) <= lst;
		
		valor_a <= negado_a when a(3) = '1' else a;
		valor_b <= negado_b when b(3) = '1' else b;
		valor_res <= negado_res when resultado(3) = '1' else resultado;
		
		HEX5 <= not "0000001" when a(3) = '1' else (others => '1');
		HEX3 <= not "0000001" when b(3) = '1' else (others => '1');
		HEX7 <= not "0000001" when resultado(3) = '1' else (others => '1');
		
		HEX_OP: entity work.decoderhex port map(hex => "0" & opcode, seg => HEX0);
		HEX_B: entity work.decoderhex port map(hex => valor_b, seg => HEX2);
		HEX_A: entity work.decoderhex port map(hex => valor_a, seg => HEX4);
		HEX_RES: entity work.decoderhex port map(hex => valor_res, seg => HEX6);
end architecture;
