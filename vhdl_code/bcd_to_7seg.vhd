library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_7seg is
  port (
    hex : in std_logic_vector(3 downto 0);
    seg : out std_logic_vector(6 downto 0)
  );
end entity bcd_to_7seg;

architecture behavioral of bcd_to_7seg is

begin

    seg <= "1111110" when hex = x"0" else
    		 "0110000" when hex = x"1" else
    		 "1101101" when hex = x"2" else
    		 "1111001" when hex = x"3" else
    		 "0110011" when hex = x"4" else
    		 "1011011" when hex = x"5" else
    		 "1011111" when hex = x"6" else
    		 "1110000" when hex = x"7" else
    		 "1111111" when hex = x"8" else
    		 "1111011" when hex = x"9" else
    		 "0000000";
    		 
end architecture behavioral;