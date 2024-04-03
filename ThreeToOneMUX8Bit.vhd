LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ThreeToOneMUX8Bit IS
	PORT(
		a,b,c: IN STD_LOGIC_VECTOR (7 downto 0);
		sel: IN STD_LOGIC_VECTOR(1 downto 0);
		MuxOut: OUT STD_LOGIC_VECTOR (7 downto 0)
		);
END ThreeToOneMUX8Bit;		

ARCHITECTURE struct OF ThreeToOneMUX8Bit IS
SIGNAL O_Mux: STD_LOGIC_VECTOR (7 downto 0);

	COMPONENT threeToOneMUX IS
		PORT(	inA: IN STD_LOGIC;
				inB: IN STD_LOGIC;
				inC: IN STD_LOGIC;
				sel: IN STD_LOGIC_VECTOR(1 downto 0);
				outX: OUT STD_LOGIC
		);
	END COMPONENT;
		
BEGIN
		
		Mux0: threeToOneMUX
			PORT MAP (
			inA => a(0),
			inB => b(0),
			inC => c(0),
			sel => sel,
			outX => O_Mux(0)
			);
		
		Mux1: threeToOneMUX
			PORT MAP (
			inA => a(1),
			inB => b(1),
			inC => c(1),
			sel => sel,
			outX => O_Mux(1)
			);
		
		Mux2: threeToOneMUX
			PORT MAP (
			inA => a(2),
			inB => b(2),
			inC => c(2),
			sel => sel,
			outX => O_Mux(2)
			);
		
		Mux3: threeToOneMUX
			PORT MAP (
			inA => a(3),
			inB => b(3),
			inC => c(3),
			sel => sel,
			outX => O_Mux(3)
			);
		
		Mux4: threeToOneMUX
			PORT MAP (
			inA => a(4),
			inB => b(4),
			inC => c(4),
			sel => sel,
			outX => O_Mux(4)
			);
		
		Mux5: threeToOneMUX
			PORT MAP (
			inA => a(5),
			inB => b(5),
			inC => c(5),
			sel => sel,
			outX => O_Mux(5)
			);
		
		Mux6: threeToOneMUX
			PORT MAP (
			inA => a(6),
			inB => b(6),
			inC => c(6),
			sel => sel,
			outX => O_Mux(6)
			);
		
		Mux7: threeToOneMUX
			PORT MAP (
			inA => a(7),
			inB => b(7),
			inC => c(7),
			sel => sel,
			outX => O_Mux(7)
			);
		
		MuxOut <= O_Mux;
END struct;