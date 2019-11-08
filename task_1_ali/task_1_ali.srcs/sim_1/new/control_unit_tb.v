module control_unit_tb;
    reg clk;
    reg [1:0] op;
    reg [3:0] cs;
    
    wire [1:0] s1, wa, raa, rab, c;
    wire we, rea, reb, s2, done;
    
    control_unit DUT (
        .clk(clk), .op(op), .cs(cs),
        .s1(s1), .wa(wa), .raa(raa), .rab(rab), .c(c),
        .we(we), .rea(rea), .reb(reb), .s2(s2), .done(done)
    );
    
    integer i, j;
    
    initial
    begin
        clk = 0;
        
        for (i = 0; i < 4; i = i + 1) 
        begin
            op = i;
            #4
            
            for (j = 0; j < 16; j = j + 1) 
            begin
                cs = j;
                #4;
            end
        end
        
        $finish;
    end
       
    always
    begin
        clk = #2 ~clk;
    end
endmodule
