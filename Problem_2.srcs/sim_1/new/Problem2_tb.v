`timescale 1ns / 1ps


module Problem2_tb();
    reg [1:0] A_tb, B_tb, C_tb;
    reg [5:0] Count;
    wire Z_tb;
    
    Problem2 dut(A_tb, B_tb, C_tb, Z_tb);
    
    initial Count = 6'h00;
    always begin
        if (Count == 6'h3F) $finish;
        else #10 Count = Count + 6'h01;
    end
    
    always @(Count)
        {A_tb, B_tb, C_tb} = Count;

endmodule
