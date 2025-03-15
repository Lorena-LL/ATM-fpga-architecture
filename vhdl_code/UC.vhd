
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY UC IS
  PORT (
  		----intrari:
  		--butane/switchuri
  		CLOCK, RESET: in std_logic;
  		OK: in std_logic;
  		SW1, SW0: in std_logic;
		
  		--semnale interne
  		PIN_OK: in std_logic;
  		ENOUGH_ACC: in std_logic;
  		ENOUGH_BANK: in std_logic;
  		ERR_DISTR: in std_logic;
  		DONE_DISTR: in std_logic;


  		----iesiri:
  		--semnale interne
  		WE2: out std_logic;
  		SEL_PIN: out std_logic;
  		SEL_SSD: out std_logic_vector(1 downto 0);		--nu cred ca e nevoie de initializare
  		SEL_VAL16: out std_logic_vector(1 downto 0);		--nu cred ca e nevoie de initializare
  		EN_DISTR:out std_logic;
  		OP_AD_SC: out std_logic;						--nu cred ca e nevoie de initializare
  		EN_AD_SC: out std_logic;
  		WE16: out std_logic;
  		SEL_W_IN: out std_logic;						--nu cred ca e nevoie de initializare
  		WE_BANK:out std_logic;
  		CLR_NR: out std_logic;
  		EN_NR2: out std_logic;
  		

		--leduri
		ERROR:out std_logic;
		insertPIN: out std_logic;
		selectOP: out std_logic;
		OP_FIN: out std_logic;
		insertSUM: out std_logic;
		insertBILLS: out std_logic;
		interogare: out std_logic;
		retragere: out std_logic;
		depunere: out std_logic;
		transfer: out std_logic;
		calculating: out std_logic
    );
END UC;





ARCHITECTURE arhitectura_1 OF UC IS
	type STARE_T is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9, ST10, ST11, ST12, ST13, ST14, ST15, ST16, ST17, ST18, ST19, ST20, ST21, ST22, ST23, ST24);
	signal STARE, NXSTARE: STARE_T;
BEGIN
	ACTUALIZEAZA_STARE: process (RESET, CLOCK) 
	begin
		 if (RESET = '1') then
		 STARE <= ST0; 
		 elsif CLOCK'event and CLOCK = '1' then
		 STARE <= NXSTARE; 
		 end if; 
	end process ACTUALIZEAZA_STARE;

	TRANSITIONS: process (STARE,ok, SW1, SW0, PIN_OK, ENOUGH_ACC,ENOUGH_BANK, ERR_DISTR, DONE_DISTR) 
	begin
		 -- SEMNALE INTERNE
		WE2 <= '0';
		SEL_PIN <= '0';
		EN_DISTR <= '0';
		EN_AD_SC <= '0';
		WE16 <= '0';
		WE_BANK <= '0';
		CLR_NR <= '0';
		EN_NR2 <= '0';
		
		

		--LEDURI
		ERROR <= '0';
		insertPIN <= '0';
		selectOP <='0';
		OP_FIN <= '0';
		insertSUM <= '0';
		insertBILLS <= '0';
		interogare <= '0';
		retragere <= '0';
		depunere <= '0';
		transfer <= '0';
		calculating <= '0';
		
		case STARE is
		 	when ST0 =>
		 		insertPIN <= '1';
		 		SEL_SSD<="00";
		 		if OK = '1' then NXSTARE <= ST1;
		 		else NXSTARE <= ST0;
		 		end if;
				
			 when ST1 => 
			 	if PIN_OK = '1' then 
			 		SEL_PIN <= '0';
			 		WE2 <= '1';		--scriu in registrul in care tin nuamrul registrului in care e pinul de care ne folosim
			 		NXSTARE <= ST2;
			 	else 
			 		ERROR <= '1';
			 		NXSTARE <= ST0;
			 	end if;
			 	
		 	when ST2 =>
		 		selectOP <= '1';
		 		if OK = '1' then 
		 			if SW1 = '0' and SW0 = '0' then 
		 				NXSTARE <= ST3;
		 			elsif SW1 = '0' and SW0 = '1' then 
		 				NXSTARE <= ST4;
		 			elsif SW1 = '1' and SW0 = '0' then 
		 				NXSTARE <= ST11;
		 			elsif SW1 = '1' and SW0 = '1' then 
		 				NXSTARE <= ST16;
		 			end if;

		 		else NXSTARE <= ST2;
		 		end if;

----------incepe INTEROGARE
		 	when ST3 =>				
		 		interogare <= '1';
		 		CLR_NR <= '1';
		 		SEL_PIN <= '0';
		 		SEL_SSD<="01";
		 		OP_FIN <= '1';
		 		if OK = '1' then 
		 			SEL_SSD <= "11";
		 			NXSTARE <= ST2;
		 		else NXSTARE <= ST3;
		 		end if;
-----------se termina INTEROGARE

