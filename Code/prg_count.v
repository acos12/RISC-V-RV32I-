`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 01:32:53 PM
// Design Name: 
// Module Name: prg_count
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


module prg_count(
    input rst, clk,
    input [31:0] PC_NEXT,
    output reg [31:0] PC
    );
    
    always @(posedge clk)
        begin
            if (rst == 1'b0)
                begin
                    PC <= 32'h00000000;
                end 
            else 
                begin
                    PC <= PC_NEXT;
                end
        end 
endmodule
