----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 11:25:11 PM
-- Design Name: 
-- Module Name: Nano_processor - Behavioral
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

entity Nano_processor is
      Port (    Reset: in STD_LOGIC;
                Clk : in STD_LOGIC;
                Output: out STD_LOGIC_VECTOR(3 downto 0);
                Flag_overflow: out STD_LOGIC;
                Flag_Zero: out STD_LOGIC;
                Flag_C_out: out STD_LOGIC;
                Flag_Sign : out STD_LOGIC;
                AnodeSelector : out STD_LOGIC_VECTOR(3 downto 0);
                S_7Seg : out STD_LOGIC_VECTOR (6 downto 0));
end Nano_processor;

architecture Behavioral of Nano_processor is

    component Program_Counter
        port(   input : in STD_LOGIC_VECTOR(2 downto 0);
                output: out STD_LOGIC_VECTOR(2 downto 0);
                Clk: in STD_LOGIC;
                Reset: in STD_LOGIC );
    end component;
    
    component ROM
        port (  Memory_Sel: in STD_LOGIC_VECTOR(2 downto 0);
                Instruction_bus: out STD_LOGIC_VECTOR(11 downto 0));
    end component;
    
    component Instruction_decoder
        port (  Instruction_Bus: in STD_LOGIC_VECTOR(11 downto 0);
                Reg_Check_Jump: in STD_LOGIC_VECTOR(3 downto 0);
                Reg_Enable: out STD_LOGIC_VECTOR(2 downto 0);
                Load_Sel: out STD_LOGIC;
                Imm_Value: out STD_LOGIC_VECTOR(3 downto 0);
                Reg_Sel_1: out STD_LOGIC_VECTOR(2 downto 0);
                Reg_Sel_2: out STD_LOGIC_VECTOR(2 downto 0);
                Add_Sub_Sel: out STD_LOGIC;
                Jump_flag: out STD_LOGIC;
                Address_Jump: out STD_LOGIC_VECTOR(2 downto 0));
    end component;
    
    component Mux_2_4bit
        port (  A1 : in STD_LOGIC_VECTOR (3 downto 0);
                A2 : in STD_LOGIC_VECTOR (3 downto 0);
                Sel : in STD_LOGIC;
                Q : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Registers_Bank
        port (  input: in STD_LOGIC_VECTOR(3 downto 0);
                Reg_Sel: in STD_LOGIC_VECTOR(2 downto 0);
                Slow_Clk : in STD_LOGIC;
                Reset : in STD_LOGIC;
                Reg0_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg1_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg2_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg3_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg4_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg5_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg6_Out : out STD_LOGIC_VECTOR (3 downto 0);
                Reg7_Out : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    component Mux_8_4bit_new
        port (      A0 : in STD_LOGIC_VECTOR (3 downto 0);
                    A1 : in STD_LOGIC_VECTOR (3 downto 0);
                    A2 : in STD_LOGIC_VECTOR (3 downto 0);
                    A3 : in STD_LOGIC_VECTOR (3 downto 0);
                    A4 : in STD_LOGIC_VECTOR (3 downto 0);
                    A5 : in STD_LOGIC_VECTOR (3 downto 0);
                    A6 : in STD_LOGIC_VECTOR (3 downto 0);
                    A7 : in STD_LOGIC_VECTOR (3 downto 0);
                    Sel : in STD_LOGIC_VECTOR (2 downto 0);
                    Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Add_Sub_unit
        port (  A : in STD_LOGIC_VECTOR (3 downto 0);
                B : in STD_LOGIC_VECTOR (3 downto 0);
                M : in STD_LOGIC;
                C_out : out STD_LOGIC;
                S : out STD_LOGIC_VECTOR (3 downto 0); 
                Zero : out STD_LOGIC;
                overflow : out STD_LOGIC);
    end component;
    
    component Adder_3bit
        port (     input : in STD_LOGIC_VECTOR (2 downto 0);
                   output : out STD_LOGIC_VECTOR (2 downto 0);
                   C_out : out STD_LOGIC);
    end component;
    
    component Mux_2_3bit
        port ( A1 : in STD_LOGIC_VECTOR (2 downto 0);
               A2 : in STD_LOGIC_VECTOR (2 downto 0);
               Sel : in STD_LOGIC;
               Q : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component Slow_Clk
        port (  Clk_in : in STD_LOGIC;
                Clk_out : out STD_LOGIC);
    end component;
    
    component LUT_16_7
        port ( address : in STD_LOGIC_VECTOR (3 downto 0);
               data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    signal Slow_clock_out, load_Selector, M, FLAG, ALU_C_out, Adder_C_out : STD_LOGIC;
    signal pc_IN, Memory_Selector, Register_Enable, Register_Selector_1, Register_Selector_2 : STD_LOGIC_VECTOR(2 downto 0);
    signal Address_to_Jump, Adder_output : STD_LOGIC_VECTOR(2 downto 0);
    signal Register_Check_for_jump, Immerdiate_Value, ALU_output, Register_input, ALU_input_2 : STD_LOGIC_VECTOR(3 downto 0);
    signal Register0_out, Register1_out, Register2_out, Register3_out : STD_LOGIC_VECTOR(3 downto 0);
    signal Register4_out, Register5_out, Register6_out, Register7_out : STD_LOGIC_VECTOR(3 downto 0);
    signal InS_Bus : STD_LOGIC_VECTOR(11 downto 0); 
    
begin

    Slow_Clk_0: Slow_Clk
        port map (  Clk_in => Clk,
                    Clk_out => Slow_clock_out );
                    
    pc_0 : Program_Counter
        port map(   input => pc_IN,
                    output => Memory_Selector,
                    Clk => Slow_clock_out,
                    Reset => Reset    );
     
     ROM_0 : ROM
        port map(   Memory_Sel => Memory_Selector,
                    Instruction_bus => InS_Bus);
     
     InS_decoder_0 : Instruction_Decoder
        port map(    Instruction_Bus => InS_Bus,
                     Reg_Check_Jump => Register_Check_for_jump, 
                     Reg_Enable => Register_Enable,
                     Load_Sel => load_Selector,
                     Imm_Value => Immerdiate_Value,
                     Reg_Sel_1 => Register_Selector_1,
                     Reg_Sel_2=> Register_Selector_2,
                     Add_Sub_Sel => M,
                     Jump_flag => FLAG,
                     Address_Jump => Address_to_Jump);
    
    Mux_2_4bit_0 : Mux_2_4bit
        port map(   A1 => ALU_output,
                    A2 => Immerdiate_Value,
                    Sel => load_Selector,
                    Q => Register_input);
    
    Register_BANK_0 : Registers_Bank
        port map(   input => Register_input,
                    Reg_Sel => Register_Enable,
                    Slow_Clk => Slow_clock_out,
                    Reset => Reset,
                    Reg0_Out => Register0_out,
                    Reg1_Out => Register1_out,
                    Reg2_Out => Register2_out,
                    Reg3_Out => Register3_out,
                    Reg4_Out => Register4_out,
                    Reg5_Out => Register5_out,
                    Reg6_Out => Register6_out,
                    Reg7_Out => Register7_out);
    
    Mux_8_4bit_0 : Mux_8_4bit_new
             port map( A0 => Register0_out,
                       A1 => Register1_out,
                       A2 => Register2_out,
                       A3 => Register3_out,
                       A4 => Register4_out,
                       A5 => Register5_out,
                       A6 => Register6_out,
                       A7 => Register7_out,
                       Sel => Register_Selector_1,
                       Y  => Register_Check_for_jump );
    
    Mux_8_4bit_1 : Mux_8_4bit_new
                port map(  A0 => Register0_out,
                           A1 => Register1_out,
                           A2 => Register2_out,
                           A3 => Register3_out,
                           A4 => Register4_out,
                           A5 => Register5_out,
                           A6 => Register6_out,
                           A7 => Register7_out,
                           Sel => Register_Selector_2,
                           Y  => ALU_input_2 );
    
    ALU_0 : Add_Sub_unit
        port map(   A => Register_Check_for_jump,
                    B => ALU_input_2,
                    M => M,
                    C_out => ALU_C_out,
                    S => ALU_output, 
                    Zero => Flag_Zero,
                    overflow => Flag_overflow );
    
    Adder_3bit_0 : Adder_3bit
        port map(   input => Memory_selector,
                    output => Adder_output,
                    C_out => Adder_C_out);
    
    Mux_2_3bit_0 : Mux_2_3bit
        port map(  A1 => Adder_output,
                   A2 => Address_to_Jump,
                   Sel => FLAG,
                   Q => pc_IN); 
    
    LUT_16_7_0 : LUT_16_7
        port map(   address => Register7_out,
                    data => S_7Seg );  
    
    Flag_C_out <= ALU_C_out OR adder_C_out;
    Flag_Sign <= ALU_output(0);               
    output <= Register7_out;
    AnodeSelector <= "1110";

end Behavioral;
