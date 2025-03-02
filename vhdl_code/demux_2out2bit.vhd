LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY demux_2out2bit IS
  PORT (
 		I: in std_logic_vector (1 downto 0);
  		S: in std_logic;
  		Y0, Y1: out std_logic_vector (1 downto 0)
    );
END demux_2out2bit;



ARCHITECTURE TypeArchitecture OF demux_2out2bit IS

BEGIN
process (S, I)
	begin
	if S = '0'THEN 
		Y0 <= I;
		Y1 <= "00";
	else 
		Y0 <= "00";
		Y1 <= I;
	end if;
end process;


END TypeArchitecture;