library ieee;
use ieee.std_logic_1164.all;

entity tb_comparador is
end entity;

architecture tb of tb_comparador is
	signal a, b : std_logic_vector(3 downto 0);
	signal GRT, LST, EQU : std_logic;
	begin
		UUT: entity work.comparador port map(
			a => a,
			b => b,
			GRT => GRT,
			LST => LST,
			EQU => EQU
		);
		process
		begin
			a <= "0000"; b <= "0000"; wait for 100 ps;
			a <= "1010"; b <= "0101"; wait for 100 ps;
			a <= "0101"; b <= "1010"; wait for 100 ps;
			a <= "1111"; b <= "1111"; wait for 100 ps;
			a <= "1000"; b <= "0111"; wait for 100 ps;
			a <= "0000"; b <= "0001"; wait for 100 ps;
			wait;
		end process;
end architecture;