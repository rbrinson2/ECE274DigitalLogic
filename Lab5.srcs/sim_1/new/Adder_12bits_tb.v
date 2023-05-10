`timescale 1ns / 1ps


module Adder_12bits_tb( );
    reg [11:0] a_tb, b_tb;
    reg cin_tb;
    wire [11:0] s_tb;
    wire co_tb;
    //Adder_12bits(A, B, Cin, S, Co);
    Adder_12bits adder12Dut(a_tb, b_tb, cin_tb, s_tb, co_tb);
    
    initial begin
        a_tb <= 12'hc23; b_tb <= 12'h0b4; cin_tb <= 0;
        #100 a_tb <= 12'hc23; b_tb <= 12'h0b4; cin_tb <= 1;
        #100 a_tb <= 12'h023; b_tb <= 12'h0b4; cin_tb <= 1;
        #100 a_tb <= 12'hfff; b_tb <= 12'h000; cin_tb <= 1;
        #100 a_tb <= 12'hfff; b_tb <= 12'h00f; cin_tb <= 0;
        #100 $finish;
    end
endmodule
