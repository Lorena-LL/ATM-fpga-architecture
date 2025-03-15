
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_in_or0_4bit IS
  PORT (
  		I: in std_logic_vector (3 downto 0);
  		S: in std_logic;
  		Y: out std_logic_vector (3 downto 0)
    );
END mux_in_or0_4bit;



ARCHITECTURE TypeArchitecture OF mux_in_or0_4bit IS

BEGIN
process (S, I)	--se va schimba iesirea la modificarea intrarilor
	begin
	if S = '0'THEN Y <= "0000";
	else Y <= I;
	end if;
end process;


END TypeArchitecture;