LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY demux_4out1bit IS
  PORT (
  		I: in std_logiC;
  		S: in std_logic_vector (1 downto 0);
  		Y0, Y1, Y2, Y3: out std_logic
    );
END demux_4out1bit;



ARCHITECTURE TypeArchitecture OF demux_4out1bit IS

BEGIN
process (S, I)
	begin
	if S = "00"THEN 
		Y0 <= I;
		Y1 <= '0';
		Y2 <= '0';
		Y3 <= '0';
	elsif S = "01" then
		Y0 <= '0';
		Y1 <= I;
		Y2 <= '0';
		Y3 <= '0';
	elsif S = "10" then 
		Y0 <= '0';
		Y1 <= '0';
		Y2 <= I;
		Y3 <= '0';
	else
		Y0 <= '0';
		Y1 <= '0';
		Y2 <= '0';
		Y3 <= I;
	end if;
end process;


END TypeArchitecture;