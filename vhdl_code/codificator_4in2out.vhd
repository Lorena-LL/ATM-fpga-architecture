
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY codificator_4in2out IS
  PORT (
  		I3, I2, I1, I0: in std_logic;
  		iesire: out std_logic_vector (1 downto 0)
    );
END codificator_4in2out;



ARCHITECTURE TypeArchitecture OF codificator_4in2out IS
BEGIN

	process (I3, I2, I1, I0)
	begin

		if I0 = '1' then iesire <= "00";
		elsif I1 = '1' then iesire <= "01";
		elsif I2 = '1' then iesire <= "10";
		else iesire <= "11";
		end if;
	end process;

END TypeArchitecture;


--daca nu se activeaza nicio iesire atunci rezultatul va fi "11"