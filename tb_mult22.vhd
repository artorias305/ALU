library ieee;
use ieee.std_logic_1164.all;

entity tb_mult22 is
end entity;

architecture tb of tb_mult22 is
	signal a, b : std_logic_vector(1 downto 0);
	signal res : std_logic_vector(3 downto 0);
	begin
		UUT: entity work.mult22 port map(
			a => a,
			b => b,
			res => res
		);
		process begin
			a <= "00"; b <= "00";
			wait for 100 ps;
			a <= "10"; b <= "01";
			wait for 100 ps;
			a <= "10"; b <= "10";
			wait for 100 ps;
			a <= "11"; b <= "01";
			wait for 100 ps;
			a <= "11"; b <= "10";
			wait for 100 ps;
			a <= "11"; b <= "11";
			wait for 100 ps;
			wait;
		end process;
end architecture;