library ieee;
use ieee.std_logic_1164.all;
entity tb_ula is
end entity;
architecture tb of tb_ula is
	signal a, b : std_logic_vector(3 downto 0);
	signal opcode : std_logic_vector(2 downto 0);
	signal resultado : std_logic_vector(3 downto 0);
	signal cout : std_logic;
	signal zero : std_logic;
	signal overflow : std_logic;
	signal equ, grt, lst : std_logic;
	begin
		UUT: entity work.ula port map(
			a => a,
			b => b,
			opcode => opcode,
			resultado => resultado,
			cout => cout,
			zero => zero,
			overflow => overflow,
			equ => equ,
			grt => grt,
			lst => lst
		);
		process begin
        a <= "0000"; b <= "0000"; opcode <= "000";
        wait for 100 ps;
        a <= "1111"; b <= "1111"; opcode <= "000";
        wait for 100 ps;
        a <= "1010"; b <= "1100"; opcode <= "001";
        wait for 100 ps;
        a <= "1111"; b <= "1111"; opcode <= "001";
        wait for 100 ps;
        a <= "1111"; b <= "0000"; opcode <= "001";
        wait for 100 ps;
        a <= "0101"; b <= "1010"; opcode <= "001";
        wait for 100 ps;
        a <= "1010"; b <= "0101"; opcode <= "010";
        wait for 100 ps;
        a <= "0000"; b <= "0000"; opcode <= "010";
        wait for 100 ps;
        a <= "1010"; b <= "1100"; opcode <= "010";
        wait for 100 ps;
        a <= "1111"; b <= "0000"; opcode <= "010";
        wait for 100 ps;
        a <= "0000"; b <= "1111"; opcode <= "011";
        wait for 100 ps;
        a <= "0000"; b <= "0000"; opcode <= "011";
        wait for 100 ps;
        a <= "0000"; b <= "1010"; opcode <= "011";
        wait for 100 ps;
        a <= "0000"; b <= "0101"; opcode <= "011";
        wait for 100 ps;
        a <= "0001"; b <= "0001"; opcode <= "100";
        wait for 100 ps;
        a <= "0011"; b <= "0101"; opcode <= "100";
        wait for 100 ps;
        a <= "0000"; b <= "0000"; opcode <= "100";
        wait for 100 ps;
        a <= "1111"; b <= "0001"; opcode <= "100";
        wait for 100 ps;
        a <= "1111"; b <= "1111"; opcode <= "100";
        wait for 100 ps;
        a <= "0111"; b <= "0001"; opcode <= "100";
        wait for 100 ps;
        a <= "1000"; b <= "1000"; opcode <= "100";
        wait for 100 ps;
        a <= "0101"; b <= "1011"; opcode <= "100";
        wait for 100 ps;
        a <= "0101"; b <= "0011"; opcode <= "101";
        wait for 100 ps;
        a <= "1111"; b <= "0001"; opcode <= "101";
        wait for 100 ps;
        a <= "0101"; b <= "0101"; opcode <= "101";
        wait for 100 ps;
        a <= "0000"; b <= "0001"; opcode <= "101";
        wait for 100 ps;
        a <= "0111"; b <= "1111"; opcode <= "101";
        wait for 100 ps;
        a <= "0011"; b <= "0011"; opcode <= "110";
        wait for 100 ps;
        a <= "0010"; b <= "0011"; opcode <= "110";
        wait for 100 ps;
        a <= "0001"; b <= "0001"; opcode <= "110";
        wait for 100 ps;
        a <= "0010"; b <= "0010"; opcode <= "110";
        wait for 100 ps;
        a <= "0000"; b <= "0011"; opcode <= "110";
        wait for 100 ps;
        a <= "1111"; b <= "1111"; opcode <= "110";
        wait for 100 ps;
        a <= "0101"; b <= "0101"; opcode <= "111";
        wait for 100 ps;
        a <= "0000"; b <= "0000"; opcode <= "111";
        wait for 100 ps;
        a <= "1111"; b <= "1111"; opcode <= "111";
        wait for 100 ps;
        a <= "0110"; b <= "0011"; opcode <= "111";
        wait for 100 ps;
        a <= "0001"; b <= "0000"; opcode <= "111";
        wait for 100 ps;
        a <= "0001"; b <= "1111"; opcode <= "111";
        wait for 100 ps;
        a <= "0000"; b <= "0001"; opcode <= "111";
        wait for 100 ps;
        a <= "1000"; b <= "1111"; opcode <= "111";
        wait for 100 ps;
        a <= "1111"; b <= "1000"; opcode <= "111";
        wait for 100 ps;
        wait;
		end process;
end architecture;