`timescale 1ns / 1ps


module TurnSignal_tb();

    reg L_tb, R_tb, E_tb, Rst_tb, Clk_tb;
    wire [2:0]Lon_tb;
    wire [2:0]Ron_tb;
    
    TurnSignal dut(L_tb, R_tb, E_tb, Rst_tb, Clk_tb, Lon_tb, Ron_tb);
    
    initial Clk_tb = 1'b0; 
    always #5 Clk_tb = ~Clk_tb;
    
    initial begin
        E_tb = 0; L_tb = 0; R_tb = 0; Rst_tb = 1;
        #5 E_tb = 0; L_tb = 0; R_tb = 0; Rst_tb = 1;
        #10 E_tb = 0; L_tb = 0; R_tb = 1; Rst_tb = 0;
        #50 E_tb = 0; L_tb = 1; R_tb = 0; Rst_tb = 0;
        #50 E_tb = 1; L_tb = 0; R_tb = 0; Rst_tb = 0;
        #30 E_tb = 0; L_tb = 1; R_tb = 1; Rst_tb = 0;
        #10 E_tb = 0; L_tb = 1; R_tb = 0; Rst_tb = 0;
        #10 E_tb = 1; L_tb = 1; R_tb = 0; Rst_tb = 0;
        #10 E_tb = 0; L_tb = 1; R_tb = 0; Rst_tb = 0;
        #10 E_tb = 0; L_tb = 1; R_tb = 0; Rst_tb = 0;
        #20 E_tb = 1; L_tb = 1; R_tb = 0; Rst_tb = 0;
        #30 $finish;
    end
    
endmodule
