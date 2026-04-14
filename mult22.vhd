library ieee;
use ieee.std_logic_1164.all;

entity mult22 is
	port(
		a, b : in std_logic_vector(1 downto 0);
		res : out std_logic_vector(3 downto 0)
	);
end entity;

architecture Behavioral of mult22 is
	signal s0, s1, s2, s3 : std_logic;
	signal carry : std_logic;
	begin
		--   10
		-- X 01
		 ------
		--   10
		-- +00
		 ------
		-- = 10
		res(0) <= a(0) and b(0);
		s0 <= a(1) and b(0);
		s1 <= a(0) and b(1);
		res(1) <= s0 xor s1;
		carry <= s0 and s1;
		
		s2 <= a(1) and b(1);
		
		res(2) <= s2 xor carry;
		res(3) <= s2 and carry;
end architecture;