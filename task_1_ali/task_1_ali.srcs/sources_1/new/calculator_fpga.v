module calculator_fpga(
    input [3:0] in1, in2,
    input [1:0] op,
    input clk100MHz, go, clk, rst,
        
    output done,
    output [7:0] LEDOUT,
    output [3:0] LEDSEL, out
);

    supply1 [7:0] vcc;

    wire clk_db, clk_5KHz;
    
    wire [3:0] cs;
    wire [7:0] led1, led0;
    wire DONT_USE;
    
    clk_gen CLK_GEN (clk100MHz, rst, DONT_USE, clk_5KHz);

    button_debouncer CLK_DB (clk_5KHz, clk, clk_db);
    
    control_unit_data_path cudp (
        .clk(clk_5KHz), .go(go), .rst(rst), .in1(in1), .in2(in2), .op(op),
        .cs(cs), .out(out), .done(done)
    );
    
    bcd_to_7seg LED1 (
        .BCD(cs),
        .s(led1)
    );
    
    bcd_to_7seg LED0 (
        .BCD(out),
        .s(led0)
    );

    led_mux LED_MUX (clk_5KHz, rst, vcc, vcc, led1, led0, LEDSEL, LEDOUT);

endmodule
    
