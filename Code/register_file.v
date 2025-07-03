`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 02:03:39 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input WE3,
    input [31:0] WD3,
    input rst, clk,
    input [4:0] A1, A2, A3,
    output [31:0] RD1, RD2
    );
    
    // Memory Temp
    reg [31:0] registers [31:0];
    
    // Read Functionality
    assign RD1 = (!rst) ? 32'h00000000 : registers[A1];
    assign RD2 = (!rst) ? 32'h00000000 :registers[A2];
    
    // Write Functionality
    always @(posedge clk)
        begin
            if (WE3)
                begin
                    registers[A3] <= WD3;
                end
                 
        end 
     initial 
        begin
            registers[5]  = 32'h00000006;
            registers[6]  = 32'h0000000A;
        end
endmodule
