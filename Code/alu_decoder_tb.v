`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2025 10:45:27 AM
// Design Name: 
// Module Name: alu_decoder_tb
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


module alu_decoder_tb();

    //Inputs 
    reg [1:0] alu_op;
    reg op5;
    reg funct7;
    reg [2:0] funct3;
    
    //Outputs
    wire [2:0] alu_control;
    
    alu_decoder DUT(
        .alu_op(alu_op),
        .op5(op5),
        .funct7(funct7),
        .funct3(funct3),
        .alu_control(alu_control)    
    );
    
    initial
        begin
            $display("Time\talu_op\tfunct3\top5\tfunct7\t-> alu_control");
        
            alu_op = 2'b00; op5 = 0; funct7 = 0; funct3 = 3'b000; #10;
            $display("%0dns\t%b\t%b\t%b\t%b\t-> %b", $time, alu_op, funct3, op5, funct7, alu_control);
        
            alu_op = 2'b01; op5 = 0; funct7 = 0; funct3 = 3'b000; #10;
            $display("%0dns\t%b\t%b\t%b\t%b\t-> %b", $time, alu_op, funct3, op5, funct7, alu_control);
        
            alu_op = 2'b10; op5 = 0; funct7 = 0; funct3 = 3'b010; #10;
            $display("%0dns\t%b\t%b\t%b\t%b\t-> %b", $time, alu_op, funct3, op5, funct7, alu_control);
        
            alu_op = 2'b10; op5 = 0; funct7 = 0; funct3 = 3'b110; #10;
            $display("%0dns\t%b\t%b\t%b\t%b\t-> %b", $time, alu_op, funct3, op5, funct7, alu_control);
        
            alu_op = 2'b10; op5 = 1; funct7 = 1; funct3 = 3'b000; #10;
            $display("%0dns\t%b\t%b\t%b\t%b\t-> %b", $time, alu_op, funct3, op5, funct7, alu_control);
        
            alu_op = 2'b10; op5 = 0; funct7 = 0; funct3 = 3'b111; #10;
            $display("%0dns\t%b\t%b\t%b\t%b\t-> %b", $time, alu_op, funct3, op5, funct7, alu_control);
        
            $finish;    
        end 


endmodule
