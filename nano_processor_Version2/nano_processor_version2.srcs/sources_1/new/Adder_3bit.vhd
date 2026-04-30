library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end Adder_3bit;

architecture Behavioral of Adder_3bit is
    component FA
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            C_in  : in  STD_LOGIC;
            S     : out STD_LOGIC;
            C_out : out STD_LOGIC
        );
    end component;

    signal C1,C2,C3 : std_logic; 

begin

    FA_0 : FA 
        port map( 
            A => A(0), 
            B => '1', 
            C_in => '0', 
            S => S(0), 
            C_out => C1 
        ); 
 
    FA_1 : FA 
        port map( 
            A => A(1), 
            B => '0', 
            C_in => C1, 
            S => S(1), 
            C_out => C2 
         ); 
    FA_2 : FA 
       port map( 
            A => A(2), 
            B => '0', 
            C_in => C2, 
            S => S(2), 
            C_out => C3 
         );  
         
end Behavioral;