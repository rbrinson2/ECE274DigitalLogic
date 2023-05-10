`timescale 1ns / 1ps


module TurnSignal(
    input L, R, E, Rst, Clk,
    output reg [2:0]Lon, reg [2:0]Ron
    );
    
    reg [2:0] state, state_next;
    
    localparam off = 3'b000, allon = 3'b001, 
                ron1 = 3'b010, ron2 = 3'b011, ron3 = 3'b100, 
                lon1 = 3'b101, lon2 = 3'b110, lon3 = 3'b111;
    
    //State transitions
    always @(posedge Clk or posedge Rst) begin
        if (Rst) state <= off;
        else if (Clk) state <= state_next;
    end
    
    //States
    always @(Clk) begin
        case (state)
            off : begin
                if (~E & ~L & ~R) state_next = off;
                else if (E | (R & L & ~E))state_next  = allon;
                else if (~E & ~L & R) state_next = ron1;
                else if (~E & L & ~R) state_next = lon1;
            end
            allon : state_next = off;
            lon1 : begin
                if (~E & L & ~R) state_next = lon2;
                else if (E | ~L | R) state_next = off;
            end
            lon2 : begin
                if (~E & L & ~R) state_next = lon3;
                else if (E | ~L | R) state_next = off;
            end
            lon3 : state_next = off;
            ron1 : begin
                if (~E & ~L & R) state_next = ron2;
                else if (E | L | ~R) state_next = off;
            end
            ron2 : begin
                if (~E & ~L & R) state_next = ron3;
                else if (E | L | ~R) state_next = off;
            end
            ron3 : state_next = off;
            default : state = off;
        endcase
    end
    
    
    //Outputs
    always @(state_next) begin
        case (state)
            off : begin
                Lon[2:0] <= 3'b000;
                Ron[2:0] <= 3'b000;
            end
            allon : begin
                Lon[2:0] <= 3'b111;
                Ron[2:0] <= 3'b111;
            end
            ron1 : begin 
                Ron[2:0] <= 3'b001;
                Lon[2:0] <= 3'b000;
            end    
            ron2 : begin 
                Ron[2:0] <= 3'b011;
                Lon[2:0] <= 3'b000;
            end
            ron3 : begin 
                Ron[2:0] <= 3'b111;
                Lon[2:0] <= 3'b000;
            end
            lon1 : begin
                Lon[2:0] <= 3'b001;
                Ron[2:0] <= 3'b000;
            end
            lon2 : begin
                Lon[2:0] <= 3'b011;
                Ron[2:0] <= 3'b000;
            end
            lon3 : begin
                Lon[2:0] <= 3'b111;
                Ron[2:0] <= 3'b000;
            end
            default : begin
                Lon[2:0] <= 3'b000;
                Ron[2:0] <= 3'b000;
            end
        endcase
    end
    
endmodule
