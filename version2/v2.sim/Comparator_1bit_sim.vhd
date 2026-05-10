----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 04:23:30 PM
-- Design Name: 
-- Module Name: Comparator_1bit_sim - Behavioral
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

entity Comparator_1bit_sim is
--  Port ( );
end Comparator_1bit_sim;

architecture Behavioral of Comparator_1bit_sim is
    component Comparator_1bit
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Enable : in STD_LOGIC;
            IsEqual : out STD_LOGIC;
            IsGreater : out STD_LOGIC;
            IsLess : out STD_LOGIC
        );
    end component;

    signal A, B, Enable : std_logic := '0';
    signal IsEqual, IsGreater, IsLess : std_logic;

begin

    DUT: Comparator_1bit
        port map (
            A => A,
            B => B,
            Enable => Enable,
            IsEqual => IsEqual,
            IsGreater => IsGreater,
            IsLess => IsLess
        );

    process
    begin
        -- Enable OFF: All outputs should be 0
        Enable <= '0';
        A <= '0'; B <= '0'; wait for 100 ns;
        A <= '0'; B <= '1'; wait for 100 ns;
        A <= '1'; B <= '0'; wait for 100 ns;
        A <= '1'; B <= '1'; wait for 100 ns;

        -- Enable ON: Check all combinations
        Enable <= '1';
        A <= '0'; B <= '0'; wait for 100 ns; -- Equal
        A <= '0'; B <= '1'; wait for 100 ns; -- Less
        A <= '1'; B <= '0'; wait for 100 ns; -- Greater
        A <= '1'; B <= '1'; wait for 100 ns; -- Equal

        -- Hold simulation
        wait;
    end process;

end Behavioral;
