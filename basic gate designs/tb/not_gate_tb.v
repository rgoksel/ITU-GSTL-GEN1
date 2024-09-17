`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:38:41 PM
// Design Name: 
// Module Name: not_gate_tb
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


module not_gate_tb();

    reg A;
    wire D;
    
    
    not_gate1 ntb(
        .A(A),
        .Out(D)
    );
    
    
    initial begin
    
        A = 0;
        #5;
        A = 1;
        #5;
        A = 0;
        #5;
        A = 1;
        #5;
        A = 0;
        #5;
        $finish;
    end 
         
endmodule
