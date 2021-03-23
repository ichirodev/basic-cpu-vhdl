`timescale 1ns/1ps

module sleft1(
	input [31:0] in_sl1,
	output reg [31:0] out_sl1
);
wire [31:0] shiftl1 = in_sl1<<2;
always@(*)begin
	out_sl1 = shiftl1;
end

endmodule