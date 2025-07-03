`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2025 01:39:34 PM
// Design Name: 
// Module Name: ALU
// Project Name: RISC-V Single Cycle CPU ALU Module 
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

// Flags implemented for error detection
//      Zero Flag: 
//      Negative Flag: Neg or Positive number.
//      Carry Bit: If there is a carry over number it will be represented.
//      Overflow: Input signs are different from output signs. 

module alu(

    // Inputs
    input [31:0] A, B,
    input [2:0] ALUControl,
    
    //Output
    output [31:0] Result,
    output zero,
    output neg,
    output overflow,
    output carry
);
    
    // Declare wire
    wire [31:0] a_and_b;
    wire [31:0] a_or_b;
    wire [31:0] b_not;
    wire [31:0] ALU_mux1;
    wire [31:0] sum;
    wire [31:0] ALU_mux2;
    wire cout;
    wire [31:0] slt; 
    
    // Basic Logic Design
    assign a_and_b = A & B;  // AND Operation
    assign a_or_b = A | B;   // OR Operation 
    assign b_not = ~B;       // NOT Operation   
    
    // Ternary Operator
    assign ALU_mux1 = (ALUControl[0] == 1'b0) ? B : b_not;
    
    // Addition / Subtraction Operator
    //assign {sum, cout} = A + ALU_mux1 + ALUControl[0];
    wire [32:0] full_sum; 
    assign full_sum = A + ALU_mux1 + ALUControl[0];  
    assign sum = full_sum[31:0];                     
    assign cout = full_sum[32]; 
    
    // 4 * 1 MUX
    assign ALU_mux2 = (ALUControl[2:0] == 3'b000) ? sum :
                      (ALUControl[2:0] == 3'b001) ? sum : 
                      (ALUControl[2:0] == 3'b010) ? a_and_b : 
                      (ALUControl[2:0] == 3'b011) ? a_or_b :
                      (ALUControl[2:0] == 3'b101) ? slt : 32'h00000000;
                      
                      
    // Zero Extension
    assign slt = {31'b0000000000000000000000000000000,sum[31]};   
                   
    //Flags Assignments
    assign zero = &(~Result);
    assign neg = Result[31]; // Negative Flag: The MSB of the result because of signed and unsiged numbers. 
    assign carry = cout & (~ALUControl[1]); // Carry Flag 
    //assign overflow = (~ALUControl[1]) & (A[31] ^ sum[31]) & (~(A[31] ^ B[31] ^ ALUControl[0])); // Overflow Flag 
    assign overflow = (~ALUControl[1]) & (A[31] == ALU_mux1[31]) & (sum[31] != A[31]);

    // Results 
    assign Result = ALU_mux2; 
   
endmodule
