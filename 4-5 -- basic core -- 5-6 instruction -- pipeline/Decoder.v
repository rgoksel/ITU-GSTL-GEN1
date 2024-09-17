`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 02:27:11 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [13:0] inst,
    output [3:0] rd, 
    output [3:0] rs1,
    output [3:0] rs2,
    output [7:0] imm,
    output w,
    output [3:0] control
    );
    
    assign rd = inst[13:10];
    assign rs2 = inst[9:6];
    assign rs1 = inst[5:2];
    assign imm = inst [9:2];
    assign w = inst[1] & inst [0];
    assign control[3] = inst[1] ;
    assign control[2] = inst[10];
    assign control[1] = inst[11];
    assign control[0] = inst[0];
  
endmodule
