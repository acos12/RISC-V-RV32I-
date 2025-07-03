`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2025 02:24:55 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input [31:0] A, WD,
    input clk, rst, WE,
    output [31:0] RD
    );
    
    reg [31:0] data_m [1023:0];
    
    // Read
    assign RD = (~rst) ? 32'd0 : data_m[A];
    
    // Write
    always @(posedge clk)
        begin
            if (WE) 
                begin
                    data_m [A] <= WD;
                end 
        end 
    
    initial 
        begin
            data_m[28] = 32'h00000020;
            data_m[40] = 32'h00000002;
            
        end
    
endmodule
