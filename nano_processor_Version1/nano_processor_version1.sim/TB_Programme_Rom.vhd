library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_ROM is
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

-- Stimulus process
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
