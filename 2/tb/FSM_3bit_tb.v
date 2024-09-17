`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 04:01:57 PM
// Design Name: 
// Module Name: FSM_3bit_tb
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


module FSM_3bit_tb();
    reg signal;
    reg clk;
    reg rst;
    wire led;
    
    FSM_3bit uut(
        .signal(signal),
        .clk(clk),
        .rst(rst),
        .led(led)
    );
    
    always #1 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1;
        #5
        rst = 0;
        signal = 0;
        #5
        signal = 0;
        #5
        signal = 1;
        #5
        signal = 0;
        #5
        signal = 1;
        #5
        signal = 1;
        #5
        signal = 1;
        #5
        signal = 0;
        #5
        signal = 1;
        #5
        signal = 0;
        #5
        signal = 0;
        #5
        signal = 0;
    end
endmodule
