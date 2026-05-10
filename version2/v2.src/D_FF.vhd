library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is

begin

    process (Clk,Res)                   --  Process will be begin only when Clk or Res signal changes
    begin
        if Res = '1' then
            Q <= '0';                   --  Resets to zero
        elsif (rising_edge(Clk)) then 
            Q <= D;                     --  Load the value of D to Q
        end if; 
    end process;
    
end Behavioral;
