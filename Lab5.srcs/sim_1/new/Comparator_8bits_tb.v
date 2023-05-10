`timescale 1ns / 1ps

module Comparator_8bits_tb();
    reg [7:0] a_tb, b_tb;
    wire altb_tb, aeqb_tb, agtb_tb;
    
    //Comparator_8bits(A, B, AltB, AeqB, AgtB);
    Comparator_8bits compDut(a_tb, b_tb, altb_tb, aeqb_tb, agtb_tb);
    
    initial begin 
        a_tb <= 8'd175; b_tb <= 8'd100;
        #100 a_tb <= 8'd10; b_tb <= 8'd200;
        #100 a_tb <= 8'd45; b_tb <= 8'd45;
        #100 $finish;
    end
    
endmodule
