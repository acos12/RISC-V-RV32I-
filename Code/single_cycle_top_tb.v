`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2025 03:11:42 PM
// Design Name: 
// Module Name: single_cycle_top_tb
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


module single_cycle_top_tb();

    reg clk = 1'b1 , rst;
    
    single_cycle_top DUT(
        .clk(clk),
        .rst(rst)
    );
    
    
    always 
        begin
            clk = ~clk;
            #50;
            
            
        end
    
    initial
        begin
            rst = 1'b0;
            #100;
            
            rst = 1'b1;
            #300;
            $finish;
            
        end
            
    
    
    
        
        
endmodule
