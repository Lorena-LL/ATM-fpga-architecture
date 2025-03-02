
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator_egalitate_v2 IS
  PORT (
		--enb: in std_logic;
  		A0, A1, A2, A3: in std_logic_vector(3 downto 0);
  		B0, B1, B2, B3: in std_logic_vector(3 downto 0);
  		i: out std_logic)
;
END comparator_egalitate_v2;



ARCHITECTURE TypeArchitecture OF comparator_egalitate_v2 IS

BEGIN
	process(A0, A1, A2, A3, B0, B1, B2, B3)
		begin
			i<= '0';
			if A0 = B0 AND A1 = B1 AND A2 = B2 AND A3 = B3 then i<='1';
			end if;
	end process;
END TypeArchitecture;