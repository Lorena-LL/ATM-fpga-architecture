LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY cash_register_sold IS
  PORT (
i10, i20, i50, i100, i200, i500:  in std_logic_vector(3 downto 0);
  sold: out std_logic_vector(15 downto 0));
END cash_register_sold;



ARCHITECTURE TypeArchitecture OF cash_register_sold IS

BEGIN

	process(i10, i20, i50, i100, i200, i500)
	variable tmp: std_logic_vector (13 downto 0):="00000000000000";
	variable aux10, aux20, aux50, aux100, aux200, aux500 : std_logic_vector (13 downto 0);
	begin
	aux10(7 downto 0) := i10*"1010"; aux10(13 downto 8) := "000000";
	aux20(8 downto 0) := i20*"10100"; aux20(13 downto 9) := "00000";
	aux50(9 downto 0) := i50*"110010"; aux50(13 downto 10) := "0000";
	aux100(10 downto 0) := i100*"1100100"; aux100(13 downto 11) := "000";
	aux200(11 downto 0) := i200*"11001000"; aux200(13 downto 12) := "00";
	aux500(12 downto 0) := i500*"111110100"; aux500(13) := '0';
	
	tmp:= aux10 + aux20 + aux50 + aux100 + aux200 + aux500;
	sold<="00" & tmp;
	end process;

END TypeArchitecture;