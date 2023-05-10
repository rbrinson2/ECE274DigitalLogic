`timescale 1ns / 1ps


module BtnSync(
    input       bi, rst, clk,
    output  reg bo
    );
    
    reg [1:0] state;
    localparam waitrise = 0, pulse = 1, waitfall = 2;
    
    always @(posedge clk) begin
        if (rst) state <= waitrise;
        case (state) 
            waitrise : begin
                if (bi)         state <= pulse;
                else if (!bi)   state <= waitrise;
            end
            pulse : begin
                if (bi)         state <= waitfall;
                else if (!bi)   state <= waitrise;
            end
            waitfall : begin 
                if (bi)         state <= waitfall;
                else if (!bi)   state <= waitrise;
            end
            default : state <= waitrise;
        endcase
    end
    
    always @(state) begin
        case (state) 
            waitrise :  bo <= 1'b0;
            pulse :     bo <= 1'b1;
            waitfall :  bo <= 1'b0;
        endcase 
    end
    
endmodule
