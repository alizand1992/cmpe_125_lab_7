module small_calc_dp_tb2();
    reg clk;
    reg [3:0] in1, in2;
    reg [1:0] s1, wa, raa, rab, c;
    reg we, rea, reb, s2;
    
    wire [3:0] out;
    reg [3:0] expected;
    
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
        
        we = 1; rea = 1; reb = 1;
        
    in1 = 4'b1110;
    in2 = 4'b0001;
        
        wa = 2'b00;
        s1 = 2'b01;
        #50
        
        wa = 2'b01;
        s1 = 2'b10;
        #50
        
        wa = 2'b10;
        s1 = 2'b11;
        #50
       
    raa = 2'b01;
        rab = 2'b10;
        wa = 2'b11;
        s1 = 2'b00;
        #25;
        
        c = 2'b00;          //Addition
        raa = 2'b00;
        rab = 2'b11;
        expected = 4'b1111;
        s2 = 1;
        #10;
        
        if (out != expected)
            begin
                $display("Error when adding.");
                
            end
            #10;
    raa = 2'b01;
        rab = 2'b10;
        c = 2'b01;                      //Subtraction
        s2 = 0;
        #50;
        
        c = 2'b00;
        raa = 2'b00;
        rab = 2'b11;
        s2 = 1;
        expected = 4'b1101;
        #10;
        
        if (out != expected)
            begin
                $display("Error when subtracting.");

            end
            #10;
            
    raa = 2'b01;
    rab = 2'b10;
        c = 2'b10;
        s2 = 0;
        #50;
        
        c = 2'b00;
        raa = 2'b00;
        rab = 2'b11;
        s2 = 1;
        expected = 4'b0000;
        #10;
        
        
        if (out != expected)
            begin
                $display("Error when performing 'and' logic.");

            end
            #10;
        
        raa = 2'b01;
        rab = 2'b10;
        c = 2'b11;
        s2 = 0;
        #50;
        
        c = 2'b00;
        raa = 2'b00;
        rab = 2'b11;
        s2 = 1;
        expected = 4'b1111;
        #10;
        
        if (out != expected)
            begin
                $display("Error when performing 'xor'.");
            end
            #10;
            
        $display("No errors were found.");
        $finish;
    end
initial
    begin
    clk = 0;
    #25;
    forever
    begin
    clk = ~clk;
    #25;
    end
end
        
            
endmodule
