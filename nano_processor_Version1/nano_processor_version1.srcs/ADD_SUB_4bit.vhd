library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ADD_SUB_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);       -- A and B 4 bit inputs
           Operation : in STD_LOGIC;                   -- ADD - '0' and SUB - '1'
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);      -- S 4 bit output
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);                      -- '1', if the total result is zero
end ADD_SUB_4bit;

architecture Behavioral of ADD_SUB_4bit is

component RCA_4
   PORT(A : in STD_LOGIC_VECTOR(3 downto 0);
        B : in STD_LOGIC_VECTOR(3 downto 0);
        C_in : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR(3 downto 0);
        C_out : out STD_LOGIC);
end component;

SIGNAL Y,X : STD_lOGIC_VECTOR(3 downto 0);
begin
X(0) <= B(0) XOR Operation;
X(1) <= B(1) XOR Operation;
X(2) <= B(2) XOR Operation;
X(3) <= B(3) XOR Operation;

RCA0 : RCA_4
     port map(
     A => A,
     B => X,
     C_in => Operation,
     S => Y,
     C_out => C_out);
     
S <= Y;
Overflow <= (A(3) XNOR (Operation XOR B(3))) AND (A(3) XOR Y(3));
Zero <= NOT(Y(0) OR Y(1) OR Y(2) OR Y(3));
end Behavioral;
