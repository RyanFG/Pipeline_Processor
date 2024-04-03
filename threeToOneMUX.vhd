LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY threeToOneMUX IS
	PORT(	inA: IN STD_LOGIC;
			inB: IN STD_LOGIC;
			inC: IN STD_LOGIC;
			sel: IN STD_LOGIC_VECTOR(1 downto 0);
			outX: OUT STD_LOGIC
	);
END threeToOneMUX;

ARCHITECTURE struct OF threeToOneMUX IS
SIGNAL a1,a2,a3: STD_LOGIC;

BEGIN

	a1 <= inA and ((not(sel(0)))and(not(sel(1))));
	a2 <= inB and ((not(sel(0)))and((sel(1))));
	a3 <= inC and (((sel(0)))and(not(sel(1))));
	
	outX <= a1 or a2 or a3;
	
END struct;