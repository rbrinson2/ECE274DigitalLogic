`timescale 1ns / 1ps


module LabExam1(
    input [3:0] a,
    output reg F, G   
    );
    
    always @(a) begin
    F = ((a[1] & a[2] & a[3]) + (a[0] & a[1] & a[2]) + (a[0] & a[2] & a[3]) + (a[0] & a[1] & a[3]));
    G = ((~a[0] & ~a[1] & ~a[2] & ~a[3])
        + (~a[0] & ~a[1] & a[2] & a[3])
        + (~a[0] & a[1] & ~a[2] & a[3])
        + (~a[0] & a[1] & a[2] & ~a[3])
        + (a[0] & a[1] & ~a[2] & ~a[3])
        + (a[0] & a[1] & a[2] & a[3])
        + (a[0] & ~a[1] & ~a[2] & a[3])
        + (a[0] & ~a[1] & a[2] & ~a[3]));
    end
                
endmodule
