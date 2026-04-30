----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 11:46:48 AM
-- Design Name: 
-- Module Name: Comparator_4bit - Behavioral
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

entity Comparator_4bit is
    Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
           Ena : in STD_LOGIC;
           Equal, Greater, Less : out STD_LOGIC );
end Comparator_4bit;

architecture Structural of Comparator_4bit is

    component Comparator_1bit
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Enable : in STD_LOGIC;
               IsEqual : out STD_LOGIC;
               IsGreater : out STD_LOGIC;
               IsLess : out STD_LOGIC );
    end component;

    signal eq : STD_LOGIC_VECTOR(3 downto 0);
    signal gt : STD_LOGIC_VECTOR(3 downto 0);
    signal lt : STD_LOGIC_VECTOR(3 downto 0);
    signal en : STD_LOGIC_VECTOR(3 downto 0);

begin

    en(3) <= '1';
    en(2) <= eq(3);
    en(1) <= eq(3) and eq(2);
    en(0) <= eq(3) and eq(2) and eq(1);


    -- Instantiate 1-bit comparators
    comp3: Comparator_1bit port map(A => A(3), B => B(3), Enable => en(3), IsEqual => eq(3), IsGreater => gt(3), IsLess => lt(3));
    comp2: Comparator_1bit port map(A => A(2), B => B(2), Enable => en(2), IsEqual => eq(2), IsGreater => gt(2), IsLess => lt(2));
    comp1: Comparator_1bit port map(A => A(1), B => B(1), Enable => en(1), IsEqual => eq(1), IsGreater => gt(1), IsLess => lt(1));
    comp0: Comparator_1bit port map(A => A(0), B => B(0), Enable => en(0), IsEqual => eq(0), IsGreater => gt(0), IsLess => lt(0));

    -- Final outputs: prioritize MSB to LSB
    Greater <= ( gt(3) or gt(2) or gt(1) or gt(0) ) AND Ena;
    Less    <= ( lt(3) or lt(2) or lt(1) or lt(0) ) AND Ena;
    Equal   <= ( eq(3) and eq(2) and eq(1) and eq(0) ) AND Ena;

end Structural;
