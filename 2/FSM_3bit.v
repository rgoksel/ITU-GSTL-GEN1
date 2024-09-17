`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 03:14:50 PM
// Design Name: 
// Module Name: FSM_3bit
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


module FSM_3bit(
    input signal,
    input clk,
    input rst,
    output reg led
    );
    
    reg [2:0] S;
    //data kaybýýný önlemek için baþlangýc durumu eklemeliydin!!!!
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            led <= 0;
            S <= 3'b000;
        end else begin
            case (S)
                3'b000: begin
                    if (signal == 0) begin
                        led = 0;
                        S <= 3'b010;
                    end else begin
                        led = 0;
                        S <= 3'b001; 
                    end
                end
                3'b001: begin
                    if (signal == 0) begin
                        led <= 0;
                        S <= 3'b000;
                    end else begin 
                        led <= 0;
                        S <= 3'b011; 
                    end
                end
                3'b010: begin
                    if (signal == 0) begin
                        led <= 0;
                        S <= 3'b100;
                    end else begin 
                        led <= 0;
                        S <= 3'b001; 
                    end
                end
                3'b011: begin
                    if (signal == 0) begin
                        led <= 0;
                        S <= 3'b000;
                    end else begin 
                        led <= 0;
                        S <= 3'b101; 
                    end
                end
                3'b100: begin 
                    if (signal == 0) begin
                        led <= 1;
                        S <= 3'b100;
                    end else begin 
                        led <= 0;
                        S <= 3'b001;
                    end
                end
                3'b101: begin
                    if (signal == 0) begin
                        led <= 0;
                        S <= 3'b000;
                    end else begin
                        led <= 1;
                        S <= 3'b101; 
                    end
                end
            endcase 
        end
        //default da eklemen gerekirdi
    end
endmodule
