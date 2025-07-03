`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2025 05:11:20 PM
// Design Name: 
// Module Name: control_unit_top
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


module control_unit_top(
    // All the Inputs and Outputs
    input [6:0] op, funct7,
    input [2:0] funct3,
    input zero,
    output pc_src, result_src, mem_write, alu_src,reg_write,
    output [1:0] imm_src,
    output [2:0] alu_control
);

    wire [1:0]alu_op;
        

    main_decoder MD(
        .op(op),
        .zero(zero),
        .pc_src(pc_src), 
        .result_src(result_src), 
        .mem_write(mem_write), 
        .alu_src(alu_src),
        .reg_write(reg_write),
        .imm_src(imm_src),
        .alu_op(alu_op)    
    
    );
    
    alu_decoder AD(
        .alu_op(alu_op),
        .op5(op),
        .funct3(funct3),
        .funct7(funct7),
        .alu_control(alu_control)
      
    );
    


endmodule
