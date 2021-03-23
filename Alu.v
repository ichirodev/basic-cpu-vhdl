`timescale 1ns/1ps
module Alu(
	input signed [31:0]A,
	input signed [31:0]B,
	input control,
	input [2:0]sel,
	output reg zf,
	output reg signed [31:0] res
);
always @(*)
begin
	case (sel)
		3'b000:
		begin
			res = A + B;
		end
		3'b001:
		begin
			if (control == 1)
			begin
				res = A - B;
				if (res < 0)
				begin
					res = 32'd1;
				end 
				else if (res >= 0)
				begin
					res = 32'd0;
					zf = 1'b0;
				end
			end
			else if (control == 0)
			begin
				res = A - B;
			end
		end
		3'b010:
		begin
			res = A * B;
		end
		3'b011:
		begin
			res = A / B;
		end
		3'b100:
		begin
			res = A & B;
		end
		3'b101:
		begin
			res = A | B;
		end
		3'b110:
		begin
			res = A ^ B;
		end
		3'b111:
		begin
			res = ~(A | B);
		end
		default:
		begin
			res = 32'd0;
		end
	endcase
end


endmodule