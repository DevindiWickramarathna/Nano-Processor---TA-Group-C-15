library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Slow_Clock is
    Port (
        Clk_in   : in  STD_LOGIC;
        Clk_out  : out STD_LOGIC
    );
end Slow_Clock;

architecture Behavioral of Slow_Clock is
    signal count : unsigned(25 downto 0) := (others => '0');
begin

    process (Clk_in)
    begin
        if rising_edge(Clk_in) then
            count <= count + 1;
        end if;
    end process;

    Clk_out <= count(25); -- Output a slower clock using MSB

end Behavioral;
