`timescale 1ns/1ps
module mux2_2(
	input [31:0]A,
	input [31:0]B,
	input sel,
	output reg [31:0]out
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