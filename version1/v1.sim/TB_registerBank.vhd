----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2026 12:10:40 AM
-- Design Name: 
-- Module Name: TB_registerBank - Behavioral
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

entity TB_registerBank is
--  Port ( );
end TB_registerBank;

architecture Behavioral of TB_registerBank is
component Register_Bank
    Port ( 
        Clk   : in STD_LOGIC;
        Reset : in STD_LOGIC;
        D     : in STD_LOGIC_VECTOR (3 downto 0);
        R0    : out STD_LOGIC_VECTOR (3 downto 0);
        R1    : out STD_LOGIC_VECTOR (3 downto 0);
        R2    : out STD_LOGIC_VECTOR (3 downto 0);
        R3    : out STD_LOGIC_VECTOR (3 downto 0);
        R4    : out STD_LOGIC_VECTOR (3 downto 0);
        R5    : out STD_LOGIC_VECTOR (3 downto 0);
        R6    : out STD_LOGIC_VECTOR (3 downto 0);
        R7    : out STD_LOGIC_VECTOR (3 downto 0);
        I     : in STD_LOGIC_VECTOR (2 downto 0)
    );
    end component;

    -- 2. Declare internal signals to connect to the UUT
    -- Inputs (initialized to zero)
    signal Clk   : std_logic := '0';
    signal Reset : std_logic := '0';
    signal D     : std_logic_vector(3 downto 0) := (others => '0');
    signal I     : std_logic_vector(2 downto 0) := (others => '0');

    -- Outputs
    signal R0 : std_logic_vector(3 downto 0);
    signal R1 : std_logic_vector(3 downto 0);
    signal R2 : std_logic_vector(3 downto 0);
    signal R3 : std_logic_vector(3 downto 0);
    signal R4 : std_logic_vector(3 downto 0);
    signal R5 : std_logic_vector(3 downto 0);
    signal R6 : std_logic_vector(3 downto 0);
    signal R7 : std_logic_vector(3 downto 0);

    -- Define the Clock period
    constant Clk_period : time := 10 ns;

begin

    -- 3. Instantiate the Unit Under Test (UUT)
    uut: Register_Bank PORT MAP (
        Clk => Clk,
        Reset => Reset,
        D => D,
        R0 => R0,
        R1 => R1,
        R2 => R2,
        R3 => R3,
        R4 => R4,
        R5 => R5,
        R6 => R6,
        R7 => R7,
        I => I
    );

    -- 4. Clock Generation Process
    Clk_process :process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    -- 5. Stimulus Process (Applying test inputs)
    stim_proc: process
    begin		
        -- Step A: Apply Reset to clear all registers
        Reset <= '1';
        wait for 20 ns;	
        Reset <= '0';
        wait for Clk_period;

        -- Step B: Write Data to Register 1 (R1)
        D <= "1010";  -- Hex A
        I <= "001";   -- Address for R1
        wait for Clk_period;

        -- Step C: Write Data to Register 2 (R2)
        D <= "1100";  -- Hex C
        I <= "010";   -- Address for R2
        wait for Clk_period;

        -- Step D: Write Data to Register 7 (R7)
        D <= "0111";  -- Hex 7
        I <= "111";   -- Address for R7
        wait for Clk_period;
        
        -- Step E: Try writing to Register 0 (R0) 
        -- *Note: Because your source code maps R0's data input directly to "0000", 
        -- it will act as a constant zero register, which is common in CPU design. 
        -- Even though D="1111", R0 should remain "0000" in the simulation.
        D <= "1111";  -- Hex F
        I <= "000";   -- Address for R0
        wait for Clk_period;
        
        -- Step F: Write Data to Register 3 (R3)
        D <= "0011";  -- Hex 3
        I <= "011";   -- Address for R3
        wait for Clk_period;

        -- Step G: Apply Reset again to verify all registers clear correctly
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';

        -- End the simulation
        wait;
    end process;
end Behavioral;
