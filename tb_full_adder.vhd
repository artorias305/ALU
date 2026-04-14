library ieee;
use ieee.std_logic_1164.all;

entity tb_full_adder is
end entity;

architecture tb of tb_full_adder is
	signal a, b, cin : std_logic;
	signal soma, cout : std_logic;
	begin
		UUT: entity work.full_adder
			port map(
				a => a,
				b => b,
				cin => cin,
				soma => soma,
				cout => cout
			);
	process begin
        a<='0'; b<='0'; cin<='0'; wait for 100 ps;
        a<='1'; b<='0'; cin<='0'; wait for 100 ps;
        a<='1'; b<='1'; cin<='0'; wait for 100 ps;
        a<='1'; b<='1'; cin<='1'; wait for 100 ps;
        wait;
    end process;
end architecture;