
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator_sold_suma IS
  PORT (
  data1: in std_logic_vector(15 downto 0);
  data2: in std_logic_vector(15 downto 0);
  i: out std_logic)
;
END comparator_sold_suma;


ARCHITECTURE TypeArchitecture OF comparator_sold_suma IS

BEGIN
	process(data1, data2)
		begin
			if data1 <= data2 then
				i <= '0';
			else i <= '1';
			end if;
	end process;
END TypeArchitecture;