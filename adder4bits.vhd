library ieee;
use ieee.std_logic_1164.all;
use work.pacote_ula.all;

entity adder4bits is
	port(
		a, b : in std_logic_vector(3 downto 0);
		cin : std_logic;
		soma : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
end entity;

architecture Behavioral of adder4bits is
	signal carry : std_logic_vector(3 downto 1);
	begin
		F0: entity work.full_adder port map(
			a => a(0),
			b => b(0),
			cin => cin,
			soma => soma(0),
			cout => carry(1)
		);
		F1: entity work.full_adder port map(
			a => a(1),
			b => b(1),
			cin => carry(1),
			soma => soma(1),
			cout => carry(2)
		);
		F2: entity work.full_adder port map(
			a => a(2),
			b => b(2),
			cin => carry(2),
			soma => soma(2),
			cout => carry(3)
		);
		F3: entity work.full_adder port map(
			a => a(3),
			b => b(3),
			cin => carry(3),
			soma => soma(3),
			cout => cout
		);
end architecture;