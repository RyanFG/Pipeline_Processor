library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Forwarding_Unit is
    port(
        Ex_MEM_RD : IN STD_LOGIC_VECTOR(4 downto 0);
        MEM_WB_RD : IN STD_LOGIC_VECTOR(4 downto 0);
        ID_EX_RS : IN STD_LOGIC_VECTOR(4 downto 0);
        ID_EX_RT : IN STD_LOGIC_VECTOR(4 downto 0);
        EX_MEM_RegWrite : IN STD_LOGIC;
        MEM_WB_RegWrite : IN STD_LOGIC;
        ForwardA : OUT STD_LOGIC_VECTOR (1 downto 0);
        ForwardB : OUT STD_LOGIC_VECTOR (1 downto 0)
    );
end Forwarding_Unit;

architecture rtl of Forwarding_Unit is
    Signal RDA_EQ_RS, RDB_EQ_RS, RDA_EQ_RT, RDB_EQ_RT, RDA_GZ, RDB_GZ : STD_LOGIC;
    
    
    component eightBitComparator
        port (
            x,y : IN STD_LOGIC_VECTOR (7 Downto 0);
            eq : OUT STD_LOGIC;
            xGreaterZero : OUT STD_LOGIC;
            yGreaterZero : OUT STD_LOGIC;
            bitX7Eq1 : OUT STD_LOGIC;
            bitY7Eq1 : OUT STD_LOGIC;
            xEqZero : OUT STD_LOGIC;
            yEqZero : OUT STD_LOGIC;
            xGZ_US8Bit, yGZ_US8Bit : OUT STD_LOGIC;
            xEqZero_8Bit : OUT STD_LOGIC;
            yEqZero_8Bit : OUT STD_LOGIC
    );
    end component;
    
    
begin
    
    RDARSComp : eightBitComparator
    port map(
        x(4 downto 0) => Ex_MEM_RD,
        y(4 downto 0) => ID_EX_RS,
        eq => RDA_EQ_RS
    );
    RDARTComp : eightBitComparator
    port map(
        x(4 downto 0) => Ex_MEM_RD,
        y(4 downto 0) => ID_EX_RT,
        eq => RDA_EQ_RT
    );
    RDBRSComp : eightBitComparator
    port map(
        x(4 downto 0) => MEM_WB_RD,
        y(4 downto 0) => ID_EX_RS,
        eq => RDB_EQ_RS
    );
    RDBRTComp : eightBitComparator
    port map(
        x(4 downto 0) => MEM_WB_RD,
        y(4 downto 0) => ID_EX_RT,
        eq => RDB_EQ_RT
    );
    
    RDBRComp : eightBitComparator
    port map(
        x(4 downto 0) => Ex_MEM_RD,
        y(4 downto 0) => MEM_WB_RD,
        xGreaterZero => RDA_GZ,
        yGreaterZero => RDB_GZ
    );
    
    
    ForwardA (0) <= RDA_EQ_RS and RDA_GZ and EX_MEM_RegWrite;
    ForwardA (1) <= RDA_GZ and RDA_EQ_RT and EX_MEM_RegWrite;
    ForwardB (0) <= RDB_GZ and RDB_EQ_RT and MEM_WB_RegWrite;
    ForwardB (1) <= RDA_EQ_RS and RDB_GZ and MEM_WB_RegWrite;
    


end architecture rtl;