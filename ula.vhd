library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
	port (
		a, b : in std_logic_vector(3 downto 0);
		opcode : in std_logic_vector(2 downto 0);
		resultado : out std_logic_vector(3 downto 0);
		cout : out std_logic;
		zero : out std_logic;
		overflow : out std_logic;
		equ, grt, lst : out std_logic
	);
end entity;

architecture Behavioral of ula is
	signal and_res, or_res, not_res : std_logic_vector(3 downto 0);
	signal add_res, sub_res, mult_res : std_logic_vector(3 downto 0);
	signal cout_add, cout_sub : std_logic;
	signal b_neg : std_logic_vector(3 downto 0);
	signal res_int : std_logic_vector(3 downto 0);
	begin
		and_res <= a and b;
		or_res <= a or b;
		not_res <= not b;
		b_neg <= not b;
		
		ADDER_ADD: entity work.adder4bits port map(
			a => a,
			b => b,
			cin => '0',
			soma => add_res,
			cout => cout_add
		);
		ADDER_SUB: entity work.adder4bits port map(
			a => a,
			b => b_neg,
			cin => '1',
			soma => sub_res,
			cout => cout_sub
		);
		MULT: entity work.mult22 port map(
			a => a(1 downto 0),
			b => b(1 downto 0),
			res => mult_res
		);
		
		with opcode select
			res_int <= "0000" when "000",
							and_res when "001",
							or_res when "010",
							not_res when "011",
							add_res when "100",
							sub_res when "101",
							mult_res when "110",
							"0000" when others;
		resultado <= res_int;
		cout <= cout_add when opcode = "100" else
				  cout_sub when opcode = "101" else
				  '0';
		zero <= '1' when res_int = "0000" else '0';
		overflow <= (not(a(3)) and not(b(3)) and add_res(3)) or (a(3) and b(3) and not(add_res(3))) when opcode = "100" else
                (not(a(3)) and b(3) and sub_res(3)) or (a(3) and not(b(3)) and not(sub_res(3))) when opcode = "101" else
                '0';
		equ <= '1' when (a = b) and opcode = "111" else '0';
		grt <= '1' when (signed(a) > signed(b)) and opcode = "111" else '0';
		lst <= '1' when (signed(a) < signed(b)) and opcode = "111" else '0';
end architecture;