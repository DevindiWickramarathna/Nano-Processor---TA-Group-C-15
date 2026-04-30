----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 10:59:12 AM
-- Design Name: 
-- Module Name: TB_PC_3bit - Behavioral
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

entity tb_PC_3_bit is
end tb_PC_3_bit;

architecture Behavioral of tb_PC_3_bit is

    component PC_3_bit
        Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
               Res : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

    -- Inputs
    signal D : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal Res : STD_LOGIC := '0';
    signal Clk : STD_LOGIC := '0';

    -- Outputs
    signal Q : STD_LOGIC_VECTOR(2 downto 0);

    -- Clock period definition
    constant Clk_period : time := 10 ns;

begin

    UUT: PC_3_bit port map (
        D => D,
        Res => Res,
        Clk => Clk,
        Q => Q
    );

    -- Clock process definitions
    clk_process :process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset state for 2 clock cycles
        Res <= '1';
        wait for Clk_period * 2;
        Res <= '0';

        -- Load value 1
        D <= "001";
        wait for Clk_period;
        
        -- Load value 3
        D <= "011";
        wait for Clk_period;

        -- Load value 7
        D <= "111";
        wait for Clk_period;

        -- Assert Reset while running
        Res <= '1';
        D <= "101"; -- D changes, but Q should remain 000 due to Reset
        wait for Clk_period;
        
        -- De-assert Reset
        Res <= '0';
        wait for Clk_period;

        wait;
    end process;

end Behavioral;
