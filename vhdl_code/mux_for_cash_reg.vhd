LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_for_cash_reg IS
  PORT (
  		alg10, alg20, alg50, alg100, alg200, alg500, dep10, dep20, dep50, dep100, dep200, dep500: in std_logic_vector (3 downto 0);
  		sel: in std_logic;
  		reg10, reg20, reg50, reg100, reg200, reg500: out std_logic_vector (3 downto 0)
    );
END mux_for_cash_reg;



ARCHITECTURE TypeArchitecture OF mux_for_cash_reg IS
BEGIN

process (alg10, alg20, alg50, alg100, alg200, alg500, dep10, dep20, dep50, dep100, dep200, dep500, sel)
begin

if sel = '0' then
		reg10 <= alg10;
		reg20 <= alg20;
		reg50 <= alg50;
		reg100 <= alg100;
		reg200 <= alg200;
		reg500 <= alg500;
else 
		reg10 <= dep10;
		reg20 <= dep20;
		reg50 <= dep50;
		reg100 <= dep100;
		reg200 <= dep200;
		reg500 <= dep500;
end if;


end process;
END TypeArchitecture;