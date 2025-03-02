
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_2in2bit IS
  PORT (
  		I0, I1: in std_logic_vector (1 downto 0);
  		S: in std_logic;
  		Y: out std_logic_vector (1 downto 0)
    );
END mux_2in2bit;


ARCHITECTURE TypeArchitecture OF mux_2in2bit IS

BEGIN
process (S, I0, I1)	--se va schimba iesirea la modificarea intrarilor
	begin
	if S = '0'THEN Y <= I0;
	else Y <= I1;
	end if;
end process;


END TypeArchitecture;