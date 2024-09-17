`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 03:58:59 PM
// Design Name: 
// Module Name: uart_tx_tb
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


module uart_tx_tb();
    reg [7:0] din;
    wire [7:0] data_;
    reg send;
    reg clk;
    reg rst;
    wire info;
    
    reg channel_data;
    
    uart_tx uut(
        .din(din),
        .send(send),
        .clk(clk),
        .rst(rst),
        .info(info)
    );
    uart abc(
        .info(info),
        .clk(~clk),
        .rst(rst),
        .out(data_)
    );
    
    initial begin
        clk = 0;
        rst = 1;
        send = 0;
        #2;
        rst = 0;
    end
    
    always #1 clk=~clk;
    
    initial begin

        din = 8'b00100001;
        #16; rst = 0; 
        #2; din = 8'b00110101;
        #24; send = 1;
        #2; send = 0;
        #2; din = 8'b00111111;
        #10; $finish;
        
        always @(posedge send)
        {
        
        
        
        } 
 
    end
    
    
    
endmodule
