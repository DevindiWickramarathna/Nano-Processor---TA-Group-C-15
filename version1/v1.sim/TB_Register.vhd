----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2026 12:59:06 AM
-- Design Name: 
-- Module Name: TB_Register - Behavioral
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

entity TB_Register is
--  Port ( );
end TB_Register;

architecture Behavioral of TB_Register is

    component Register_4bit
    Port (
        D     : in  STD_LOGIC_VECTOR (3 downto 0);
        En    : in  STD_LOGIC;
        Clk   : in  STD_LOGIC;
        Reset : in  STD_LOGIC;
        Q     : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;

    signal D     : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal En    : STD_LOGIC := '0';
    signal Clk   : STD_LOGIC := '0';
    signal Reset : STD_LOGIC := '0';
    signal Q     : STD_LOGIC_VECTOR(3 downto 0);

    constant Clk_period : time := 10 ns;

begin

    uut: Register_4bit PORT MAP (
        D => D,
        En => En,
        Clk => Clk,
        Reset => Reset,
        Q => Q
    );

    Clk_process :process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    stim_proc: process
    begin
        Reset <= '1';
        wait for 20 ns;
        
        Reset <= '0';
        wait for 10 ns;

        D <= "1010";
        En <= '0';
        wait for 20 ns;

        En <= '1';
        wait for 20 ns;

        D <= "0101";
        wait for 20 ns;

        En <= '0';
        D <= "1111";
        wait for 20 ns;

        Reset <= '1';
        wait for 20 ns;
        
        Reset <= '0';

        wait;
    end process;

end Behavioral;
