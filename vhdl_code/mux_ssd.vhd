
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_ssd IS
  PORT (
i0, i1, i2: in std_logic_vector(3 downto 0);
  sel: in std_logic_vector(1 downto 0);
  y: out std_logic_vector(3 downto 0));
END mux_ssd;



ARCHITECTURE TypeArchitecture OF mux_ssd IS
BEGIN

	process(i0 ,i1 ,i2 , sel)
	begin
	case sel is
		when "00" => y <= i0;
		when "01" => y <= i1;
		when "10" => y <= i2;
		when others => y <="0000";
	end case;
	end process;
END TypeArchitecture;