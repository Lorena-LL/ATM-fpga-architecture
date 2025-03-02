LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY bcd_to_binary IS
  PORT (
i0, i1, i2, i3: in std_logic_vector(3 downto 0);
  bin: out std_logic_vector(15 downto 0));
END bcd_to_binary;



ARCHITECTURE TypeArchitecture OF bcd_to_binary IS
BEGIN

	process(i0, i1, i2, i3)
	variable tmp: std_logic_vector(13 downto 0):="00000000000000";
	variable omie:std_logic_vector(9 downto 0):="1111101000";
	variable osuta:std_logic_vector(6 downto 0):="1100100";
	variable zece:std_logic_vector(3 downto 0):="1010";
	begin
	tmp:=i3*omie + i2*osuta + i1*zece + i0;
	bin<="00" & tmp;
	end process;
END TypeArchitecture;