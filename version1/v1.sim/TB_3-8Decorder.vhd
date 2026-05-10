----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2026 12:46:12 AM
-- Design Name: 
-- Module Name: TB_3_8_Decoder - Behavioral
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

entity TB_3_8_Decoder is
--  Port ( );
end TB_3_8_Decoder;

architecture Behavioral of TB_3_8_Decoder is

    component Decoder_3_to_8
    Port (
        I  : in  STD_LOGIC_VECTOR (2 downto 0);
        EN : in  STD_LOGIC;
        Y  : out STD_LOGIC_VECTOR (7 downto 0)
    );
    end component;

    signal I  : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal EN : STD_LOGIC := '0';
    signal Y  : STD_LOGIC_VECTOR(7 downto 0);

begin

    uut: Decoder_3_to_8 PORT MAP (
        I => I,
        EN => EN,
        Y => Y
    );

    stim_proc: process
    begin
        EN <= '0';
        I <= "000";
        wait for 20 ns;

        I <= "111";
        wait for 20 ns;

        EN <= '1';
        
        I <= "000"; 
        wait for 20 ns;
        
        I <= "001"; 
        wait for 20 ns;
        
        I <= "010"; 
        wait for 20 ns;
        
        I <= "011"; 
        wait for 20 ns;
        
        I <= "100"; 
        wait for 20 ns;
        
        I <= "101"; 
        wait for 20 ns;
        
        I <= "110"; 
        wait for 20 ns;
        
        I <= "111"; 
        wait for 20 ns;

        EN <= '0';
        wait;
    end process;

end Behavioral;