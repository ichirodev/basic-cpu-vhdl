`timescale 1ns/1ps

module mux4(
    input [31:0] nge,
    input [31:0] b,
    input ggmux4,
    output reg [31:0] mux4_out
);

always@(*)
begin
	if(ggmux4 == 1)begin
		mux4_out = nge;
	end
	if(ggmux4 == 0)begin
		mux4_out = b;
	end
end
// cambiar 0's y 1's si falla
endmodule