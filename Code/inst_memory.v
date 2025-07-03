`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 01:11:26 PM
// Design Name: 
// Module Name: inst_memory
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


module inst_memory(
    input [31:0] A,
    input rst,
    output [31:0] RD
    );
    
    // Memory 
    reg [31:0] Mem [1023:0]; // So this is 1024 registers and each register is 32 bits long
    
   
    assign RD = (rst == 1'b0 ) ? 32'h00000000 : Mem[A[31:2]];
    
    initial 
        begin
//            Mem[0] = 32'hFFC4A303;
//            Mem[1] = 32'h00832383;
              Mem[0] = 32'h0062E233;

        end
endmodule
