`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2025 04:45:01 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder(
    output pc_src, result_src, mem_write, alu_src,reg_write,
    output [1:0] imm_src, alu_op,
    input zero,
    input [6:0] op
    
    );
    
    // interim wire
    wire branch;
    
    assign reg_write = ((op == 7'b0000011) | (op == 7'b0110011)) ? 1'b1 : 1'b0;
    assign mem_write = ((op == 7'b0100011) ? 1'b1 : 1'b0);
    assign result_src = ((op == 7'b0000011) ? 1'b1 : 1'b0);
    assign alu_src = ((op == 7'b0000011) | (op == 7'b0100011)) ? 1'b1 : 1'b0; 
    assign branch = ((op == 7'b1100011) ? 1'b1 : 1'b0);
    assign imm_src = ((op == 7'b0100011) ? 2'b01 : (op == 7'b1100011) ? 2'b10 : 2'b00);
    assign alu_op = ((op == 7'b0110011) ? 2'b10 : (op == 7'b1100011) ? 2'b01 : 2'b00);
    assign pc_src = zero & branch;
    
    
    
     
endmodule
