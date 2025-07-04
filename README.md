# RISC-V-RV32I
Single-cycle 32-bit RISC-V (RV32I) processor implemented in Verilog targetting Nexys A7 FPGA, using the MERL Accelerating Guide as a reference
![image](https://github.com/user-attachments/assets/8a8a11df-c134-4c35-a32c-6af84a756722)
This is a elaborate design of what I have accomplished so far
____________________________________________________________________________________________________________________________________________________________________________________________________________
This project is a 32-bit single-cycle RISC-V (RV32I) processor implemented in Verilog targetting Nexys A7 FPGA. Using the MERL Accelerating Guide as a reference, I designed the full datapath and control logic from scratch, including the ALU, register file, instruction and data memory, sign extender, and program counter. The processor supports a subset of RISC-V base instructions and executes each instruction in one clock cycle. The design was developed and simulated in Vivado, with waveform verification for all major control signals and functional units. This project helped reinforce core principles in computer architecture, RTL design, and FPGA-based prototyping. I am working on adding on to this design in the near future:


Future Plans:

  1)Upgrade the single-cycle CPU to a 5-stage pipelined RISC-V processor (IF, ID, EX, MEM, WB).
  
  2)Implement hazard detection and data forwarding units to handle pipeline dependencies.
  
  3)Use SystemVerilog + UVM (Universal Verification Methodology) to verify core functionality and edge cases.


EXAMPLES:
![image](https://github.com/user-attachments/assets/2293392f-c7dc-47f2-ab65-9f98a5697e2a)

ALU at work Bitwise OR 6 and 10 which is 14!!!