----------incepe RETRAGERE
		 	when ST4 => 
		 		retragere <= '1';
		 		CLR_NR <= '1';
		 		insertSUM<= '1';
		 		SEL_SSD <= "00";
		 		NXSTARE <= ST5;

		 	when ST5 => 
		 		retragere <= '1';
		 		insertSUM<= '1';
		 		SEL_SSD <= "00";
		 		if ok = '1' then 
		 			NXSTARE <= ST6;
		 		else
		 			NXSTARE <= ST5;
		 		end if;

		 	when ST6 =>
		 		retragere <= '1';
		 		SEL_PIN <='0';
		 		SEL_VAL16 <="00";
		 		if ENOUGH_ACC = '1' and ENOUGH_BANK = '1' then
		 			EN_DISTR <= '1';
		 			NXSTARE <= ST7;
		 		else 
		 			ERROR <= '1';
		 			NXSTARE <= ST4;
		 		end if;	

		 	when ST7 =>
		 		retragere <= '1';
		 		if ERR_DISTR = '1' then 
		 			ERROR <= '1';
		 			NXSTARE <= ST4;
		 		else 
		 			if DONE_DISTR = '1' then 
		 				NXSTARE <= ST8;
		 			else 
		 				calculating <= '1';
		 				NXSTARE <= ST7;
		 			end if;
		 		end if;

		 	when ST8 => 
		 		retragere <= '1';
		 		SEL_PIN <= '0';
		 		SEL_VAL16 <= "00";
		 		OP_AD_SC <= '0';
		 		EN_AD_SC <= '1';
		 		WE16 <= '1';
		 		NXSTARE <= ST9;

		 	when ST9 =>
		 		retragere <= '1';
		 		SEL_W_IN <= '0';
		 		WE_BANK <= '1';
		 		NXSTARE <= ST10;

		 	when ST10 =>
		 		retragere <= '1';
		 		CLR_NR <= '1';
		 		SEL_SSD <= "10";
		 		OP_FIN <= '1';
		 		if ok = '1' then 
		 			SEL_SSD <= "11";
		 			NXSTARE <= ST2;
		 		else 
		 			NXSTARE <= ST10;
		 		end if;
-----------se termina RETRAGERE

----------incepe DEPUNERE
			when ST11 => 
				depunere <= '1';
				CLR_NR <= '1';
				SEL_SSD <= "00";
				insertBILLS <= '1';
				EN_NR2 <= '1';
				NXSTARE <= ST12;

			when ST12 => 
				depunere <= '1';
		 		SEL_SSD <= "00";
		 		insertBILLS <= '1';
				EN_NR2 <= '1';
				if ok = '1' then 
					SEL_SSD <= "11";
					NXSTARE <= ST13;
				else 
					NXSTARE <= ST12;
				end if;

			when ST13 =>
				depunere <= '1';
				SEL_PIN <= '0';
				SEL_VAL16 <= "01";
				OP_AD_SC <= '1';
				EN_AD_SC <= '1';
				WE16 <= '1';
				NXSTARE <= ST14;

			when ST14 => 
				depunere <= '1';
				SEL_W_IN <= '1';
				WE_BANK <= '1';
				NXSTARE <= ST15;

			when ST15 => 
				depunere <= '1';
				OP_FIN <= '1';
				if ok = '1' then 
					NXSTARE <= ST2;
				else 
					NXSTARE <= ST15;
				end if;
-----------se termina DEPUNERE

----------incepe TRANSFER
			when ST16 => 
				transfer <= '1';
				insertPIN <= '1';
				CLR_NR <= '1';
				SEL_SSD <= "00";
				NXSTARE <= ST17;

			when ST17 =>
				transfer <= '1';
				insertPIN <= '1';
				SEL_SSD <= "00";
				if ok = '1' then 
					NXSTARE <= ST18;
				else 
					NXSTARE <= ST17;
				end if;

			when ST18 => 
				transfer <= '1';
				if PIN_OK = '1' then
					SEL_PIN <= '1';
					WE2 <= '1';
					NXSTARE <= ST19;
				else 
					ERROR <= '1';
					NXSTARE <= ST16;
				end if;

			when ST19 =>
				transfer <= '1';
				CLR_NR <= '1';
				SEL_SSD <= "00";
				insertSUM <= '1';
				NXSTARE <= ST20;

			when ST20 => 
				transfer <= '1';
				SEL_SSD <= "00";
				insertSUM <= '1';
				if ok = '1' then 
					NXSTARE <= ST21;
				else 
					NXSTARE <= ST20;
				end if;

			when ST21 => 
				transfer <= '1';
				SEL_PIN <= '0';
				SEL_VAL16 <= "10";
				if ENOUGH_ACC = '1' then 
					NXSTARE <= ST22;
				else 
					ERROR <= '1';
					NXSTARE <= ST20;
				end if;
				
			when ST22 => 
				transfer <= '1';
				SEL_PIN <= '0';
				SEL_VAL16 <= "10";
				OP_AD_SC <= '0';
				EN_AD_SC <= '1';
				WE16 <= '1';
				NXSTARE <= ST23;

			when ST23 => 
				transfer <= '1';
				SEL_PIN <= '1';
				SEL_VAL16 <= "10";
				OP_AD_SC <= '1';
				EN_AD_SC <= '1';
				WE16 <= '1';
				NXSTARE <= ST24;

			when ST24 =>
				transfer <= '1';
				OP_FIN <= '1';
				if ok = '1' then 
					SEL_SSD <= "11";
					NXSTARE <= ST2;
				else 
					NXSTARE <= ST24;
				end if;
-----------se termina TRANSFER
		 		
		end case; 
	end process TRANSITIONS; 
END arhitectura_1;