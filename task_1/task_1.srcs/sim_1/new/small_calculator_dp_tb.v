module small_calculator_dp_tb();
    reg clk;
    reg [3:0] in1, in2;
    reg [1:0] s1, wa, raa, rab, c;
    reg we, rea, reb, s2;
    
    wire [3:0] out;
    
    small_calculator_dp DUT (
        .clk(clk),
        .in1(in1),
        .in2(in2),
        .s1(s1), 
        .wa(wa), 
        .raa(raa), 
        .rab(rab), 
        .c(c), 
        .we(we),
        .rea(rea),
        .reb(reb),
        .s2(s2),
        .out(out)
    );
    
    initial
    begin
        clk = 1;
    end

    always
        clk = #5 ~clk;
endmodule
