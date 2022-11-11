`timescale 1ns / 1ps

module mux_tb();
    reg input1_tb;
    reg input2_tb;
    reg select_tb;
    wire out_tb;
    
    mux mux_tb(
        .input1(input1_tb),
        .input2(input2_tb),
        .select(select_tb),
        .out(out_tb)
    );
    
    initial
    begin 
        input1_tb = 1;
        input2_tb = 2;
        select_tb = 1;
        #20
        select_tb = 0;
    end 

endmodule
