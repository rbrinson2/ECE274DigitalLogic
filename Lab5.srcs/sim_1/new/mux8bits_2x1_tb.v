`timescale 1ns / 1ps


module mux8bits_2x1_tb( );
    reg [7:0] i1_tb, i0_tb;
    reg s_tb;
    wire [7:0] d_tb;
    
    //mux8bits_2x1(s, I1, I0, D);
    mux8bits_2x1 muxDut(s_tb, i1_tb, i0_tb, d_tb);
    
    initial begin
        s_tb <= 0; i1_tb <= 8'd255; i0_tb <= 8'd100;
        #100 s_tb <= 1; i1_tb <= 8'd255; i0_tb <= 8'd100;
        #100 s_tb <= 1; i1_tb <= 8'd24; i0_tb <= 8'd39;
        #100 s_tb <= 0; i1_tb <= 8'd24; i0_tb <= 8'd39;
        #100 $finish;
    end 

endmodule
