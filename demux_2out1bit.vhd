
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY demux_2out1bit IS
  PORT (
 		I: in std_logic;
  		S: in std_logic;
  		Y0, Y1: out std_logic
    );
END demux_2out1bit;



ARCHITECTURE TypeArchitecture OF demux_2out1bit IS

BEGIN
process (S, I)
	begin
	if S = '0'THEN 
		Y0 <= I;
		Y1 <= '0';
	else 
		Y0 <= '0';
		Y1 <= I;
	end if;
end process;


END TypeArchitecture;