`timescale 1ns / 1ps


module VendingMachine(
    input N, D, Q, clk, rst,
    output reg [6:0] out,
    output reg C
    );
    
    reg [3:0] state;
    reg [6:0] number;
    localparam s0 = 0, s5 = 1, s10 = 2, s15 = 3, s20 = 4;
    localparam s25 = 5, s30 = 6, s35 = 7, s40 = 8, s45 = 9;
    
    
    always @(posedge clk) begin
        if (rst) begin state = s0; number = 7'h00; end
        else begin
            case (state)
                s0 : begin 
                    if     ((~N & ~D & ~Q)                                         
                            | (~N & D & Q)                                                    
                            | (N & ~D & Q)                                                    
                            | (N & D & ~Q)                                                    
                            | (N & D & Q))      begin state <= s0; number <= number; end
                    else if     (N & ~D & ~Q)   begin state = s5; number = number + 7'h05; end
                    else if     (~N & D & ~Q)   begin state = s10; number = number +  7'h0a; end 
                    else if     (~N & ~D & Q)   begin state = s25; number = number +   7'h19; end
                    else begin state = s0; number = number; end     
                end
                s5 : begin 
                   if     ((~N & ~D & ~Q)
                           | (~N & D & Q)
                           | (N & ~D & Q)
                           | (N & D & ~Q)
                           | (N & D & Q))       begin state <= s5; number <= number; end 
                   else if     (N & ~D & ~Q)    begin state = s10; number = number + 7'h05; end
                   else if     (~N & D & ~Q)    begin state = s15; number = number + 7'h0a; end
                   else if     (~N & ~D & Q)    begin state = s30; number = number + 7'h19; end  
                   else begin state = s0; number = number; end       
                end
                s10 : begin 
                    if     ((~N & ~D & ~Q)
                            | (~N & D & Q)
                            | (N & ~D & Q)
                            | (N & D & ~Q)
                            | (N & D & Q))      begin state <= s10; number <= number; end 
                    else if     (N & ~D & ~Q)   begin state = s15; number = number + 7'h05; end
                    else if     (~N & D & ~Q)   begin state = s20; number = number + 7'h0a; end
                    else if     (~N & ~D & Q)   begin state = s35; number = number + 7'h19; end
                             
                    else begin state <= s0; number = number; end
                end
                s15 : begin 
                    if     ((~N & ~D & ~Q)
                            | (~N & D & Q)
                            | (N & ~D & Q)
                            | (N & D & ~Q)
                            | (N & D & Q))      begin state <= s15; number <= number; end  
                    else if     (N & ~D & ~Q)   begin state = s20; number = number + 7'h05; end
                    else if     (~N & D & ~Q)   begin state = s25; number = number + 7'h0a; end
                    else if     (~N & ~D & Q)   begin state = s40; number = number + 7'h19; end        
                    else begin state <= s0; number = number; end
                end
                s20 : begin 
                    if     ((~N & ~D & ~Q)
                            | (~N & D & Q)
                            | (N & ~D & Q)
                            | (N & D & ~Q)
                            | (N & D & Q))      begin state <= s20; number <= number; end 
                    else if     (N & ~D & ~Q)   begin state = s25; number = number + 7'h05;  end
                    else if     (~N & D & ~Q)   begin state = s30; number = number + 7'h0a;  end
                    else if     (~N & ~D & Q)   begin state = s45; number = number + 7'h19;  end         
                    else begin state = s0; number = number; end
                end
                s25 :    begin state = s25; number = 7'h00;  end       
                s30 :    begin state = s30; number = 7'h05;  end 
                s35 :    begin state = s35; number = 7'h0a;  end 
                s40 :    begin state = s40; number = 7'h0f;  end 
                s45 :    begin state = s45; number = 7'h14;  end 
                default : state = s0;
            endcase
        end
    end 
    
    always @(state) begin
        case (state)
            s0 : begin C = 1'b0;  out = number;  end 
            s5 : begin C = 1'b0;  out = number;  end 
            s10 : begin C = 1'b0; out = number;  end 
            s15 : begin C = 1'b0; out = number;  end 
            s20 : begin C = 1'b0; out = number;  end 
            s25 : begin C = 1'b1; out = number;  end
            s30 : begin C = 1'b1; out = number;  end 
            s35 : begin C = 1'b1; out = number;  end 
            s40 : begin C = 1'b1; out = number;  end
            s45 : begin C = 1'b1; out = number;  end  
        endcase 
    end
    
endmodule
