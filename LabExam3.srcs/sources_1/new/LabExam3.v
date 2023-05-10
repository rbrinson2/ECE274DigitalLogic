`timescale 1ns / 1ps


module LabExam3(go, done, average, max, clk, rst);
    //Input
    input go, clk, rst;
 
    //Output
    output reg done;
    output reg [7:0] average, max;
    
    //Internal signals
    reg ren, wen;
    reg [4:0] i;
    reg [11:0] sum; 
    reg [7:0] temp, wdata;
    wire [7:0] rdata; 
    
    //Instantiation
    Register16_8 reg16x8(.R_Addr(i), .W_Addr(i), .R_en(ren), .W_en(wen), .R_Data(rdata), .W_Data(wdata), .Clk(clk), .Rst(rst));
    
    //States
    parameter s1 = 1, s2 = 2, s3 = 3, s4 = 4, s5 = 5;
    parameter s6 = 6, s7 = 7, s8 = 8, s9 = 9;
    reg [3:0] state;
    
    //HLSM portion
    always @(posedge clk) begin
        if (rst) state = s1;
        else begin
            case (state)
                s1 : begin
                    if (!go) state = s1;
                    else if (go) state = s2;
                end
                s2 : state = s3;
                s3 : begin
                    if (i < 5'd16) state = s5;
                    else if (i >= 5'd16) state = s4;
                end
                s4 : state = s1;
                s5 : begin
                    if (temp > max) state = s6;
                    else state = s7;
                end
                s6 : state = s7;
                s7 : begin
                    if (temp >= 100) state = s8;
                    else state = s9;
                end
                s8 : state = s9;
                s9 : state = s3;
                default : state = s1;
            endcase
        end
    end
    
    //Signals portion
    always @(state) begin
        case (state)
            s1 : begin
                done = 1'b0; max = 8'b0; average = 8'b0; i = 5'b0; sum = 12'b0;
                temp = 8'b0;
                ren = 1'b0; wen = 1'b0;
            end
            s2 : begin
                done = 1'b0; max = 8'b0; average = 8'b0; i = 5'b0; sum = 12'b0;
                temp = 8'b0;
                ren = 1'b0; wen = 1'b0;
            end
            s3 : begin
            end
            s4 : begin
                done = 1'b1;
                average = sum / 8'd16;
                #100 $finish;
            end
            s5 : begin
                ren = 1'b1;
                #10 temp = rdata;
                #10 sum = sum + temp;
            end
            s6 : begin
                max = temp;
            end
            s7 : begin 
                ren = 1'b0;
            end
            s8 : begin
                wen = 1'b1;
                wdata = temp - 8'd100;
            end
            s9 : begin
                wen = 1'b0;
                i = i + 1'b1;
            end
        endcase
    end
endmodule
