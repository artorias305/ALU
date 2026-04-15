library ieee;
use ieee.std_logic_1164.all;

package pacote_ula is
	component full_adder is
		port(
			a, b, cin : in std_logic;
			soma, cout : out std_logic
		);
	end component;
	component adder4bits is
		port(
			a, b : in std_logic_vector(3 downto 0);
			soma : out std_logic;
			cout : out std_logic
		);
	end component;
	component mult22 is
		port(
			a, b : in std_logic_vector(1 downto 0);
			res : out std_logic_vector(3 downto 0)
		);
	end component;
	component comparador is
		port (
			a, b : in std_logic_vector(3 downto 0);
			GRT, LST, EQU: out std_logic
		);
	end component;
end package;