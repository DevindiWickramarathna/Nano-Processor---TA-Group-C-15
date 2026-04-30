----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2026 07:27:14 PM
-- Design Name: 
-- Module Name: TB_MUX_8_way_4_bit - Behavioral
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

entity TB_MUX_8_way_4_bit is
--  Port ( );
end TB_MUX_8_way_4_bit;

architecture Behavioral of TB_MUX_8_way_4_bit is
component MUX_8_way_4_bit
    Port( Selector: in STD_LOGIC_VECTOR(2 downto 0);
          A0 : in STD_LOGIC_VECTOR(3 downto 0);
          A1 : in STD_LOGIC_VECTOR(3 downto 0);
          A2 : in STD_LOGIC_VECTOR(3 downto 0);
          A3 : in STD_LOGIC_VECTOR(3 downto 0);
          A4 : in STD_LOGIC_VECTOR(3 downto 0);
          A5 : in STD_LOGIC_VECTOR(3 downto 0);
          A6 : in STD_LOGIC_VECTOR(3 downto 0);
          A7 : in STD_LOGIC_VECTOR(3 downto 0);
          Y : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal Selector : std_logic_vector(2 downto 0);
signal A0,A1,A2,A3,A4,A5,A6,A7,Y : std_logic_vector(3 downto 0);

begin
UUT : MUX_8_way_4_bit
    port map (
        Selector => Selector,
        A0 => A0,
        A1 => A1,
        A2 => A2,
        A3 => A3,
        A4 => A4,
        A5 => A5,
        A6 => A6,
        A7 => A7,
        Y => Y);

process
begin
    A0 <= "1111";
    A1 <= "0101";
    A2 <= "1110";
    A3 <= "1000";
    A4 <= "0000";
    A5 <= "0001";
    A6 <= "1001";
    A7 <= "1010";

    Selector <= "000";
    wait for 100 ns;

    Selector <= "001";
    wait for 100 ns;

    Selector <= "010";
    wait for 100 ns;

    Selector <= "011";
    wait for 100 ns;

    Selector <= "100";
    wait for 100 ns;

    Selector <= "101";
    wait for 100 ns;

    Selector <= "110";
    wait for 100 ns;

    Selector <= "111";
    wait;
end process;

end Behavioral;