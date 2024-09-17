`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:13:22 PM
// Design Name: 
// Module Name: or_gate_tb
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


module or_gate_tb();
    reg A;
    reg B;
    wire Q;
    
    or_gate1 uut(
        .A(A),
        .B(B),
        .Q(Q)
    );
    
    initial begin
        A = 0;
        B = 0;
        #5;
        A = 0;
        B = 1;
        #5;
        A = 1;
        B = 0;
        #5;
        A = 1;
        B = 1;
        #5;
        A = 0;
        B = 0;
        #5;
        $finish;
    end

endmodule

