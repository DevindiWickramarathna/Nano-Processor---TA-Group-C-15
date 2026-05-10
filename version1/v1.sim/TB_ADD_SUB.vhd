----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 03:41:20 PM
-- Design Name: 
-- Module Name: TB_ADD_SUB - Behavioral
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

entity TB_ADD_SUB is
--  Port ( );
end TB_ADD_SUB;

architecture Behavioral of TB_ADD_SUB is
component ADD_SUB_4bit
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Operation : in STD_LOGIC;
               C_out : out STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Overflow : out STD_LOGIC;
               Zero : out STD_LOGIC);
    end component;

    -- Inputs
    signal A : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Operation : STD_LOGIC := '0';

    -- Outputs
    signal C_out : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR(3 downto 0);
    signal Overflow : STD_LOGIC;
    signal Zero : STD_LOGIC;

begin

    UUT: ADD_SUB_4bit port map (
        A => A,
        B => B,
        Operation => Operation,
        C_out => C_out,
        S => S,
        Overflow => Overflow,
        Zero => Zero
    );

    stim_proc: process
    begin
        -- ---- ADDITION TESTS (Operation = '0') ----
        Operation <= '0';
        
        -- 2 + 3 = 5
        A <= "0010"; B <= "0011"; 
        wait for 20 ns;
        
        -- 7 + 1 = 8 (Signed Overflow Expected: Positive + Positive = Negative)
        A <= "0111"; B <= "0001"; 
        wait for 20 ns;

        -- ---- SUBTRACTION TESTS (Operation = '1') ----
        Operation <= '1';
        
        -- 5 - 2 = 3
        A <= "0101"; B <= "0010"; 
        wait for 20 ns;
        
        -- 4 - 4 = 0 (Zero Flag Expected)
        A <= "0100"; B <= "0100"; 
        wait for 20 ns;
        
        -- -4 - 5 = -9 (Signed Overflow Expected)
        A <= "1100"; B <= "0101"; 
        wait for 20 ns;

        wait; 
    end process;

end Behavioral;


