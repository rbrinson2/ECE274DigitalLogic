`timescale 1ns / 1ps


module LabExam2(
    input L, R, rst, Clk,
    output reg A, B, C, D, E, F, G
    );
    
    wire clkout;
    reg [3:0]state;
    localparam off = 4'd0, allon = 4'd1;
    localparam L1 = 4'd2, L2 = 4'd3, L3 = 4'd4, L4 = 4'd5;
    localparam R1 = 4'd6, R2 = 4'd7, R3 = 4'd8, R4 = 4'd9;
    
    ClkDiv clk(Clk, 1'b0, clkout);
    
    always @(posedge clkout) begin
        case (state)
            off : begin
                if (rst) state = off;
                else if (L & ~R & ~rst) state = L1;
                else if (~L & R & ~rst) state = R1;
                else if (L & R & ~rst) state = allon;
            end
            allon : begin
                if ((L & R) | rst) state = off;
                else if (L & ~R & ~rst) state = L1;
                else if (~L & R & ~rst) state = R1;
            end
            L1 : begin
                if (L & ~R & ~rst) state = L2;
                else if (L & R & ~rst) state = allon;
                else if (~L | R | rst) state = off;
            end
            L2 : begin
                if (L & ~R & ~rst) state = L3;
                else if (L & R & ~rst) state = allon;
                else if (~L | R | rst) state = off;
            end
            L3 : begin
                if (L & ~R & ~rst) state = L4;
                else if (L & R & ~rst) state = allon;
                else if (~L | R | rst) state = off;
            end
            L4 : begin
                if (L & ~R & ~rst) state = L1;
                else if (L & R & ~rst) state = allon;
                else if (~L | R | rst) state = off;
            end
            R1 : begin
                if (~L & R & ~rst) state = R2;
                else if (L & R & ~rst) state = allon;
                else if (L | ~R | rst) state = off;
            end
            R2 : begin
                if (~L & R & ~rst) state = R3;
                else if (L & R & ~rst) state = allon;
                else if (L | ~R | rst) state = off;
            end
            R3 : begin
                if (~L & R & ~rst) state = R4;
                else if (L & R & ~rst) state = allon;
                else if (L | ~R | rst) state = off;
            end
            R4 : begin
                if (~L & R & ~rst) state = R1;
                else if (L & R & ~rst) state = allon;
                else if (L | ~R | rst) state = off;
            end
            default : state = off;
        endcase
    end
    
    always @(state) begin
        case (state)
            off     : begin A = 1'b1; B = 1'b1; F = 1'b1; G = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            allon   : begin A = 1'b0; B = 1'b0; F = 1'b0; G = 1'b0; C = 1'b1; D = 1'b1; E = 1'b1; end
            L1      : begin A = 1'b0; F = 1'b1; G = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            L2      : begin A = 1'b1; F = 1'b0; G = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            L3      : begin A = 1'b1; F = 1'b1; G = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            L4      : begin A = 1'b1; F = 1'b1; G = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1; E = 1'b1; end
            R1      : begin A = 1'b0; B = 1'b1; G = 1'b1; F = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            R2      : begin A = 1'b1; B = 1'b0; G = 1'b1; F = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            R3      : begin A = 1'b1; B = 1'b1; G = 1'b0; F = 1'b1; C = 1'b1; D = 1'b1; E = 1'b1; end
            R4      : begin A = 1'b1; B = 1'b1; G = 1'b1; F = 1'b0; C = 1'b1; D = 1'b1; E = 1'b1; end
        endcase 
    end
    
endmodule
