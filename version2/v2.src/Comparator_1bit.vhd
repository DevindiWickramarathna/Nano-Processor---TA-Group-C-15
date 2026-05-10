library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Enable : in STD_LOGIC;
           IsEqual : out STD_LOGIC;
           IsGreater : out STD_LOGIC;
           IsLess : out STD_LOGIC );
end Comparator_1bit;

architecture Behavioral of Comparator_1bit is
begin
    IsEqual   <= Enable AND (A XNOR B);
    IsGreater <= Enable AND (A AND NOT B);
    IsLess    <= Enable AND (B AND NOT A);
end Behavioral;