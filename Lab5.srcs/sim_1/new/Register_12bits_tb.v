`timescale 1ns / 1ps

module Register_12bits_tb();
    reg clk_tb, clr_tb, ld_tb;
    reg [11:0] i_tb;
    wire [11:0] q_tb;    
    
    //Register_12bits(Clk, Clr, Ld, I, Q);
    Register_12bits reg12Dut(clk_tb, clr_tb, ld_tb, i_tb, q_tb);
    
    initial clk_tb <= 0;
    always #100 clk_tb <= ~clk_tb;
    
    initial begin
        clr_tb <= 1; ld_tb <= 0; i_tb <= 12'h000;
        #150 clr_tb <= 0; ld_tb <= 0; i_tb <= 12'hABC;
        #200 clr_tb <= 0; ld_tb <= 1; i_tb <= 12'hABC;
        #200 clr_tb <= 0; ld_tb <= 1; i_tb <= 12'hFFF;
        #450 $finish;
    end
endmodule
