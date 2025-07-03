`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2025 08:26:09 AM
// Design Name: 
// Module Name: single_cycle_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module single_cycle_top(
    input clk, rst
    );
    
    wire [31:0] PC_A, RD_Instr, RD1_A, imm_ext_B, ALU_result, Read_data, PC_plus4, RD2_A,srcB, result;
    wire reg_write, mem_write, alu_src, result_src;
    wire [1:0] imm_src;
    wire [2:0] ALUcontrol_top;
    // Program Counter
    prg_count PC(
        .clk(clk),
        .rst(rst),
        .PC(PC_A),
        .PC_NEXT(PC_plus4)
    
    );
    
    
    // Instruction Memory
    inst_memory IM(
        .rst(rst),
        .A(PC_A),
        .RD(RD_Instr)
    );
   
    
    // Register File
    register_file RF(
        .clk(clk),
        .rst(rst), 
        .WE3(reg_write),
        .WD3(result), 
        .A1(RD_Instr[19:15]),
        .A2(RD_Instr[24:20]),
        .A3(RD_Instr[11:7]),
        .RD1(RD1_A),
        .RD2(RD2_A)
        
    );
    
    // Mux
    mux mux_register_to_ALU(
        .a(RD2_A),
        .b(imm_ext_B),
        .c(srcB),
        .s(alu_src)
    
    );
    
    // Sign extend Block
    sign_extend_B SEB(
        .in(RD_Instr),
        .imm_src(imm_src[0]),
        .imm_ext(imm_ext_B)
    
    );
    

    // ALU Block
    alu ALU(
        .A(RD1_A), 
        .B(srcB),
        .ALUControl(ALUcontrol_top),
        .Result(ALU_result),
        .zero(),
        .neg(),
        .overflow(),
        .carry()        
    );
    
    control_unit_top CUT(
        .op(RD_Instr[6:0]),
        .pc_src(), 
        .result_src(result_src), 
        .mem_write(mem_write), 
        .alu_src(alu_src),
        .reg_write(reg_write),
        .imm_src(imm_src),
        .alu_control(ALUcontrol_top),
        .funct3(RD_Instr[14:12]),
        .funct7(),
        .zero()    
    
    );
    
    data_mem DM(
        .A(ALU_result), 
        .WD(RD2_A), 
        .clk(clk), 
        .rst(rst), 
        .WE(mem_write), 
        .RD(Read_data)
    
    
    
    );
    
    
    // MUX For Data Memory
    mux mux_datamem_to_register(
        .a(ALU_result),
        .b(Read_data),
        .c(result),
        .s(result_src)    
    );
    
    PC_Adder PCA(
        .a(PC_A),
        .b(32'd4),
        .c(PC_plus4)
        
    );
    
endmodule
