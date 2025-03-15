LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY optiuni_retragere_suma IS
  PORT (
ret500, ret200, ret100, ret50, ret20, ret10, rets: in std_logic;
  alta_suma: in std_logic_vector(15 downto 0);
  suma: out std_logic_vector(15 downto 0));
END optiuni_retragere_suma;



ARCHITECTURE TypeArchitecture OF optiuni_retragere_suma IS

BEGIN
process(ret500, ret200, ret100, ret50, ret20, ret10, rets, alta_suma)
begin

if ret500 = '1' and ret200 = '0' and ret100 = '0' and ret50 = '0' and ret20 = '0' and ret10 = '0' and rets = '0' then 
suma<=x"01f4";
elsif ret500 = '0' and ret200 = '1' and ret100 = '0' and ret50 = '0' and ret20 = '0' and ret10 = '0' and rets = '0' then 

suma<=x"00c8";
elsif ret500 = '0' and ret200 = '0' and ret100 = '1' and ret50 = '0' and ret20 = '0' and ret10 = '0' and rets = '0' then 
suma<=x"0064";
elsif ret500 = '0' and ret200 = '0' and ret100 = '0' and ret50 = '1' and ret20 = '0' and ret10 = '0' and rets = '0' then 
suma<=x"0032";
elsif ret500 = '0' and ret200 = '0' and ret100 = '0' and ret50 = '0' and ret20 = '1' and ret10 = '0' and rets = '0' then 
suma<=x"0014";
elsif ret500 = '0' and ret200 = '0' and ret100 = '0' and ret50 = '0' and ret20 = '0' and ret10 = '1' and rets = '0' then 
suma<=x"000a";
elsif ret500 = '0' and ret200 = '0' and ret100 = '0' and ret50 = '0' and ret20 = '0' and ret10 = '0' and rets = '1' then 
suma<=alta_suma;
else
suma<=x"0000";
end if;
end process;
END TypeArchitecture;