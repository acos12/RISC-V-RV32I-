`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2025 10:22:00 AM
// Design Name: 
// Module Name: sign_extend_B
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


module sign_extend_B(
    input [31:0] in,
    output [31:0] imm_ext,
    input imm_src
    );
    
    assign imm_ext = (imm_src == 1'b1) ? ({{20{in[31]}} ,in[31:25],in[11:7]}):
                                         {{20{in[31]}},in[31:20]};
    
    
endmodule
