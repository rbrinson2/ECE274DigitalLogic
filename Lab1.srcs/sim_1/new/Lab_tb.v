`timescale 1ns / 1ps


module Lab_tb();
    reg A_tb, B_tb, C_tb, D_tb;
    reg [3:0] Count;
    wire [2:0] I_tb;
    
    Lab1 dut(.A(A_tb), .B(B_tb), .C(C_tb), .D(D_tb), .I(I_tb));
    
    initial Count = 4'h0;
    always begin
        if (Count == 4'hF) $finish;
        else #10 Count = Count + 4'h1;
    end
    
    always @(Count)
        {A_tb, B_tb, C_tb, D_tb} = Count;
    
endmodule
