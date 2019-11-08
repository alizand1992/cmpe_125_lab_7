module task_2_3_tb;
    reg go, clk, rst;
    reg [1:0] op;
    reg [3:0] in1, in2;
    
    wire done;
    wire [3:0] out;
    wire [3:0] cs;
    
    CU_DP DUT(
        .go(go), .clk(clk), .rst(rst), .in1(in1), .in2(in2),
        .done(done), .out(out), .cs(cs)
    );
    
    integer i, j, k;
    
        initial
        begin
            clk = 0;
            go = 1;
            rst = 1;
            #4;
            rst = 0;
            #4;
                    
            // Loop to test multiple values
            for (i = 0; i < 5; i = i + 1) begin        
                // Set in1 and 2 to random numbers
                in1 = $random;
                in2 = $random;
                for (j = 0; j < 4; j = j + 1) begin
                    op = j;
                    #4; 
                end           
            end
            
            $finish;
        end

    always
        clk = #2 ~clk;
endmodule
