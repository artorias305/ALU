library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	port (
		a, b : in std_logic_vector(3 downto 0);
		GRT, LST, EQU: out std_logic
	);
end entity;

architecture Behavioral of comparador is
    signal E, G, L : std_logic_vector(3 downto 0);
begin
    E(3) <= a(3) xnor b(3);
    E(2) <= a(2) xnor b(2);
    E(1) <= a(1) xnor b(1);
    E(0) <= a(0) xnor b(0);

    G(3) <= a(3) and (not b(3));
    G(2) <= a(2) and (not b(2));
    G(1) <= a(1) and (not b(1));
    G(0) <= a(0) and (not b(0));

    L(3) <= (not a(3)) and b(3);
    L(2) <= (not a(2)) and b(2);
    L(1) <= (not a(1)) and b(1);
    L(0) <= (not a(0)) and b(0);

    EQU <= E(3) and E(2) and E(1) and E(0);

    GRT <= G(3) or 
           (E(3) and G(2)) or 
           (E(3) and E(2) and G(1)) or 
           (E(3) and E(2) and E(1) and G(0));

    LST <= L(3) or 
           (E(3) and L(2)) or 
           (E(3) and E(2) and L(1)) or 
           (E(3) and E(2) and E(1) and L(0));
end architecture;