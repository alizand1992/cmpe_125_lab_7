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
    
    integer i, j, k;
    
    initial
    begin
        clk = 1;
        #1;
        
        we = 1;
        #1;
        
        in1 = 1;
        in2 = 2;
        wa = 1;
        raa = 1;
        rab = 1;
        c = 0;
        rea = 1;
        reb = 1;
        #1;
        
        for (i = 0; i < 4; i = i + 1)
        begin
            s1 = #2 i;
                
            for (j = 0; j < 2; j = j + 1)
                s2 = #2 j;
        end

        
        $finish;
    end

    always
        clk = #1 ~clk;
endmodule
