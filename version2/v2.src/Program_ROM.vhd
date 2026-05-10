library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity Program_ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           instruction_code : out STD_LOGIC_VECTOR (12 downto 0));
end Program_ROM;

architecture Behavioral of Program_ROM is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);
 
signal twelveSegmant_ROM : rom_type := (  -- Program is hardcoded here.

--  TASK 03 : Extra Functionality => 4bit Comparator and 2bit Multiplier

    "0100010000010", -- Movi R1, 2
    "0100100000011", -- Movi R2, 3
    "0100110000011", -- Movi R3, 3
    "1000100010000", -- Compare R2, R1 
    "1110110100000", -- Multiply R3, R2
    "1000010100000", -- Compare R1, R2
    "1110110010000", -- Multiply R3, R1
    "1000100110000"  -- Compare R2, R3
        
);

begin

instruction_code <= twelveSegmant_ROM(to_integer(unsigned(address)));

end Behavioral;