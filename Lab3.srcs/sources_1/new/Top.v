`timescale 1ns / 1ps

module Top(
    input l, r, e, rst, clk,
    output [2:0]lon, [2:0]ron
    );
    
    wire clkdiv;
    
    ClkDiv CLK(clk, rst, clkdiv);
    TurnSignal TS1(l, r, e, rst, clkdiv, lon, ron);
    
endmodule
