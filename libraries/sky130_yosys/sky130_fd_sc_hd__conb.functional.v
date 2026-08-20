`timescale 1ns / 1ps
`default_nettype none

module sky130_fd_sc_hd__conb (
    HI,
    LO
);

    output HI;
    output LO;

    assign HI = 1'b1;
    assign LO = 1'b0;

endmodule

`default_nettype wire
