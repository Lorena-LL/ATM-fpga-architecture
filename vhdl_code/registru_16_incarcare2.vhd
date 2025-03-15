
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registru_16_incarcare2 IS
  PORT (
  		clk: in std_logic;
  		we: in std_logic;
  		incarcare: in std_logic_vector (15 downto 0);	
 		iesire: out std_logic_vector ( 15 downto 0)
    );
END registru_16_incarcare2;



ARCHITECTURE TypeArchitecture OF registru_16_incarcare2 IS

BEGIN
	process (clk)
	variable reg: std_logic_vector(15 downto 0):=x"02C6"; --710
	begin
		if clk'event and clk = '1' then 
			if we = '1' then
				reg := incarcare;
			else reg:=reg;
			end if;
		end if;
		iesire<= reg;
	end process;

END TypeArchitecture;
