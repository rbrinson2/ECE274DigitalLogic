`timescale 1ns / 1ps

module Problem2(
    input [1:0] A, B, C,
    output reg Z
    );
    
    always @(A, B, C) 
        Z = ((~A[1]&B[1]&~C[1]) | (A[1]&~B[1]&C[1])) 
            & ((~A[0]&B[0]&~C[0]) | (A[0]&~B[0]&C[0]));
    
endmodule
