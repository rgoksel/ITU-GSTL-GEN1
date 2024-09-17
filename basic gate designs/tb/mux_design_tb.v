`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 05:19:48 PM
// Design Name: 
// Module Name: mux_design_tb
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


module mux_design_tb();
    reg A;
    reg B;
    reg btn;
    reg [1:0] S; 
    reg clk; 
    reg rst;
    wire Q1;
    wire Q2;
    
    mux_design uut(
        .A(A),
        .B(B),
        .btn(btn),
        .clk(clk),
        .S(S),
        .rst(rst),
        .Q1(Q1),
        .Q2(Q2)
    );
    
    initial begin 
        clk = 1;
        rst = 1;
        btn = 1;
        
    end
    
    always #5 clk = ~clk;
    
    initial begin
        A = 0;
        B = 0;
        btn = 0;
        S = 0;
        #10;
        
        A = 0;
        B = 1;
        btn = 1;
        S = 1;
        #10;
        
        A = 0;
        B = 0;
        btn = 0;
        S = 2;
        #10;
        
        A = 0;
        B = 1;
        btn = 1;
        S = 3;
        #10;
        
        rst = 1;
        A = 0;
        B = 1;
        btn = 1;
        S = 0;
        #10;
        $finish;
    end
    

endmodule
