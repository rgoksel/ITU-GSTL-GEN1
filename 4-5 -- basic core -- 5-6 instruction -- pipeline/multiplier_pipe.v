`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 03:41:21 PM
// Design Name: 
// Module Name: multiplier_pipe
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


  module multiplier_pipe (
    input clk,
    input [3: 0] A,
    input [3: 0] B,
    output [7: 0] son
    );
    
    wire [7:0] out[3:0];
    wire [7:0] FA1;
    wire [7:0] FA2;
    genvar i;
    
    wire [7:0] FA1_reg;
    wire [7:0] FA2_reg;
    wire [7:0] ALU_son;
    
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
    reg_adder1 rfa(
        .clk(clk),
        .full_A1(FA1),
        .full_A2(FA2),
        .FA1_out(FA1_reg),
        .FA2_out(FA2_reg)
    );
    
    full_adder_32bit #(.N(8)) fa3(
        .A(FA1_reg),
        .B(FA2_reg),
        .Cin(0),
        .Sum(son),
        .Cout()
    );
    
    reg_adder2 rfa2(
        .clk(clk),
        .FA_son(son),
        .FA_son_out(ALU_out)
    );
    
endmodule

module reg_adder1(
    input clk,
    input [7:0] full_A1,
    input [7:0] full_A2,
    output reg [7: 0] FA1_out,
    output reg [7: 0] FA2_out
);
    always @(posedge clk)begin
        FA1_out <= full_A1;
        FA2_out <= full_A2;
    end
endmodule


module reg_adder2(
    input clk,
    input [7:0] FA_son,
    output reg [7: 0] FA_son_out
    );
    always @(posedge clk)begin
        FA_son_out <= FA_son;
    end
endmodule
    

