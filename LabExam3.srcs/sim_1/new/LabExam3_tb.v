`timescale 1ns / 1ps

module LabExam3_tb();

reg CLK, RST, GO;
wire done;
wire [7:0] max, average;

LabExam3 dut(.go(GO), .done(done), .average(average), .max(max), .clk(CLK), .rst(RST));

initial CLK = 1'b0;
always #100 CLK = !CLK;

initial begin
    RST = 1'b1; GO= 1'b0;
    #100;
    @(posedge CLK) RST = 1'b1; GO = 1'b0;
    @(posedge CLK) #10 RST = 1'b0; GO = 1'b0;
    @(posedge CLK) #10 RST = 1'b0; GO = 1'b1;
    @(posedge CLK) #10 RST = 1'b0; GO = 1'b0;
end

endmodule
