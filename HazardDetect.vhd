library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity HazardDetect is
    port(
        IF_ID_RS : IN STD_LOGIC_VECTOR(4 downto 0);
        IF_ID_RT : IN STD_LOGIC_VECTOR(4 downto 0);
        ID_EX_RT : IN STD_LOGIC_VECTOR(4 downto 0);
        ID_EX_MEMREAD : IN STD_LOGIC;
        MEM_WB_RegWrite : IN STD_LOGIC;
        Stall : OUT STD_LOGIC;
        IF_ID_Write : OUT STD_LOGIC;
        PC_Write : OUT STD_LOGIC
    );
end HazardDetect;

architecture rtl of HazardDetect is
    Signal EXRT_EQ_IDRS, EXRT_EQ_IDRT, CompSig, StallSig : STD_LOGIC;
    
    
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
        x(4 downto 0) => ID_EX_RT,
        y(4 downto 0) => IF_ID_RS,
        eq => EXRT_EQ_IDRS
    );
    RDARTComp : eightBitComparator
    port map(
        x(4 downto 0) => ID_EX_RT,
        y(4 downto 0) => IF_ID_RT,
        eq => EXRT_EQ_IDRT
    );
    
    CompSig <= EXRT_EQ_IDRS or EXRT_EQ_IDRT;
    
    StallSig <= CompSig and ID_EX_MEMREAD;
    
    Stall <= StallSig;
    
    IF_ID_Write <= not StallSig;
    
    PC_Write <= not StallSig;


end architecture rtl;