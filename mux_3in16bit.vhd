LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_3in16bit IS
  PORT (
  		I0, I1, I2: in std_logic_vector (15 downto 0);
  		S: in std_logic_vector (1 downto 0);
  		Y: out std_logic_vector (15 downto 0)
    );
END mux_3in16bit;


ARCHITECTURE TypeArchitecture OF mux_3in16bit IS

BEGIN
process (S, I0, I1, I2)	--se va schimba iesirea la modificarea intrarilor
	begin
	if S = "00" THEN Y <= I0;
	elsif S = "01"THEN Y <= I1;
	elsif S = "10"THEN Y <= I2;
	else Y <= x"0000";
	end if;

end process;


END TypeArchitecture;