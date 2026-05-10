----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2026 12:30:56 AM
-- Design Name: 
-- Module Name: TB_InstructionDecorder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TB_InstructionDecorder is
--  Port ( );
end TB_InstructionDecorder;

architecture Behavioral of TB_InstructionDecorder is

    component Instruction_Decoder
    Port (
        I              : in STD_LOGIC_VECTOR (11 downto 0);
        Reg_Check_Jump : in STD_LOGIC_VECTOR (3 downto 0);
        Load_Select    : out STD_LOGIC;
        Imm_Value      : out STD_LOGIC_VECTOR (3 downto 0);
        Reg_Enable     : out STD_LOGIC_VECTOR (2 downto 0);
        Reg_Select_1   : out STD_LOGIC_VECTOR (2 downto 0);
        Reg_Select_2   : out STD_LOGIC_VECTOR (2 downto 0);
        Add_Sub        : out STD_LOGIC;
        Jump_Flag      : out STD_LOGIC;
        Address        : out STD_LOGIC_VECTOR (2 downto 0)
    );
    end component;

    signal I              : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
    signal Reg_Check_Jump : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');

    signal Load_Select  : STD_LOGIC;
    signal Imm_Value    : STD_LOGIC_VECTOR(3 downto 0);
    signal Reg_Enable   : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_Select_1 : STD_LOGIC_VECTOR(2 downto 0);
    signal Reg_Select_2 : STD_LOGIC_VECTOR(2 downto 0);
    signal Add_Sub      : STD_LOGIC;
    signal Jump_Flag    : STD_LOGIC;
    signal Address      : STD_LOGIC_VECTOR(2 downto 0);

begin

    uut: Instruction_Decoder PORT MAP (
        I => I,
        Reg_Check_Jump => Reg_Check_Jump,
        Load_Select => Load_Select,
        Imm_Value => Imm_Value,
        Reg_Enable => Reg_Enable,
        Reg_Select_1 => Reg_Select_1,
        Reg_Select_2 => Reg_Select_2,
        Add_Sub => Add_Sub,
        Jump_Flag => Jump_Flag,
        Address => Address
    );

    stim_proc: process
    begin        
        wait for 10 ns;

        I <= "000010100000"; 
        Reg_Check_Jump <= "0000";
        wait for 20 ns;

        I <= "010110000000";
        wait for 20 ns;

        I <= "101100001010";
        wait for 20 ns;

        I <= "111110000101";
        
        Reg_Check_Jump <= "1111"; 
        wait for 20 ns;

        Reg_Check_Jump <= "0000"; 
        wait for 20 ns;

        wait;
    end process;

end Behavioral;

