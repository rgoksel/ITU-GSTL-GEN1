`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 04:05:38 PM
// Design Name: 
// Module Name: mux4x1
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


module mux4x1(
    input S0,
    input S1,
    input i0,
    input i1,
    input i2,
    input i3,
    output  out
    );
    
    assign out = (~S0&~S1&i0) | (S0&~S1&i1) | (~S0&S1&i2) | (S0&S1&i3);
endmodule
