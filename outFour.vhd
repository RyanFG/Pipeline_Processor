LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY outFour IS
	PORT(	
			out4: OUT STD_LOGIC_VECTOR(31 downto 0)
	);
END outFour;

ARCHITECTURE struct OF outFour IS



BEGIN

	out4 <= "00000000000000000000000000000100";

END struct; 
