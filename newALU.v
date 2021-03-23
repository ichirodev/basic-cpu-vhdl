`timescale 1ns/1ps

module newALU(
    input [31:0] beta,
    input [31:0] gamma,
    output reg [31:0] nge
);

always@(*)
begin
nge = beta + gamma;
end

endmodule