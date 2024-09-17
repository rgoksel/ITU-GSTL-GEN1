`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 02:48:23 PM
// Design Name: 
// Module Name: uart_tb
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


module uart_tb();
    reg info;
    reg clk;
    reg rst;
    wire [7:0] out;
    
    uart uut(
        .info(info),
        .clk(clk),
        .rst(rst),
        .out(out)
    );
    
    initial begin
        clk = 0;
        rst = 1;
        #2;
    end
    always #1 clk = ~clk;
    initial begin
        rst = 0;
        #2; info = 1;
        #2; info = 0;
        #2; info = 1;
        #2; info = 0;
        #2; info = 1;
        #2; rst = 1;
        #2; rst = 0;
        #2; info = 1;
        #2; info = 0;//
        #2; info = 0;
        #2; info = 1;
        #2; info = 1;
        #2; info = 0;
        #2; info = 1;
        #2; info = 1;
        #2; info = 0;
        #2; info = 1;
        #2; info = 1;
        #2; info = 0;
        #2; info = 1;
        #2; info = 1;
        
        #2; $finish;
 
    end
endmodule
