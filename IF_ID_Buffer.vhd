LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY IF_ID_Buffer IS
	PORT(
		resetBar, load, clock: IN STD_LOGIC;
		IM: IN STD_LOGIC_VECTOR(31 downto 0);
		PC_4: IN STD_LOGIC_VECTOR(31 downto 0);
		
		IM_out: OUT STD_LOGIC_VECTOR(31 downto 0);
		PC_4_out: OUT STD_LOGIC_VECTOR(31 downto 0)
		
	);
END IF_ID_Buffer;

ARCHITECTURE struct OF IF_ID_Buffer IS

	COMPONENT register32Bit IS
		PORT(	resetBar, load, clock: IN STD_LOGIC;
				inValues: IN STD_LOGIC_VECTOR(31 downto 0);
				outValues: OUT STD_LOGIC_VECTOR(31 downto 0)
		);
	END COMPONENT;

BEGIN

	reg1: register32Bit
		PORT Map(
			resetBar => resetBar, load => load, clock => clock,
			inValues => IM,
			outValues => IM_out
		);
	
	reg2: register32Bit
		PORT Map(
			resetBar => resetBar, load => load, clock => clock,
			inValues => PC_4,
			outValues => PC_4_out
		);
	
END struct;