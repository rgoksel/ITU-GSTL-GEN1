`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 04:25:29 PM
// Design Name: 
// Module Name: mux_4x1_tb
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


module mux_4x1_tb();

    reg S0;
    reg S1;
    reg i0;
    reg i1;
    reg i2;
    reg i3;
    wire out;
    
    mux4x1 uut(
        .S0(S0),
        .S1(S1),
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .out(out)
    );
    
    initial begin
        S0 = 0;
        S1 = 0;
        i0 = 1;
        i1 = 0;
        i2 = 0;
        i3 = 0;
        #5;
        S0 = 1;
        S1 = 0;
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 0;
        #5;
        S0 = 0;
        S1 = 1;
        i0 = 0;
        i1 = 0;
        i2 = 1;
        i3 = 0;
        #5;
        S0 = 1;
        S1 = 1;
        i0 = 0;
        i1 = 0;
        i2 = 0;
        i3 = 1;
        #5;
        $finish;
    end
        
endmodule
