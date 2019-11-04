module lab_7_fpga(
            input [2:0] in1, in2,
            input [1:0] op,
            input clk100MHz, go, button, rst,
            output done,
            output [7:0] ledsel, ledout
    );
    
    wire clk, clk_db;
    wire [2:0] out;
    wire [3:0] cs;
    wire [6:0] D0, D1;
    wire DONT_USE;
    
    clk_gen A1 (clk100MHz, rst, DONT_USE, clk_db);
    button_debouncer A2 (clk_db, button, clk);
    CU_DP A3 (go, clk, rst, op, in1, in2, done, out, cs);
    
    bcd_to_7seg A4 ({1'b0, out}, D0);
    bcd_to_7seg A5 (cs, D1);
    led_mux A6 (clk_db, rst, DONT_USE, DONT_USE, D0, D1, ledsel, ledout);
    
endmodule
