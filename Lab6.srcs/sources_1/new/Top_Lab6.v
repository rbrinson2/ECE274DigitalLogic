`timescale 1ns / 1ps


module Top_Lab6(clk, btnU, led, seg, an);
    input clk; // clk is 100-MHz clock signal
    input btnU; // btnU (Up Push button) is Reset
    output [0:0] led; // led [0] is done
    output [0:6] seg; //seg[0] = CA, seg[1] = CB, ..., seg[6] = CG;
    output [3:0] an; //enable each digit of the 4 digits
    
    wire clkOut;
    wire [6:0] num, in1, in0;
    
    assign num = led ? in1 : in0;
    
    Lab6 Lab6(.Clk(clkOut), .Rst(btnU), .go(1'b1), .count(in0), .done(led), .R_data_out(in1));
    ClkDiv clkDiv(.Clk(clk), .Rst(1'b0), .ClkOut(clkOut));
    TwoDigitDisplay disp(.Clk(clk), .Number(num), .out7(seg), .en_out(an));
    
endmodule
