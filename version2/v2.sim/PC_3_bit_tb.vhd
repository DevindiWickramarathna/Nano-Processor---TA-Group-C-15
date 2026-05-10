----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 04:03:55 PM
-- Design Name: 
-- Module Name: PC_3_bit_tb - Behavioral
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

entity PC_3_bit_tb is
--  Port ( );
end PC_3_bit_tb;

architecture Behavioral of PC_3_bit_tb is

component PC_3_bit
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal D   : STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Res : STD_LOGIC := '0';
signal Clk : STD_LOGIC := '0';
signal Q   : STD_LOGIC_VECTOR (2 downto 0);

begin

UUT : PC_3_bit
    PORT MAP (
        D   => D,
        Res => Res,
        Clk => Clk,
        Q   => Q
    );

clk_process : process
begin
    while true loop
        Clk <= '0';
        wait for 5 ns;
        Clk <= '1';
        wait for 5 ns;
    end loop;
end process;

stim_proc : process
begin
    Res <= '1';
    wait for 10 ns;
    Res <= '0';

    D <= "001"; wait for 10 ns;
    D <= "010"; wait for 10 ns;
    D <= "011"; wait for 10 ns;
    D <= "100"; wait for 10 ns;
    D <= "101"; wait for 10 ns;

    Res <= '1'; wait for 10 ns;
    Res <= '0';

    D <= "111"; wait for 10 ns;

    wait;
end process;

end Behavioral;
