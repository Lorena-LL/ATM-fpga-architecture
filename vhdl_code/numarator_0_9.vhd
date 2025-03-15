LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_UNSIGNED.all;


ENTITY numarator_0_9 IS
  PORT (
ENABLE, RESET, CLK : IN STD_LOGIC;
  COUNT: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END numarator_0_9;



architecture behavioral of numarator_0_9 is
    
begin
process (clk, reset)
variable nr: std_logic_vector(3 downto 0) := (others => '0');
    begin
        if reset = '1' then
            nr := (others => '0');
        elsif rising_edge(clk) then
            if enable = '1' then
                if nr = "1001" then
                    nr := (others => '0');
                else
                    nr := nr + 1;
                end if;
            end if;
        end if; 
    count <= nr;
    end process;
   
end architecture;