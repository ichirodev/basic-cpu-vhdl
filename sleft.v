`timescale 1ns/1ps

module sleft(input [25:0] shiftleft, output reg [25:0] shifted);
wire [25:0] shiftl = shiftleft<<2;

always@(*)
begin
	shifted = shiftl;
end

endmodule