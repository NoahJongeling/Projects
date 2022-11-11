`timescale 1ns / 1ps

module nbit_mux #(parameter DATA_IN = 64)( //only works for powers of 2 inputs 2 4 8 16 32 64
    input wire [DATA_IN-1:0] X_in,
    input wire [$clog2(DATA_IN)-1:0] Select,
    output wire Y_out
);

genvar i,j;
wire [2*DATA_IN - 2:0] temp;

generate
    for(i = 0; i <($clog2(DATA_IN));i = i+1)
    begin
        for(j = 0;j <(DATA_IN/(2**(i+1)));j = j+1)
        begin

            mux mux(
                .input1(temp[DATA_IN*2 - (DATA_IN*2/(2**i)) + j*2+0]),
                .input2(temp[DATA_IN*2 - (DATA_IN*2/(2**i)) + j*2+1]),
                .select(Select[i]),
                .out(temp[DATA_IN*2 - (DATA_IN*2/(2**(i+1))) + j])
            );
        end
    end
endgenerate

assign Y_out = temp[2*DATA_IN - 2]; //last temp wire
assign temp[DATA_IN-1:0] = X_in;    //first 

endmodule