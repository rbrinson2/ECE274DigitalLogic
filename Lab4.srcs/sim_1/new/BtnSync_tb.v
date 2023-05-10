`timescale 1ns / 1ps


module BtnSync_tb();
    
    reg     BI, RST, CLK;
    wire    BO;
    
    BtnSync btn1(.bi(BI), .rst(RST), .clk(CLK), .bo(BO));
    
    initial CLK = 1'b0;
    always #10 CLK = !CLK;
    initial  begin
        RST = 1; BI = 0;
        for (integer i = 0; i < 10; i = i + 1) begin
            #(10*i) RST = 0; BI = !BI;
            #(10*i) RST = 0; BI = !BI;
        end
        for (integer i = 0; i < 10; i = i + 1) begin
            #(10*i) RST = !RST; BI = 1;
            #(10*i) RST = !RST; BI = 1;
        end
    end
    
endmodule
