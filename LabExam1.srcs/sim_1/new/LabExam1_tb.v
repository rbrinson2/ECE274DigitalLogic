`timescale 1ns / 1ps


module LabExam1_tb();

    reg [3:0] A_tb;
    reg [3:0] count;
    wire F_tb, G_tb;
    
    
    LabExam1 dut (A_tb, F_tb, G_tb);
    
    initial count = 4'h0;
    always begin
        if (count == 4'hF) $finish;
        else #10 count = count + 4'h1;
    end
    
    always @(count) begin
        A_tb = count;
    end

endmodule
