LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registru_PIN_0 IS
  PORT (
  		clk: in std_logic;
 		I0, I1, I2, I3: out std_logic_vector (3 downto 0) --4 iesiri fiecare de cate 4 biti
    );
END registru_PIN_0;



ARCHITECTURE TypeArchitecture OF registru_PIN_0 IS

	signal valoare_stocata: std_logic_vector (15 downto 0) := "0010010001101000";	--pinul din primul registru va fi 2468

BEGIN
	process (clk)
	begin
		if clk'event and clk = '1' then 
			I0 <= valoare_stocata (3 downto 0);
			I1 <= valoare_stocata (7 downto 4);
			I2 <= valoare_stocata (11 downto 8);
			I3 <= valoare_stocata (15 downto 12);
		end if;
	end process;


END TypeArchitecture;
