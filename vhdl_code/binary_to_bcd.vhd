
LIBRARY ieee;
USE ieee.std_logic_1164.all;

USE ieee.numeric_std.ALL;

ENTITY binary_to_bcd IS
  PORT (bin: in std_logic_vector(15 downto 0);
  bcd0: out std_logic_vector(3 downto 0);
  bcd1: out std_logic_vector(3 downto 0);
  bcd2: out std_logic_vector(3 downto 0);
  bcd3: out std_logic_vector(3 downto 0);
  bcd4: out std_logic_vector(3 downto 0)
  
);
END binary_to_bcd;



ARCHITECTURE TypeArchitecture OF binary_to_bcd IS

BEGIN

	process(bin)
	variable tmp, rest: integer;
	begin
	tmp:=to_integer(unsigned(bin));
	rest:=tmp mod 10;
	bcd0<=std_logic_vector(to_unsigned(rest, 4));
	
	tmp:=tmp / 10;
	rest:=tmp mod 10;
	bcd1<=std_logic_vector(to_unsigned(rest, 4));
	
	tmp:=tmp / 10;
	rest:=tmp mod 10;
	bcd2<=std_logic_vector(to_unsigned(rest, 4));
	
	tmp:=tmp / 10;
	rest:=tmp mod 10;
	bcd3<=std_logic_vector(to_unsigned(rest, 4));

	tmp:=tmp / 10;
	rest:=tmp mod 10;
	bcd4<=std_logic_vector(to_unsigned(rest, 4));

	end process;
END TypeArchitecture;