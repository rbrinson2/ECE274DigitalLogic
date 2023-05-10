`timescale 1ns / 1ps


module Lab4(
    input N, D, Q, CLK, Reset,
    output [6:0] Number,
    output [3:0] led_enable,
    output Candy
);

wire clkout, n, d, q;
wire [6:0] num;

//assign led_enable = 4'b1100;
ClkDiv clk(CLK, 1'b0, clkout);
BtnSync btn_N(N, Reset, clkout, n);
BtnSync btn_D(D, Reset, clkout, d);
BtnSync btn_Q(Q, Reset, clkout, q);
VendingMachine VM(n, d, q, clkout, Reset, num, Candy);
TwoDigitDisplay disp(CLK, num, Number, led_enable); 
    
endmodule
