//////////////////////////////////////////////////////////////////////////////////////
//                                                                                  //
//Project: Two input MUX                                                            //
//Author: Noah Jongeling                                                            //
//                                                                                  //
//////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module mux(
    input input1,
    input input2,
    input select,
    output out
);
    
    assign out = (~select)? input1:input2;

endmodule