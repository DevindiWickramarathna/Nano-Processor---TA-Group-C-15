library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_ROM is
    Port (
        address : in STD_LOGIC_VECTOR (2 downto 0);
        instruction_code : out STD_LOGIC_VECTOR (11 downto 0)
    );
end Program_ROM;

architecture Behavioral of Program_ROM is

    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);

    constant ROM : rom_type := (

        -- MOVI R7,1   => 10 111 000 0001
        0 => "101110000001",

        -- MOVI R1,2   => 10 001 000 0010
        1 => "100010000010",

        -- ADD R7,R1   => 00 111 001 0000
        2 => "001110010000",

        -- MOVI R2,3   => 10 010 000 0011
        3 => "100100000011",

        -- ADD R7,R2   => 00 111 010 0000
        4 => "001110100000",

        -- JZR 5       => 11 000 000 0101
        5 => "110000000101",

        -- Hold
        6 => "110000000101",
        7 => "110000000101"
    );

begin

    instruction_code <= ROM(to_integer(unsigned(address)));

end Behavioral;