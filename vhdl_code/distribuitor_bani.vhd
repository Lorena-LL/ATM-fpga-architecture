LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY distribuitor_bani IS
    PORT (
        clk, enb : IN STD_LOGIC;
        suma : IN STD_LOGIC_VECTOR(15 DOWNTO 0);

        cashreg10, cashreg20, cashreg50, cashreg100, cashreg200, cashreg500 : IN STD_LOGIC_VECTOR(3 DOWNTO 0); 
        bani10, bani20, bani50, bani100, bani200, bani500: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        rest10, rest20, rest50, rest100, rest200, rest500 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        
	   eroare : OUT STD_LOGIC;
        done : OUT STD_LOGIC
    );
END ENTITY distribuitor_bani;

ARCHITECTURE Behavioral OF distribuitor_bani IS
    TYPE stare_type IS (idle, procesare_10, procesare_20, procesare_50, procesare_100, procesare_200, procesare_500);
    SIGNAL stare : stare_type := idle;
BEGIN
    PROCESS (clk)
        VARIABLE sum_integer : INTEGER;
        VARIABLE b10, b20, b50, b100, b200, b500 : INTEGER; -- numarul de bancnote disponibile
    BEGIN
        IF rising_edge(clk) THEN
            CASE stare IS
                WHEN idle =>
                    IF enb = '1' THEN
                        sum_integer := to_integer(unsigned(suma));
                        b10 := to_integer(unsigned(cashreg10));
                        b20 := to_integer(unsigned(cashreg20));
                        b50 := to_integer(unsigned(cashreg50));
                        b100 := to_integer(unsigned(cashreg100));
                        b200 := to_integer(unsigned(cashreg200));
                        b500 := to_integer(unsigned(cashreg500));

                        done <= '0';
                        eroare <= '0';
                        stare <= procesare_500;

					if sum_integer > 1000 then 
						eroare <= '1';
                        		stare <= idle;
                        	end if;
                        
                    END IF;

                WHEN procesare_500 =>
                    IF sum_integer >= 500 AND b500 > 0 THEN
                        b500 := b500 - 1;
                        sum_integer := sum_integer - 500;
                    ELSE
                        stare <= procesare_200;
                    END IF;

                WHEN procesare_200 =>
                    IF sum_integer >= 200 AND b200 > 0 THEN
                        b200 := b200 - 1;
                        sum_integer := sum_integer - 200;
                    ELSE
                        stare <= procesare_100;
                    END IF;

                WHEN procesare_100 =>
                    IF sum_integer >= 100 AND b100 > 0 THEN
                        b100 := b100 - 1;
                        sum_integer := sum_integer - 100;
                    ELSE
                        stare <= procesare_50;
                    END IF;

                WHEN procesare_50 =>
                    IF sum_integer >= 50 AND b50 > 0 THEN
                        b50 := b50 - 1;
                        sum_integer := sum_integer - 50;
                    ELSE
                        stare <= procesare_20;
                    END IF;
                    
                WHEN procesare_20 =>
                    IF sum_integer >= 20 AND b20 > 0 THEN
                        b20 := b20 - 1;
                        sum_integer := sum_integer - 20;
                    ELSE
                        stare <= procesare_10;
                    END IF;

                WHEN procesare_10 =>
                    IF sum_integer >= 10 AND b10 > 0 THEN
                        b10 := b10 - 1;
                        sum_integer := sum_integer - 10;
                    ELSE
                        IF sum_integer > 0 THEN
                            eroare <= '1';
                        ELSE
                            rest500 <= STD_LOGIC_VECTOR(to_unsigned(b500, 4));
                            rest200 <= STD_LOGIC_VECTOR(to_unsigned(b200, 4));
                            rest100 <= STD_LOGIC_VECTOR(to_unsigned(b100, 4));
                            rest50 <= STD_LOGIC_VECTOR(to_unsigned(b50, 4));
                            rest20 <= STD_LOGIC_VECTOR(to_unsigned(b20, 4));
                            rest10 <= STD_LOGIC_VECTOR(to_unsigned(b10, 4));

                            bani500 <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(cashreg500)) - b500, 4));
                            bani200 <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(cashreg200)) - b200, 4));
                            bani100 <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(cashreg100)) - b100, 4));
                            bani50 <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(cashreg50)) - b50, 4));
                            bani20 <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(cashreg20)) - b20, 4));
                            bani10 <= STD_LOGIC_VECTOR(to_unsigned(to_integer(unsigned(cashreg10)) - b10, 4));

                            done <= '1';
                            eroare <= '0';
                        END IF;
                        stare <= idle;
                    END IF;

            END CASE;
        END IF;
    END PROCESS;
END ARCHITECTURE Behavioral;