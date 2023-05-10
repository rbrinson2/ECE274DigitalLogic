`timescale 1ns / 1ps

module VendingMachine_tb();

reg n_tb, d_tb, q_tb, clk_tb, rst_tb;
reg [5:0] count;
wire [5:0] num_tb;
wire c_tb;


//module VendingMachine(N, D, Q, clk, rst, [5:0] number, C);
VendingMachine dut(n_tb, d_tb, q_tb, clk_tb, rst_tb, num_tb, c_tb);



initial begin 
    clk_tb = 0; count = 3'b1; rst_tb = 1'b1;
end
always begin 
    #10 clk_tb = !clk_tb;
end 

initial begin
    #5  {rst_tb, n_tb, d_tb, q_tb} = 4'b0000;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0001;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b1000;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0100; 
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0010;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0001;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b1000;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0010; 
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0010;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0010;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b1000;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0100;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0110;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0111;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0011;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0110;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0011;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0010;
    #20 {rst_tb, n_tb, d_tb, q_tb} = 4'b0010;
end



endmodule
