LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY EX_MEM_Buffer IS
	PORT(
		resetBar, load, clock: IN STD_LOGIC;
		ALU: IN STD_LOGIC_VECTOR(7 downto 0);
		Rd: IN STD_LOGIC_VECTOR(4 downto 0);
		data2: IN STD_LOGIC_VECTOR(7 downto 0);
		regDst,jump,branch: IN STD_LOGIC;
		memRead,memToReg,ALUOP1,ALUOP0: IN STD_LOGIC;
		memWrite,ALUSrc, regWrite: IN STD_LOGIC;
		
		ALU_out: OUT STD_LOGIC_VECTOR(7 downto 0);
		Rd_out: OUT STD_LOGIC_VECTOR(4 downto 0);
		data2_out: OUT STD_LOGIC_VECTOR(7 downto 0);
		regDst_out,jump_out,branch_out: OUT STD_LOGIC;
		memRead_out,memToReg_out,ALUOP1_out,ALUOP0_out: OUT STD_LOGIC;
		memWrite_out,ALUSrc_out,regWrite_out: OUT STD_LOGIC
	);
END EX_MEM_Buffer;

ARCHITECTURE struct OF EX_MEM_Buffer IS

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
			inValues(0) => regDst, inValues(1) => jump, inValues(2) => branch, inValues(3) => memRead, inValues(4) => memToReg,
			inValues(5) => ALUOP0, inValues(6) => ALUOP1, inValues(14 downto 7) => ALU, inValues(19 downto 15) => Rd, inValues(27 downto 20) => data2,
			outValues(0) => regDst_out, outValues(1) => jump_out, outValues(2) => branch_out, outValues(3) => memRead_out, outValues(4) => memToReg_out,
			outValues(5) => ALUOP0_out, outValues(6) => ALUOP1_out, outValues(14 downto 7) => ALU_out, outValues(19 downto 15) => Rd_out, outValues(27 downto 20) => data2_out
		);
		

END struct;