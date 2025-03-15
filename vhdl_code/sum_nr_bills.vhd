LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY sum_nr_bills IS
  PORT (
  	cashreg10, cashreg20, cashreg50, cashreg100, cashreg200, cashreg500 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
  	bani10, bani20, bani50, bani100, bani200, bani500: in STD_LOGIC_VECTOR(3 DOWNTO 0);
  	newreg10, newreg20, newreg50, newreg100, newreg200, newreg500 : out STD_LOGIC_VECTOR(3 DOWNTO 0)
  	
    );
END sum_nr_bills;



ARCHITECTURE TypeArchitecture OF sum_nr_bills IS
BEGIN

process (cashreg10, cashreg20, cashreg50, cashreg100, cashreg200, cashreg500, bani10, bani20, bani50, bani100, bani200, bani500)
variable A10, A20, A50, A100, A200, A500, B10, B20, B50, B100, B200, B500, aux10, aux20, aux50, aux100, aux200, aux500: std_logic_vector(4 downto 0) := "00000";
begin
A10 (3 DOWNTO 0) := cashreg10;
A10(4) := '0';
A20 (3 DOWNTO 0) := cashreg20;
A20(4) := '0';
A50 (3 DOWNTO 0) := cashreg50;
A50(4) := '0';
A100 (3 DOWNTO 0) := cashreg100;
A100(4) := '0';
A200 (3 DOWNTO 0) := cashreg200;
A200(4) := '0';
A500 (3 DOWNTO 0) := cashreg500;
A500(4) := '0';

B10 (3 DOWNTO 0) := bani10;
B10(4) := '0';
B20 (3 DOWNTO 0) := bani20;
B20(4) := '0';
B50 (3 DOWNTO 0) := bani50;
B50(4) := '0';
B100 (3 DOWNTO 0) := bani100;
B100(4) := '0';
B200 (3 DOWNTO 0) := bani200;
B200(4) := '0';
B500 (3 DOWNTO 0) := bani500;
B500(4) := '0';


aux10 := A10+B10;
aux20 := A20+B20;
aux50 := A50+B50;
aux100 := A100+B100;
aux200 := A200+B200;
aux500 := A500+B500;

if aux10(4) = '1' then aux10(3 downto 0) := "1111";
end if;
if aux20(4) = '1' then aux20(3 downto 0) := "1111";
end if;
if aux50(4) = '1' then aux50(3 downto 0) := "1111";
end if;
if aux100(4) = '1' then aux100(3 downto 0) := "1111";
end if;
if aux200(4) = '1' then aux200(3 downto 0) := "1111";
end if;
if aux500(4) = '1' then aux500(3 downto 0) := "1111";
end if;


newreg10 <= aux10(3 downto 0);
newreg20 <= aux20(3 downto 0);
newreg50 <= aux50(3 downto 0);
newreg100 <= aux100(3 downto 0);
newreg200 <= aux200(3 downto 0);
newreg500 <= aux500(3 downto 0);



end process;
END TypeArchitecture;