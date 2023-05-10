`timescale 1ns / 1ps


module Adder_6bit(A, B, Cin, S, Co);
    
    input [5:0] A, B;
    input Cin;
    output reg [5:0] S;
    output reg Co;
    
    always @* {Co, S} = A + B + Cin; 
    
endmodule
