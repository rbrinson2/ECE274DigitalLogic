`timescale 1ns / 1ps


module Lab5(Clk, Rst, go, sum, done);
    input Clk, Rst, go;
    output [11:0] sum;
    output done;

////////////////////////////////////
    //declare all internal signals used in this code here
    //make sure that you use correct number of bits
    wire [11:0] adder12bit;
    wire [7:0] temp1, temp2, R_data, sub8bit1, sub8bit2, sub8bitout;
    wire [5:0] i, adder6bit;
    wire [4:0] R_addr;

            
/// Controller is already instantiated below with all control signals that you can use in your code.     
    wire muxsel, R_en, i_clr, i_ld;
    wire temp2_clr, temp2_ld;
    wire temp1_clr, temp1_ld;
    wire sum_clr, sum_ld;
    wire temp1_gt_temp2, i_lt_32;
    Controller c1(Clk, Rst, go, temp1_gt_temp2, i_lt_32, done, muxsel, R_en,
                  i_clr, i_ld, temp1_clr, temp1_ld, temp2_clr, temp2_ld, sum_clr, sum_ld);
////////////////////////////////////   
    
     //write your code here. Instantiate modules
     //and connect those modules together to implement
     //the digital system of lab 5
     
    //RegisterFile_32_8(R_Addr, W_Addr, R_en, W_en, R_Data, W_Data, Clk, Rst);
    RegisterFile_32_8 RF32x8(.R_Addr(i[4:0]), .W_Addr(5'b0), .R_en(R_en), .W_en(1'b0), .R_Data(R_data), .W_Data(8'b0), .Clk(Clk), .Rst(Rst));
    
    //Comparator_8bits(A, B, AltB, AeqB, AgtB)
    Comparator_8bits CMP6bit(.A({2'b00, i}), .B(8'd32), .AltB(i_lt_32), .AeqB(), .AgtB());
    Comparator_8bits CMP8bit(.A(temp1), .B(temp2), .AltB(), .AeqB(), .AgtB(temp1_gt_temp2));
    
    //Register_12bits(Clk, Clr, Ld, I, Q);
    Register_12bits Reg6bit(.Clk(Clk), .Clr(i_clr), .Ld(i_ld), .I(adder6bit), .Q(i));
    Register_12bits Reg8bit1(.Clk(Clk), .Clr(temp1_clr), .Ld(temp1_ld), .I(R_data), .Q(temp1));
    Register_12bits Reg8bit2(.Clk(Clk), .Clr(temp2_clr), .Ld(temp2_ld), .I(R_data), .Q(temp2));
    Register_12bits Reg12bit(.Clk(Clk), .Clr(sum_clr), .Ld(sum_ld), .I(adder12bit), .Q(sum));
    
    //Adder_12bits(A, B, Cin, S, Co);
    Adder_12bits Add12bit(.A(sum), .B({4'b0,sub8bitout}), .Cin(1'b0), .S(adder12bit), .Co());
    
    //Adder_6bit(A, B, Cin, S, Co);
    Adder_6bit Add6bit(.A(i), .B(6'd1), .Cin(1'b0), .S(adder6bit), .Co());
    
    //mux8bits_2x1(s, I1, I0, D);
    mux8bits_2x1 mux1(.s(muxsel), .I1(temp1), .I0(temp2), .D(sub8bit1));
    mux8bits_2x1 mux2(.s(muxsel), .I1(temp2), .I0(temp1), .D(sub8bit2));
    
    //Subtractor_8bits(A,B,S);
    Subtractor_8bits Sub8bit(.A(sub8bit1), .B(sub8bit2), .S(sub8bitout));
    


endmodule
