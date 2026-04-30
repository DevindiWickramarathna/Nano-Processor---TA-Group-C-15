library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity PC_3_bit is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end PC_3_bit;

architecture Behavioral of PC_3_bit is
    component D_FF is
        Port ( D : in STD_LOGIC;
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

signal Res_Sig : STD_LOGIC := '1';

begin

    DFF_0 : D_FF
        PORT MAP (D => D(0), Q => Q(0), Clk => Clk, Res => Res_Sig);

    DFF_1 : D_FF
        PORT MAP (D => D(1), Q => Q(1), Clk => Clk, Res => Res_Sig);

    DFF_2 : D_FF
        PORT MAP (D => D(2), Q => Q(2), Clk => Clk, Res => Res_Sig);

    Res_Sig <= Res;

end Behavioral;
