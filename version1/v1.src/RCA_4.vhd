library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        C_in  : in  STD_LOGIC;
        S     : out STD_LOGIC_VECTOR(3 downto 0);
        C_out : out STD_LOGIC
    );
end RCA_4;

architecture Behavioral of RCA_4 is

    COMPONENT FA
        PORT(
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            C_in  : in  STD_LOGIC;
            S     : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
    END COMPONENT;

    SIGNAL C1, C2, C3 : STD_LOGIC;

begin

    FA0: FA PORT MAP(
        A => A(0),
        B => B(0),
        C_in => C_in,
        S => S(0),
        C_out => C1);

    FA1: FA PORT MAP(
        A => A(1),
        B => B(1),
        C_in => C1,
        S => S(1),
        C_out => C2);

    FA2: FA PORT MAP(
        A => A(2),
        B => B(2),
        C_in => C2,
        S => S(2),
        C_out => C3);

    FA3: FA PORT MAP(
        A => A(3),
        B => B(3),
        C_in => C3,
        S => S(3),
        C_out => C_out);

end Behavioral;

