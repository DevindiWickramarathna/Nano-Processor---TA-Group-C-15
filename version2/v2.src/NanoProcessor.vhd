----------------------------------------------------------------------------------
-- Company: Group22
-- Engineers: Pirasanth V., Abaiyan R., Fernando G.S.S., Kavyanga H.A.
--
-- Create Date: 05/15/2025 12:58:07 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity NanoProcessor is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           reg : out STD_LOGIC_VECTOR (3 downto 0);
           zero : out STD_LOGIC;
           overflow : out STD_LOGIC;
           display : out STD_LOGIC_VECTOR (6 downto 0);
           anode : out STD_LOGIC_VECTOR (3 downto 0);
           carry : out STD_LOGIC;
           var0, var1 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component LUT_16_7
   Port( address : in STD_LOGIC_VECTOR(3 downto 0);
         data : out STD_LOGIC_VECTOR(6 downto 0));
end component; 

component Register_Bank
   Port( Clk: in STD_LOGIC;
         Reset: in STD_LOGIC;
         D : in STD_LOGIC_VECTOR(3 downto 0);
         I : in STD_LOGIC_VECTOR(2 downto 0);
         R0 : out STD_LOGIC_VECTOR(3 downto 0);
         R1 : out STD_LOGIC_VECTOR(3 downto 0);
         R2 : out STD_LOGIC_VECTOR(3 downto 0);
         R3 : out STD_LOGIC_VECTOR(3 downto 0);
         R4 : out STD_LOGIC_VECTOR(3 downto 0);
         R5 : out STD_LOGIC_VECTOR(3 downto 0);
         R6 : out STD_LOGIC_VECTOR(3 downto 0);
         R7 : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component ADD_SUB_4bit
    Port(A : in STD_LOGIC_VECTOR(3 downto 0);
         B : in STD_LOGIC_VECTOR(3 downto 0);
         Enable : in STD_LOGIC;
         Operation : in STD_LOGIC;
         C_out : out STD_LOGIC;
         S: out STD_LOGIC_VECTOR(3 downto 0);
         Overflow : out STD_LOGIC;
         Zero : out STD_LOGIC);
end component; 

Component Comparator_4bit is
    Port ( A, B : in STD_LOGIC_VECTOR(3 downto 0);
           Ena : in STD_LOGIC;
           Equal, Greater, Less : out STD_LOGIC );
end Component;

Component Multiplier_2bit is
    Port ( A4 : in STD_LOGIC_VECTOR (3 downto 0);
           B4 : in STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

component Instruction_Decoder
   Port( I : in STD_LOGIC_VECTOR(12 downto 0);
         Reg_Check_Jump: in STD_LOGIC_VECTOR(3 downto 0);
         Load_Select : out STD_LOGIC;
         Operation_En : out STD_LOGIC_VECTOR(3 downto 0);
         Imm_Value : out STD_LOGIC_VECTOR(3 downto 0);
         Reg_Enable : out STD_LOGIC_VECTOR(2 downto 0);
         Reg_Select_1 : out STD_LOGIC_VECTOR(2 downto 0);
         Reg_Select_2 : out STD_LOGIC_VECTOR(2 downto 0);
         Add_Sub : out STD_LOGIC;
         Jump_Flag : out STD_LOGIC;
         Address : out STD_LOGIC_VECTOR(2 downto 0)
         );
end component;

component Slow_Clock
   Port(Clk_in : in STD_LOGIC;
        Clk_out: out STD_LOGIC);
end component;

component Program_ROM
   Port( address : in STD_LOGIC_VECTOR(2 downto 0);
         instruction_code : out STD_LOGIC_VECTOR(12 downto 0));
end component;

component MUX_2_way_3_bit
   Port( Selector: in STD_LOGIC;
         A : in STD_LOGIC_VECTOR(2 downto 0);
         B : in STD_LOGIC_VECTOR(2 downto 0);
         Y : out STD_LOGIC_VECTOR(2 downto 0));
end component;

component MUX_2_way_4_bit
   Port( Selector: in STD_LOGIC;
         A : in STD_LOGIC_VECTOR(3 downto 0);
         B : in STD_LOGIC_VECTOR(3 downto 0);
         Y : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component MUX_8_way_4_bit 
   Port( Selector : in STD_LOGIC_VECTOR(2 downto 0);
         A0 : in STD_LOGIC_VECTOR(3 downto 0);
         A1 : in STD_LOGIC_VECTOR(3 downto 0);
         A2 : in STD_LOGIC_VECTOR(3 downto 0);
         A3 : in STD_LOGIC_VECTOR(3 downto 0);
         A4 : in STD_LOGIC_VECTOR(3 downto 0);
         A5 : in STD_LOGIC_VECTOR(3 downto 0);
         A6 : in STD_LOGIC_VECTOR(3 downto 0);
         A7 : in STD_LOGIC_VECTOR(3 downto 0);
         Y : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component Adder_3bit
  Port( A : in STD_LOGIC_VECTOR(2 downto 0);
        S : out STD_LOGIC_VECTOR(2 downto 0);
        C_out : out STD_LOGIC);
end component;

component PC_3_bit
   Port( D : in STD_LOGIC_VECTOR(2 downto 0);
         Res : in STD_LOGIC;
         Clk : in STD_LOGIC;
         Q : out STD_LOGIC_VECTOR(2 downto 0));
end component;

signal Load_Select, Add_Sub_Selector, Jump_Flag, Overflow_0, Z_out: STD_LOGIC;
signal Ins_Bus : STD_LOGIC_VECTOR(12 downto 0);
signal O,b,Add_out,Reg_Enable,Reg_Select_1,Reg_Select_2,OpCode: STD_LOGIC_VECTOR(2 downto 0);
signal Address : STD_LOGIC_VECTOR(2 downto 0);
signal Imm_Value, R0,R1,R2,R3,R4,R5,R6,R7,S,X,Y1,Y2,MultiplierOutput: STD_LOGIC_VECTOR(3 downto 0);
signal Clk_out : STD_LOGIC;
signal Adder_En, Comparator_En,Multiplier_En : STD_LOGIC;
signal Operation_En,seg_Address : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Equal, Greater, Less :  STD_LOGIC;


begin

SlowClock : Slow_Clock
   Port map (
      Clk_in => clk,
      Clk_out => Clk_out);
      
LUT : LUT_16_7
  Port map(
      address => seg_Address,
      data => display);
            
ProgramCounter : PC_3_bit
  Port map(
      D => b,
      Q => O,
      Clk => Clk_out,
      Res => reset);
      
ProgramRom : Program_ROM
  Port map(
      address => O,
      instruction_code => Ins_Bus);
      
InstructionDecoder : Instruction_Decoder
  Port map(
    I => Ins_Bus,
    Reg_Check_Jump => Y1,
    Load_Select => Load_Select,
    Operation_En => Operation_En,
    Imm_Value => Imm_Value,
    Reg_Enable => Reg_Enable,
    Reg_Select_1 => Reg_Select_1,
    Reg_Select_2 => Reg_Select_2,
    Add_Sub => Add_Sub_Selector,
    Jump_Flag => Jump_Flag,
    Address => Address
    );
     
 MUX_2_to_1_4bit_1 : MUX_2_way_4_bit
   Port map(
     Selector => Load_Select,
     A => S,
     B => Imm_Value,
     Y => X);
     
 RegisterBank : Register_Bank
    Port map(
     Clk => Clk_out,
     Reset => reset,
     D => X,
     R0 => R0,
     R1 => R1,
     R2 => R2,
     R3 => R3,
     R4 => R4,
     R5 => R5,
     R6 => R6,
     R7 => R7,
     I => Reg_Enable);
     
 MUX_8_to_1_4bit_0 : MUX_8_way_4_bit
   Port map(
    Selector => Reg_Select_1,
    A0 => R0,
    A1 => R1,
    A2 => R2,
    A3 => R3,
    A4 => R4,
    A5 => R5,
    A6 => R6,
    A7 => R7,
    Y => Y1);
    
 MUX_8_to_1_4bit_1 : MUX_8_way_4_bit
    Port map(
      Selector => Reg_Select_2,
      A0 => R0,
      A1 => R1,
      A2 => R2,
      A3 => R3,
      A4 => R4,
      A5 => R5,
      A6 => R6,
      A7 => R7,
      Y => Y2);
      
AddSub : ADD_SUB_4bit
    Port map(
      A => Y1,
      B => Y2,
      Enable => Adder_En,
      Operation => Add_Sub_Selector,
      C_out => carry,
      S => S,
      Overflow => Overflow_0,
      Zero => Z_out);
      
 Comparator : Comparator_4bit
    Port map( A => Y1,
              B => Y2,
              Ena => Comparator_En,
              Equal => Equal,
              Greater => Greater,
              Less => Less);
 
Multiplier : Multiplier_2bit
    Port map ( A4 => Y1,
             B4  => Y2,
             Enable  => Multiplier_En,
             Y => MultiplierOutput );    

Mux_2_to_1_3bit_0 : MUX_2_way_3_bit
     Port map(
        Selector => Jump_Flag,
        A => Add_Out,
        B => Address,
        Y => b);
            
Adder3bit : Adder_3bit
     Port map(
       A => O,
       S => Add_Out);
       
process(OpCode, Less, Greater, Equal, MultiplierOutput)
begin
 
OpCode <= Ins_Bus(12 downto 10);

seg_Address <= "0000";
    if OpCode = "100" then
       if Less = '1' then
           anode <= "1101";
           seg_Address <= "0001";
       elsif Greater = '1' then
           anode <= "0111";
           seg_Address <= "0001";
       else
           anode <= "1011";
           seg_Address <= "0001";
       end if;
    elsif OpCode = "111" then
       anode <= "1110";
       seg_Address <= MultiplierOutput;
    end if;
end process;
   
Adder_En <= Operation_En(0);
Comparator_En <= Operation_En(1);
Multiplier_En <= Operation_En(2);
reg <= MultiplierOutput;
zero <= Z_out;
overflow <= Overflow_0;

var0 <= Y1;
var1 <= Y2;
   
end Behavioral;
