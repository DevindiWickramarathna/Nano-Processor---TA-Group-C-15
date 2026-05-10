----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 03:46:19 PM
-- Design Name: 
-- Module Name: sim_ROM - Behavioral
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

entity sim_ROM is
--  Port ( );
end sim_ROM;

architecture Behavioral of sim_ROM is

-- Testbench signals
signal Memory_Sel_tb : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal Instruction_bus_tb : STD_LOGIC_VECTOR(11 downto 0);


begin


-- Direct entity instantiation (recommended)
UUT: entity work.Program_ROM
    port map (
        address => Memory_Sel_tb,
        instruction_code => Instruction_bus_tb
    );

-- 240107B---011 101 010 101 111 011
process
begin 
    Memory_Sel_tb <= "000";
    wait for 100 ns;

    Memory_Sel_tb <= "001";
    wait for 100 ns;

    Memory_Sel_tb <= "010";
    wait for 100 ns;

    Memory_Sel_tb <= "011";
    wait for 100 ns;

    Memory_Sel_tb <= "100";
    wait for 100 ns;

    Memory_Sel_tb <= "101";
    wait for 100 ns;

    Memory_Sel_tb <= "110";
    wait for 100 ns;

    Memory_Sel_tb <= "111";
    wait for 100 ns;

    wait;
end process;

end Behavioral;