`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 01:26:36 PM
// Design Name: 
// Module Name: nand_gate_tb
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


module nand_gate_tb();

    reg A;
    reg B;
    reg C;
    wire D;
    
    Gate nand_gate(
        .A(A),
        .B(B),
        .C(C),
        .D(D)
    );
    
    initial begin
        
        A = 0;
        B = 0;
        C = 0;
        #5;
        {A,B,C} = 3'b100;
        #5;
        {A,B,C} = 3'b010;
        #5;
        {A,B,C} = 3'b110;
        #5;
        {A,B,C} = 3'b001;
        #5;
        {A,B,C} = 3'b101;
        #5;
        {A,B,C} = 3'b011;
        #5;
        {A,B,C} = 3'b111;
        #5;
        $finish;
    end

endmodule
