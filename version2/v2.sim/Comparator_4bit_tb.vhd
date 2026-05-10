----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/08/2026 04:19:15 PM
-- Design Name: 
-- Module Name: Comparator_4bit_tb - Behavioral
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

entity Comparator_4bit_tb is
--  Port ( );
end Comparator_4bit_tb;

architecture Behavioral of Comparator_4bit_tb is

    component Comparator_4bit
        Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
               Ena : in STD_LOGIC;
               Equal, Greater, Less : out STD_LOGIC );
    end component;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Ena : STD_LOGIC := '0';
    signal Equal, Greater, Less : STD_LOGIC;

begin

    DUT: Comparator_4bit
        port map(
            A => A,
            B => B,
            Ena => Ena,
            Equal => Equal,
            Greater => Greater,
            Less => Less
        );

    process
    begin

        A <= "0101"; B <= "0101"; Ena <= '1';
        wait for 10 ns;

        A <= "1010"; B <= "0110"; Ena <= '1';
        wait for 10 ns;

        A <= "0011"; B <= "1100"; Ena <= '1';
        wait for 10 ns;

        A <= "1111"; B <= "0000"; Ena <= '0';
        wait for 10 ns;

        A <= "0000"; B <= "0000"; Ena <= '1';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
