----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2026 06:50:41 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_3_bit - Behavioral
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

entity TB_MUX_2_way_3_bit is
--  Port ( );
end TB_MUX_2_way_3_bit;

architecture Behavioral of TB_MUX_2_way_3_bit is
component MUX_2_way_3_bit
    PORT ( Selector: in STD_LOGIC;
           A : in STD_LOGIC_VECTOR(2 downto 0);
           B : in STD_LOGIC_VECTOR(2 downto 0);
           Y : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal Selector : std_logic;
signal A,B,Y : std_logic_vector(2 downto 0);

begin
UUT : MUX_2_way_3_bit
    port map(
        Selector => Selector,
        A => A,
        B => B,
        Y => Y);

process
begin
    A <= "001";
    B <= "010";
    Selector <= '1';
    wait for 100 ns;

    Selector <= '0';
    wait for 100 ns;

    A <= "100";
    B <= "101";
    Selector <= '1';
    wait for 100 ns;

    Selector <= '0';
    wait;
end process;

end Behavioral;
