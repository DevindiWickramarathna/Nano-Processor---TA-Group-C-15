----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2026 07:21:39 PM
-- Design Name: 
-- Module Name: MUX_8_way_4_bit - Behavioral
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

entity MUX_8_way_4_bit is
    Port ( Selector : in STD_LOGIC_VECTOR (2 downto 0);
           A0 : in STD_LOGIC_VECTOR (3 downto 0);
           A1 : in STD_LOGIC_VECTOR (3 downto 0);
           A2 : in STD_LOGIC_VECTOR (3 downto 0);
           A3 : in STD_LOGIC_VECTOR (3 downto 0);
           A4 : in STD_LOGIC_VECTOR (3 downto 0);
           A5 : in STD_LOGIC_VECTOR (3 downto 0);
           A6 : in STD_LOGIC_VECTOR (3 downto 0);
           A7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_way_4_bit;

architecture Behavioral of MUX_8_way_4_bit is

begin
   with Selector select
      Y <= A0 when "000",
           A1 when "001",
           A2 when "010",
           A3 when "011",
           A4 when "100",
           A5 when "101",
           A6 when "110",
           A7 when "111",
          (others => '0') when others;
end Behavioral;