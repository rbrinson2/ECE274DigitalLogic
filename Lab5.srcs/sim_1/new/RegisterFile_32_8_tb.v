`timescale 1ns / 1ps


module RegisterFile_32_8_tb();
    //Input
    reg [4:0] R_Addr, W_Addr;
    reg R_en, W_en, Clk, Rst;
    reg [7:0] W_Data;
    //Output
    wire [7:0] R_Data;
    
    RegisterFile_32_8 reg32x8Dut(R_Addr, W_Addr, R_en, W_en, R_Data, W_Data, Clk, Rst);
    
    initial Clk = 0;
    always #100 Clk = ~Clk;
    
    
    initial begin
        Rst = 1; W_en = 0; W_Addr = 5'd0; W_Data = 8'h00; R_en = 0; R_Addr = 8'd0; 
        @(posedge Clk);
        #50 Rst = 0; W_en = 0; W_Addr = 5'd0; W_Data = 8'h00; R_en = 1; R_Addr = 8'd1; 
        @(posedge Clk)
        #50 Rst = 0; W_en = 1; W_Addr = 5'd0; W_Data = 8'hAB; R_en = 1; R_Addr = 8'd1; 
        @(posedge Clk)
        #50 Rst = 0; W_en = 0; W_Addr = 5'd0; W_Data = 8'hAB; R_en = 1; R_Addr = 8'd0; 
        @(posedge Clk)
        #50 Rst = 0; W_en = 1; W_Addr = 5'd22; W_Data = 8'hFF; R_en = 0; R_Addr = 8'd0;
        @(posedge Clk) 
        #50 Rst = 0; W_en = 0; W_Addr = 5'd22; W_Data = 8'hFF; R_en = 1; R_Addr = 8'd22;
        
    end
    
    
endmodule
