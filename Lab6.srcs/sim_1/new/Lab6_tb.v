`timescale 1ns / 1ps

module Lab6_tb();
    reg clk, rst, go;
    wire [4:0] count_tb;
    wire done_tb;

    Lab6 dut(.Clk(clk), .Rst(rst), .go(go), .count(count_tb), .done(done_tb));
    
    initial clk = 1'b0;
    always #200 clk = !clk;
    
    initial begin
        rst = 1'b1; go = 1'b0;
        @(posedge clk) rst = 1'b1; go = 1'b0;
        @(posedge clk) rst = 1'b0; go = 1'b0;
        @(posedge clk) rst = 1'b0; go = 1'b1;
        @(posedge clk) rst = 1'b0; go = 1'b1;
        @(posedge clk) rst = 1'b0; go = 1'b0;
    end
    
    always @(posedge done_tb) $finish;
     
endmodule
