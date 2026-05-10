library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Nanoprocessor is
--  Port ( );
end TB_Nanoprocessor;

architecture Behavioral of TB_Nanoprocessor is

component NanoProcessor
    Port (clk : in STD_LOGIC;
          reset : in STD_LOGIC; 
          reg : out STD_LOGIC_VECTOR (3 downto 0);
          display : out STD_LOGIC_VECTOR (6 downto 0);
          zero : out STD_LOGIC;
          overflow : out STD_LOGIC;
          anode : out STD_LOGIC_VECTOR (3 downto 0);
          carry: out STD_LOGIC   );
end component;
Signal clk,reset,zero,overflow,carry : STD_LOGIC;
signal reg,anode : STD_LOGIC_VECTOR (3 downto 0);
signal display : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT : NanoProcessor
    Port Map (
        clk => clk,
        reset => reset,
        reg => reg,
        zero => zero,
        overflow => overflow,
        carry => carry,
        display => display,
        anode => anode
    );

process
begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
end process;

process
begin
    reset <= '1';
    wait for 100ns;
    reset <= '0';
    wait;
end process;
end Behavioral;
