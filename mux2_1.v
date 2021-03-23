`timescale 1ns/1ps
module mux2_1(
	input [4:0]A,
	input [4:0]B,
	input sel,
	output reg [4:0]out
);



always @(*)
begin
	if(sel == 1)
	begin
		out = A;
	end 
	else if (sel == 0)
	begin
		out = B;
	end
end

endmodule