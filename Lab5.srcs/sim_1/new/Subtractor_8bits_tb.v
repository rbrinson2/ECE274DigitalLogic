`timescale 1ns / 1ps


module Subtractor_8bits_tb();
    
    reg [7:0] A, B;
    wire [7:0] S;
    
    Subtractor_8bits sub8Dut(A,B,S);
    
    initial begin
        A <= 8'd00; B <= 8'd00;
        #100 A <= 8'd100; B <= 8'd50;
        #100 A <= 8'd150; B <= 8'd150;
        #100 A <= 8'd50; B <= 8'd0;
        #100 A <= 8'd50; B <= 8'd100;
        #100 $finish;
    end
    
endmodule
