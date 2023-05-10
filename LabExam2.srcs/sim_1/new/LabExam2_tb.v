`timescale 1ns / 1ps


module LabExam2_tb();

reg l, r, RST, clk; 
wire a, b, c, d, e, f, g;


//module LabExam2(L, R, rst, Clk, A, B, C, D, E, F, G);
LabExam2 dut(l, r, RST, clk, a, b, c, d, e, f, g);
initial clk = 1'b0;
always begin 
    #10 clk = !clk;
end

initial begin
    RST = 1'b1;
    #15 RST = 1'b0;
    for (integer i = 0; i < 8; i = i + 1) begin
        #20 l = 1'b1; r = 1'b0;
    end
    for (integer i = 0; i < 8; i = i + 1) begin
        #20 l = 1'b0; r = 1'b1;
    end
    for (integer i = 0; i < 8; i = i + 1) begin
        #20 l = 1'b1; r = 1'b1;
    end
    for (integer i = 0; i < 2; i = i + 1) begin
        #20 l = 1'b0; r = 1'b1;
    end
    for (integer i = 0; i < 4; i = i + 1) begin
        #20 l = 1'b0; r = 1'b1; RST = 1'b1;
    end
    for (integer i = 0; i < 4; i = i + 1) begin
        #20 l = 1'b1; r = 1'b1; RST = 1'b0;
    end
    RST = 1'b1;
end

endmodule
