`timescale 1ns / 1ps

module Lab6(Clk, Rst, go, count, done, R_data_out);
    input Clk, Rst, go;
    output reg [7:0] R_data_out;
    output reg [4:0] count;
    output reg done;
    
    
    RegFile16x8 reg16x8(.R_Addr(radd), .W_Addr(wadd), .R_en(ren), .W_en(wen), .R_Data(rdata), .W_Data(wdata), .Clk(Clk), .Rst(Rst), 
        .debug_Reg0 (debug_Reg0 ), 
        .debug_Reg1 (debug_Reg1 ), 
        .debug_Reg2 (debug_Reg2 ), 
        .debug_Reg3 (debug_Reg3 ), 
        .debug_Reg4 (debug_Reg4 ), 
        .debug_Reg5 (debug_Reg5 ), 
        .debug_Reg6 (debug_Reg6 ), 
        .debug_Reg7 (debug_Reg7 ), 
        .debug_Reg8 (debug_Reg8 ), 
        .debug_Reg9 (debug_Reg9 ), 
        .debug_Reg10(debug_Reg10),
        .debug_Reg11(debug_Reg11),
        .debug_Reg12(debug_Reg12),
        .debug_Reg13(debug_Reg13),
        .debug_Reg14(debug_Reg14),
        .debug_Reg15(debug_Reg15)
        );
    
    reg wen, ren, ren1, ren2;
    reg [3:0] State, State2, radd, wadd;
    reg [4:0] i, i2;
    reg [7:0] wdata, temp;
    reg [13:0] k;
    wire [7:0] rdata;
    (* mark_debug = "true" *) wire [7:0] debug_Reg8;
    
    parameter S1 = 1, S2 = 2, S3 = 3, S4 = 4, S5 = 5, S6 = 6, S7 = 7;
    parameter s_done = 1, s_wait = 2, s_disp = 3, s_wait2 = 4, s_disp2 = 5, s_disp_done = 6; 
    
    always radd = done ? i2 : i;
    always ren = done ? ren2 : ren1;
    //Part A
    always @(posedge Clk)begin
        if (Rst) State = S1;
        else begin
            case (State)
                S1 : begin
                    if (!go) State = S1;
                    else if (go) State = S2;
                end
                S2 : begin
                    done = 1'b0; count = 5'b0; i = 5'b0;
                    ren1 = 1'b0; wen = 1'b0;
                    State = S3;
                end
                S3 : begin
                    if (i <= 4'd15) begin
                        State = S5;
                        ren1 = 1'b1;
                        //radd = i;
                    end
                    else State = S4;
                end
                S4 : begin
                    done = 1'b1;
                end
                S5 : begin
                    temp = rdata;
                    if (temp > 8'd47 && temp < 8'd58) begin
                        State = S6;
                        wen = 1'b1;
                        wadd = i;
                    end
                    else State = S7;
                end
                S6 : begin
                    count = count + 5'b1;
                    wdata = temp - 8'd47;
                    State = S7;
                end
                S7 : begin
                    ren1 = 1'b0; wen = 1'b0;
                    i = i + 1'b1;
                    State = S3;
                end
                default : State = S1; 
            endcase
        end
    end
    
    //Bart B
    always @(posedge Clk) begin
        if (Rst) State2 = s_done;
        else begin
            case (State2)
                s_done : begin
                    i2 = 5'b0; k = 14'b0;
                    State2 = s_disp;
                end
                s_wait : begin
                    if (k < 10000) begin
                        k = k + 1'b1;
                        State2 = s_wait;
                    end
                    else State2 = s_disp;
                end
                s_disp : begin
                    ren2 = 1'b1; //radd = i2; 
                    R_data_out = rdata;
                    k = 14'b0;
                    State2 = s_wait2;
                end
                s_wait2 : begin
                    ren2 = 1'b1; //radd = i2; 
                    R_data_out = rdata;
                    if (k < 10000) begin
                        k = k + 1'b1;
                        State2 = s_wait2;
                    end
                    else State2 = s_disp2;
                end
                s_disp2 : begin
                    ren2 = 1'b1; //radd = i2; 
                    R_data_out = rdata;
                    k = 14'b0;
                    if (i2 < 15) begin
                        i2 = i2 + 1'b1;
                        State2 = s_wait2;
                    end
                    else State2 = s_disp_done;
                end
                s_disp_done : begin
                    ren2 = 1'b1; //radd = i2; 
                    R_data_out = rdata;
                    State2 = s_disp_done;
                end
            endcase
        end
    end
endmodule