`timescale 1ns/1ps
module signExt(
	input signed [15:0]data,
	output reg signed [31:0] converted
);

always @(*)
begin
	converted = data;
end
endmodule