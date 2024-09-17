`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 04:25:02 PM
// Design Name: 
// Module Name: Multiplier
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


  module Multiplier (
    input clk,
    input [3: 0] A,
    input [3: 0] B,
    output [7: 0] son
    );
    
    wire [7:0] out[3:0];
    wire [7:0] FA1;
    wire [7:0] FA2;
    genvar i;
    
    assign out[0] = {A &{ 4{B[0]}}};
    assign out[1] = {A &{ 4{B[1]}}} << 1;
    assign out[2] = {A &{ 4{B[2]}}} << 2;
    assign out[3] = {A &{ 4{B[3]}}} << 3;
    
    full_adder_32bit #(.N(8)) fa1(
        .A(out[0]),
        .B(out[1]),
        .Cin(0),
        .Sum(FA1),
        .Cout()
    );

    full_adder_32bit #(.N(8)) fa2(
        .A(out[2]),
        .B(out[3]),
        .Cin(0),
        .Sum(FA2),
        .Cout()
    );
    
    full_adder_32bit #(.N(8)) fa3(
        .A(FA1),
        .B(FA2),
        .Cin(0),
        .Sum(son),
        .Cout()
    );
    
endmodule



