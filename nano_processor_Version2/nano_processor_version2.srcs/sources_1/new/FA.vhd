library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is

    COMPONENT HA PORT
        ( A, B: IN STD_LOGIC;
          S, C: OUT STD_LOGIC );
    END COMPONENT;
    
SIGNAL HA0_S, HA0_C, HA1_S, HA1_C: STD_LOGIC;

begin

    HA0: HA PORT MAP
        ( A => A,
          B => B,
          S => HA0_S,
          C => HA0_C );
          
    HA1: HA PORT MAP
        ( A => HA0_S,
          B => C_in,
          S => HA1_S,
          C => HA1_C );
          
    S <= HA1_S;
    C_out <= HA0_C OR HA1_C;
          
end Behavioral;
