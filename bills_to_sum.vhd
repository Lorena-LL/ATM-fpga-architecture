
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

ENTITY bills_to_sum IS
  PORT (
		  bani10, bani20, bani50, bani100, bani200, bani500: in STD_LOGIC_VECTOR(3 DOWNTO 0);
		  sum: out std_logic_vector(15 downto 0)
    );
END bills_to_sum;



ARCHITECTURE TypeArchitecture OF bills_to_sum IS

BEGIN

process (bani10, bani20, bani50, bani100, bani200, bani500)
variable aux :integer;
variable b10, b20, b50, b100, b200, b500: integer;
begin
b10:= to_integer(unsigned(bani10));
b20:= to_integer(unsigned(bani20));
b50:= to_integer(unsigned(bani50));
b100:= to_integer(unsigned(bani100));
b200:= to_integer(unsigned(bani200));
b500:= to_integer(unsigned(bani500));

aux:= 10*b10 + 20*b20 + 50*b50 + 100*b100 + 200*b200 + 500*b500;

sum <= STD_LOGIC_VECTOR(to_unsigned(aux, 16));

end process;

END TypeArchitecture;