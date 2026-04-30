----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2026 07:18:03 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_4_bit - Behavioral
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

entity TB_MUX_2_way_4_bit is
--  Port ( );
end TB_MUX_2_way_4_bit;

architecture Behavioral of TB_MUX_2_way_4_bit is
component MUX_2_way_4_bit
    PORT ( A : in STD_LOGIC_VECTOR(3 downto 0);
           B : in STD_LOGIC_VECTOR(3 downto 0);
           Selector : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal Selector : std_logic;
signal A,B,Y : std_logic_vector(3 downto 0);

begin
UUT : MUX_2_way_4_bit                   -- 230002N - 0011 1000 0010 0000 1010
    port map(                           -- 230331V - 0011 1000 0010 0011 1011
        A => A,                         -- 230490F - 0011 1000 0011 0001 0010
        B => B,                         -- 230179K - 0011 1000 0000 1110 0011
        Selector => Selector,
        Y => Y);

process
begin
    A <= "0011";
    B <= "1000";
    Selector <= '1';
    wait for 100 ns;

    Selector <= '0';
    wait for 100 ns;

    A <= "0010";
    B <= "1011";
    Selector <= '1';
    wait for 100 ns;

    Selector <= '0';
    wait;
end process;

end Behavioral;