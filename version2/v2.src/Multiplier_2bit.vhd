library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier_2bit is
    Port ( A4 : in STD_LOGIC_VECTOR (3 downto 0);
           B4 : in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2bit;

architecture Behavioral of Multiplier_2bit is
    signal pp0, pp1, pp2, pp3 : std_logic;
    signal sum1, carry1, sum2, carry2 : std_logic;
    signal A, B : STD_LOGIC_VECTOR (1 DOWNTO 0);
    signal tempY : std_logic_vector(3 downto 0);

begin
    -- Only use 2 LSBs
    A <= A4(1 DOWNTO 0);
    B <= B4(1 DOWNTO 0);

    -- Partial products
    pp0 <= A(0) and B(0);
    pp1 <= A(1) and B(0);
    pp2 <= A(0) and B(1);
    pp3 <= A(1) and B(1);

    sum1   <= pp1 xor pp2;
    carry1 <= pp1 and pp2;

    sum2   <= pp3 xor carry1;
    carry2 <= pp3 and carry1;

    tempY(0) <= pp0;
    tempY(1) <= sum1;
    tempY(2) <= sum2;
    tempY(3) <= carry2;

    process(tempY, Enable)
    begin
        if Enable = '1' then
            Y <= tempY;
        else
            Y <= (others => '0');
        end if;
    end process;
    
end Behavioral;
