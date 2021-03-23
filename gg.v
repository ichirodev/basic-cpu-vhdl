`timescale 1ns/1ps

module gg(
input zf,
input i_branch,
output reg selmuxiv
);

always@(*)begin
	if(zf == 1)begin
		selmuxiv = 1'b1;
	end
	if(i_branch == 1)begin
		selmuxiv = 1'b0;
	end
end
endmodule