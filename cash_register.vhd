LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY cash_register IS
  PORT (
clk: in std_logic;
  we: in std_logic;
  rest10, rest20, rest50, rest100, rest200, rest500: in std_logic_vector(3 downto 0);
  cashreg10, cashreg20, cashreg50, cashreg100, cashreg200, cashreg500: out std_logic_vector(3 downto 0)
  );
END cash_register;



ARCHITECTURE TypeArchitecture OF cash_register IS

BEGIN

	process(clk)
	variable b10: std_logic_vector(3 downto 0):="1111";
	variable b20: std_logic_vector(3 downto 0):="1111";
	variable b50: std_logic_vector(3 downto 0):="1111";
	variable b100: std_logic_vector(3 downto 0):="1111";
	variable b200: std_logic_vector(3 downto 0):="1111";
	variable b500: std_logic_vector(3 downto 0):="1111";
	begin
		if rising_edge(clk) then
			if we = '0' then
				b10 := b10;
				b20 := b20;
				b50 := b50;
				b100 := b100;
				b200 := b200;
				b500 := b500;
			else b10 := rest10;
				b20 := rest20;
				b50 := rest50;
				b100 := rest100;
				b200 := rest200;
				b500 := rest500;
			end if;
		end if;
	cashreg10 <= b10;
	cashreg20 <= b20;
	cashreg50 <= b50;
	cashreg100 <= b100;
	cashreg200 <= b200;
	cashreg500 <= b500;
	end process;
END TypeArchitecture;