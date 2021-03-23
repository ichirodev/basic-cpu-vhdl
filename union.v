`timescale 1ns/1ps

module union_j(
	input [25:0] i_shiftleft,
	input [31:26] i_suma,
	output reg [31:0] o_muxv
);

always@(*)
begin
	o_muxv = {i_suma, i_shiftleft};
end

endmodule