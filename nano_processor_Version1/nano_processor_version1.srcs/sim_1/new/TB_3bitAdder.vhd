----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 10:55:36 AM
-- Design Name: 
-- Module Name: TB_3bitAdder - Behavioral
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

entity TB_3bitAdder is
-- Testbench entities are always empty
end TB_3bitAdder;

architecture Behavioral of tb_3bitAdder is

    -- Component Declaration for the Unit Under Test (UUT)
    component Adder_3bit
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC);
    end component;

    -- Inputs
    signal A : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');

    -- Outputs
    signal S : STD_LOGIC_VECTOR(2 downto 0);
    signal C_out : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    UUT: Adder_3bit port map (
        A => A,
        S => S,
        C_out => C_out
    );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: 0 + 1 = 1
        A <= "000"; 
        wait for 20 ns;
        
        -- Test case 2: 3 + 1 = 4
        A <= "011"; 
        wait for 20 ns;
        
        -- Test case 3: 6 + 1 = 7
        A <= "110"; 
        wait for 20 ns;
        
        -- Test case 4: 7 + 1 = 0 (Expected C_out = '1')
        A <= "111"; 
        wait for 20 ns;

        wait; -- Suspend simulation
    end process;

end Behavioral;
