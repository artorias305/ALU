library ieee;
use ieee.std_logic_1164.all;

entity negador is
	port(
		v : in std_logic_vector(3 downto 0);
		o : out std_logic_vector(3 downto 0)
	);
end entity;

architecture bhv of negador is
	begin
		RES: entity work.adder4bits port map(
			a => not v,
			b => "0000",
			cin => '1',
			resultado => o
		);
end architecture;