LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ID_EX_Buffer IS
	PORT(
		resetBar, load, clock: IN STD_LOGIC;
		funct: IN STD_LOGIC_VECTOR(5 downto 0);
		data1,data2: IN STD_LOGIC_VECTOR(7 downto 0);
		Rs,Rt,Rd: IN STD_LOGIC_VECTOR(4 downto 0);
		regDst,jump,branch: IN STD_LOGIC;
		memRead,memToReg,ALUOP1,ALUOP0: IN STD_LOGIC;
		memWrite,ALUSrc, regWrite: IN STD_LOGIC;
		
		Rs_out,Rt_out,Rd_out: OUT STD_LOGIC_VECTOR(4 downto 0);
		data1_out,data2_out: OUT STD_LOGIC_VECTOR(7 downto 0);
		regDst_out,jump_out,branch_out: OUT STD_LOGIC;
		memRead_out,memToReg_out,ALUOP1_out,ALUOP0_out: OUT STD_LOGIC;
		memWrite_out,ALUSrc_out,regWrite_out: OUT STD_LOGIC;
		funct_out: OUT STD_LOGIC_VECTOR(5 downto 0)
		
	);
END ID_EX_Buffer;

ARCHITECTURE struct OF ID_EX_Buffer IS

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
			inValues(5 downto 0) => funct,
			outValues(5 downto 0) => funct_out
		);
	
	reg2: register32Bit
		PORT Map(
			resetBar => resetBar, load => load, clock => clock,
			inValues(7 downto 0) => data1, inValues(15 downto 8) => data2, inValues(20 downto 16) => Rs, inValues(25 downto 21) => Rt, inValues(30 downto 26) => Rd,
			outValues(7 downto 0) => data1_out, outValues(15 downto 8) => data2_out, outValues(20 downto 16) => Rs_out, outValues(25 downto 21) => Rt_out, outValues(30 downto 26) => Rd_out
		);
		
	reg3: register32Bit
		PORT Map(
			resetBar => resetBar, load => load, clock => clock,
			inValues(0) => regDst, inValues(1) => jump, inValues(2) => branch, inValues(3) => memRead, inValues(4) => memToReg,
			inValues(5) => ALUOP0, inValues(6) => ALUOP1,
			outValues(0) => regDst_out, outValues(1) => jump_out, outValues(2) => branch_out, outValues(3) => memRead_out, outValues(4) => memToReg_out,
			outValues(5) => ALUOP0_out, outValues(6) => ALUOP1_out
		);
	
END struct;