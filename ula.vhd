library ieee;
use ieee.std_logic_1164.all;

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
end architecture;