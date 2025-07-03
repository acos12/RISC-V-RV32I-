`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2025 05:29:39 PM
// Design Name: 
// Module Name: alu_decoder
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


module alu_decoder(
    input [1:0] alu_op,
    input op5, funct7,
    input [2:0] funct3,
    output [2:0] alu_control
    );
    
    wire [1:0] concatenation;
    assign concatenation = {op5, funct7};
    assign alu_control = (alu_op == 2'b00) ? 3'b000:
                         (alu_op == 2'b01) ? 3'b001:
                         ((alu_op == 2'b10) & (funct3 == 3'b010)) ? 3'b101:
                         ((alu_op == 2'b10) & (funct3 == 3'b110)) ? 3'b011:   
                         ((alu_op == 2'b10) & (funct3 == 3'b111)) ? 3'b010:   
                         ((alu_op == 2'b10) & (funct3 == 3'b000) & (concatenation == 2'b11)) ? 3'b001:
                         ((alu_op == 2'b10) & (funct3 == 3'b000) & (concatenation != 2'b11)) ? 3'b000 : 3'b000;
                            
    
endmodule
