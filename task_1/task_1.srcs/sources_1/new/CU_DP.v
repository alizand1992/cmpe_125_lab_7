module CU_DP(
        input go, clk, rst,
        input [1:0] op,
        input [2:0] in1, in2,
        output done,
        output [2:0] out,
        output [3:0] cs
    );
    
    wire we, rea, reb, s2, clk_db;
    wire [1:0] s1, wa, raa, rab, c;
    
    CU CTRL (go, clk, rst, op, s1, wa, raa, rab, c, we, rea, reb, s2, done, cs);
    small_calculator_dp DP (clk, in1, in2, s1, wa, raa, rab, c, we, rea, reb, s2, out);
    
endmodule
