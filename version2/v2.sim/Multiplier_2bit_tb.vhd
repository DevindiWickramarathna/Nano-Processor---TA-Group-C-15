----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 04:01:15 PM
-- Design Name: 
-- Module Name: Multiplier_2bit_tb - Behavioral
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

entity Multiplier_2bit_tb is
--  Port ( );
end Multiplier_2bit_tb;

architecture Behavioral of Multiplier_2bit_tb is
    -- Component Declaration
    component Multiplier_2bit is
        Port ( A4 : in STD_LOGIC_VECTOR (3 downto 0);
               B4 : in STD_LOGIC_VECTOR (3 downto 0);
               Enable : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Signals
    signal A4     : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal B4     : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal Enable : STD_LOGIC := '0';
    signal Y      : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate UUT
    uut: Multiplier_2bit
        PORT MAP (
            A4 => A4,
            B4 => B4,
            Enable => Enable,
            Y => Y
        );

    -- Stimulus Process
    stim_proc: process
    begin

        -- Enable OFF ? output should be 0000
        Enable <= '0';
        A4 <= "0011"; B4 <= "0010";  -- 3 × 2
        wait for 10 ns;

        -- Enable ON
        Enable <= '1';

        -- Test cases (only lower 2 bits used)
        A4 <= "0001"; B4 <= "0001"; wait for 10 ns; -- 1×1 = 1
        A4 <= "0010"; B4 <= "0011"; wait for 10 ns; -- 2×3 = 6
        A4 <= "0011"; B4 <= "0011"; wait for 10 ns; -- 3×3 = 9
        A4 <= "0000"; B4 <= "0011"; wait for 10 ns; -- 0×3 = 0
        A4 <= "0011"; B4 <= "0000"; wait for 10 ns; -- 3×0 = 0

        -- Disable again
        Enable <= '0';
        A4 <= "0011"; B4 <= "0011"; wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;