`timescale 1ns/1ps
module Ram(
	input [31:0]dir,
	input W,
	input R,
	input [31:0] wordIn,
	output reg [31:0]wordOut
);
reg [31:0]memory[1023:0];

always @(*)
begin
	if(W == 1)
	begin
		memory[dir] = wordIn;
	end
	if(R == 1)
	begin
		wordOut = memory[dir];
	end
end

endmodule