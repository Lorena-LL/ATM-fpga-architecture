library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;

entity sumator_scazator_16b is
  port (
    a, b: in std_logic_vector(15 downto 0);
    op: in std_logic;
    enable: in std_logic;
    c: out std_logic_vector(15 downto 0)
  );
end entity sumator_scazator_16b;

architecture behavioral of sumator_scazator_16b is

begin 

  process (a, b, op, enable)
 	variable auxa: std_logic_vector(15 downto 0);
	variable auxb: std_logic_vector(15 downto 0);
	variable auxc: std_logic_vector(15 downto 0) := (others => '0');
  begin
  	auxa := a;
	auxb := b;
	
    if (enable = '1') then
      if (op = '1') then
        auxc := auxa + auxb;
      else
        auxc := auxa - auxb;
      end if;
    else
      auxc := (others => '0');
    end if;
    c <= auxc;
  end process;
end architecture behavioral;


-- op = '1' => adunare
-- op = '0' => scadere

--trebuie tinut cont ca are nevoie de enable dupa ce primeste a si b ca sa dea rezultetul corect pe c. Daca e enable prima data si apoi intrarile atunci nu va avea iesirea buna.