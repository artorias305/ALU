library ieee;
use ieee.std_logic_1164.all;

entity tb_adder4bits is
end entity;

architecture tb of tb_adder4bits is
	signal a, b : std_logic_vector(3 downto 0);
	signal cin : std_logic;
	signal soma : std_logic_vector(3 downto 0);
	signal cout : std_logic;
	begin
		UUT: entity work.adder4bits port map(
			a => a,
			b => b,
			cin => cin,
			soma => soma,
			cout => cout
		);
		process begin
			a <= "0010"; b <= "0010"; cin <= '0';
			wait for 100 ps;
			a <= "1010"; b <= "0101"; cin <= '0';
			wait for 100 ps;
			a <= "1111"; b <= "0001"; cin <= '0';
			wait for 100 ps;
			a <= "0111"; b <= "1000"; cin <= '1';
			wait for 100 ps;
			wait;
		end process;
end architecture;