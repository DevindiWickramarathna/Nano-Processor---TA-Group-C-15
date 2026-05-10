----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 04:09:00 PM
-- Design Name: 
-- Module Name: Program_ROM_tb - Behavioral
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

entity Program_ROM_tb is
--  Port ( );
end Program_ROM_tb;

architecture Behavioral of Program_ROM_tb is
    -- Component Declaration
    component Program_ROM
        Port (
            address : in STD_LOGIC_VECTOR (2 downto 0);
            instruction_code : out STD_LOGIC_VECTOR (12 downto 0)
        );
    end component;

    -- Signals
    signal address : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal instruction_code : STD_LOGIC_VECTOR (12 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Program_ROM
        port map (
            address => address,
            instruction_code => instruction_code
        );

    -- Test Process
    stim_proc: process
    begin

        -- Address 0
        address <= "000";
        wait for 10 ns;

        -- Address 1
        address <= "001";
        wait for 10 ns;

        -- Address 2
        address <= "010";
        wait for 10 ns;

        -- Address 3
        address <= "011";
        wait for 10 ns;

        -- Address 4
        address <= "100";
        wait for 10 ns;

        -- Address 5
        address <= "101";
        wait for 10 ns;

        -- Address 6
        address <= "110";
        wait for 10 ns;

        -- Address 7
        address <= "111";
        wait for 10 ns;

        wait;

    end process;

end Behavioral;
