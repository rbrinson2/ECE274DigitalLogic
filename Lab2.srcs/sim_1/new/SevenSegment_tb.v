`timescale 1ns / 1ps


module SevenSegment_tb();

    reg [3:0] numin_tb;
    reg [3:0] count;
    wire [6:0] segout_tb;
    
    SevenSegment dut (numin_tb, segout_tb);
    
    initial count = 4'h0;
    always begin 
        if (count == 4'hF) $finish;
        else #10 count = count + 4'h1;
    end
    
    always @(count) begin
        numin_tb = count;
    end

endmodule
