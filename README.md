# ⚙️ Optimized 4-bit Nanoprocessor – CS1050 Lab 9–10

Welcome to the our 4-bit nanoprocessor project for **Lab 9–10** of the **Computer Organization and Digital Design (CS1050)** course at the **Department of Computer Science and Engineering, University of Moratuwa**.  
This version features improved accuracy, cleaner architecture, and more modular design.

---

## 📌 Project Summary

This project implements a basic but functional 4-bit **nanoprocessor** capable of executing a minimal instruction set.  
Key goals include modular design, optimized control logic, and reliable FPGA implementation using VHDL.

---

## 🧠 Features at a Glance

- 4-bit ALU (add/subtract using two's complement)
- 3-bit Program Counter with increment and jump
- 8 General Purpose Registers (4-bit each) – `R0` hardwired to 0
- ROM-based Instruction Memory (preloaded machine code)
- Optimized Instruction Decoder and Control Logic
- 2-way & 8-way Multiplexers for data routing
- Tri-state 3, 4, and 12-bit data buses
- Modular and synthesizable VHDL design

---
## 🪛 Optimized Files
- The Program Counter
      - Remove the previous version of pc and add a new version that can increment by one itself & jump address and jump_Selector using if case in vhdl
- Muxs
      - Remove tri-state buffers and implement using if-else cases and switch cases.
- Adder_3bit
      - remove completely from project

## 🧾 Supported Instruction Set

| Instruction | Function                                  | Format (12-bit)      |
|-------------|-------------------------------------------|-----------------------|
| `MOVI R, d` | Load immediate value `d` into register `R`| `10RRR000dddd`        |
| `ADD Ra, Rb`| Add contents of `Rb` to `Ra`              | `00aaabbb0000`        |
| `NEG R`     | Two’s complement of register `R`          | `01RRR0000000`        |
| `JZR R, d`  | Jump to address `d` if register `R` is 0  | `11RRR0000ddd`        |

> 💡 All instructions are 12 bits in length. Fields like `RRR`, `aaa`, and `bbb` indicate register indices; `d` indicates a 3 or 4-bit immediate value.

---

## 🔧 Core Components

### ✅ Arithmetic & Logic
- **4-bit ALU** – Based on Lab 3’s Ripple Carry Adder (RCA)
- **3-bit Adder** – Used for incrementing the program counter

### ✅ Control & Memory
- **Register File** – 8 registers (`R0–R7`), each 4-bit; `R0` outputs zero
- **Instruction Decoder** – Parses instruction format and sets control signals
- **Program ROM** – Stores machine instructions

### ✅ Data Flow Management
- **Multiplexers** – Used for register and ALU input selection
- **Tri-state Buses** – Shared data and instruction lines reduce wiring

---

## 🧪 Testing & Deployment

- All components were simulated and verified independently using **Vivado**
- Full processor tested using **test benches**
- Deployed on **BASYS 3 FPGA Board**
- Used slow clock (~2–3 seconds per cycle) for observation
- Output verified through **LEDs** and **7-segment displays**

---

## 💻 Tools & Technologies

- **VHDL** – Hardware Description Language
- **Vivado Design Suite** – Simulation, synthesis, bitstream generation
- **BASYS 3 FPGA Board** – Target hardware for deployment (Artix-7 FPGA)

---

## 🚀 Sample Program

The following program calculates the sum of numbers from 1 to 3 and stores the result in register `R7`:

```assembly
MOVI R1, 3       ; Initialize counter
MOVI R2, 1       ; Step value
MOVI R3, 0       ; Accumulator (sum)
ADD R3, R1       ; Add counter to sum
NEG R2           ; Step = -1
ADD R1, R2       ; Decrement counter
JZR R1, 6        ; Jump to halt if counter == 0
JZR R0, 2        ; Unconditional jump to ADD R3, R1
