module CU (
        input wire go, clk, rst,
        input wire [1:0] op,
        output reg [1:0] s1, wa, raa, rab, c,
        output reg we, rea, reb, s2, done,
        output reg [3:0] cs                    //current state
);

    reg [3:0] ns;  //next state
    
    parameter S0 = 1'h0; //idle
    parameter S1 = 1'h1; //read in1 to r1
    parameter S2 = 1'h2; //read in2 to r2
    parameter S3 = 1'h3; //wait
    parameter S4 = 1'h4; //alu addition
    parameter S5 = 1'h5; //alu subtraction
    parameter S6 = 1'h6; //alu logical and
    parameter S7 = 1'h7; //alu logical xor
    parameter S8 = 1'h8; //out: R3, done = 1
    
    always @ (rst)
    begin 
        cs = S0;                    //current state = 0
    end
    
    
    always @ (cs, go, op)          //state machine logic
    begin
        case(cs)
            S0: begin
                    if(!go) ns = S0;
                    else ns = S1;
                end
            S1: begin 
                    ns = S2;
                end
            S2: begin
                    ns = S3;
                end
            S3: begin
                    if(op == 1'h3)
                        ns = S4;
                    else if(op == 1'h2)
                        ns = S5;
                    else if(op == 1'h1)
                        ns = S6;
                    else if(op == 1'h0)
                        ns = S7;
                end
            S4: begin 
                    ns = S8;
                end
            S5: begin
                    ns = S8;
                end
            S6: begin
                    ns = S8;
                end
            S7: begin
                    ns = S8;
                end
            S8: begin
                    ns = S0;
                end
            default ns = S0;
        endcase
    end
    
    always @ (posedge clk, posedge rst)       
        begin
            if(rst) cs <= S0;                        
            else cs <= ns;
        end
        
    always @ (cs)
        begin
            case(cs)
                S0: begin
                        s1 = 1;
                        wa = 0;
                        we = 0;
                        raa = 0;
                        rea = 0;
                        rab = 0;
                        reb = 0;
                        c = 0;
                        s2 = 0;
                        done = 0;
                    end
                S1: begin
                        s1 = 3;
                        wa = 1;
                        we = 1;
                        raa = 0;
                        rea = 0;
                        rab = 0;
                        reb = 0;
                        c = 0;
                        s2 = 0;
                        done = 0;
                    end
                S2: begin
                        s1 = 2;
                        wa = 2;
                        we = 1;
                        raa = 0;
                        rea = 0;
                        rab = 0;
                        reb = 0;
                        c = 0;
                        s2 = 0;
                        done = 0;
                    end
                S3: begin
                        s1 = 1;
                        wa = 0;
                        we = 0;
                        raa = 0;
                        rea = 0;
                        rab = 0;
                        reb = 0;
                        c = 0;
                        s2 = 0;
                        done = 0;
                    end
                S4: begin
                        s1 = 0;
                        wa = 3;
                        we = 1;
                        raa = 1;
                        rea = 1;
                        rab = 2;
                        reb = 1;
                        c = 0;
                        s2 = 0;
                        done = 0;
                    end
                S5: begin
                        s1 = 0;
                        wa = 3;
                        we = 1;
                        raa = 1;
                        rea = 1;
                        rab = 2;
                        reb = 1;
                        c = 1;
                        s2 = 0;
                        done = 0;
                    end
                S6: begin
                        s1 = 0;
                        wa = 3;
                        we = 1;
                        raa = 1;
                        rea = 1;
                        rab = 2;
                        reb = 1;
                        c = 2;
                        s2 = 0;
                        done = 0;
                    end
                S7: begin
                        s1 = 0;
                        wa = 3;
                        we = 1;
                        raa = 1;
                        rea = 1;
                        rab = 2;
                        reb = 1;
                        c = 3;
                        s2 = 0;
                        done = 0;
                    end
                S8: begin
                        s1 = 1;
                        wa = 0;
                        we = 0;
                        raa = 3;
                        rea = 1;
                        rab = 3;
                        reb = 1;
                        c = 0;          //c = 2
                        s2 = 1;
                        done = 1;
                    end
                endcase
            end
        
endmodule
