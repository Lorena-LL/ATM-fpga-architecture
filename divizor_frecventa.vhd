LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


ENTITY divizor_frecventa IS
  PORT (
clk_100mhz: in std_logic;
  	reset: in std_logic;
  	clk_1hz: out std_logic
  		);
 
END divizor_frecventa;



ARCHITECTURE TypeArchitecture OF divizor_frecventa IS

BEGIN
	PROCESS(CLK_100mhz)
	variable nr:std_logic_vector(25 downto 0) := (others => '0');
	begin 
		if reset = '1' then
			nr:= (others => '0');
		else
			if clk_100mhz'event and clk_100mhz = '1' then 
				nr := nr +1;
			end if;
		end if;
		clk_1hz <= nr(25);

	end process;


END TypeArchitecture;