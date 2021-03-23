`timescale 1ns/1ps
module Alu_control(
	input [5:0]funct,
	input [2:0]control,
	output reg aluControl,
	output reg[2:0]alu
);

always @(*)
begin
	if(control == 3'b111)
	begin
		case (funct)
			6'b 100000:
			// Suma
			begin
				alu = 3'b000;
				aluControl = 0;
			end
			6'b 100010:
			// Resta
			begin
				alu = 3'b001;
				aluControl = 0;
			end
			6'b 011000:
			// Multiplicacion
			begin
				alu = 3'b010;
				aluControl = 0;
			end
			6'b 011010:
			// División
			begin
				alu = 3'b011;
				aluControl = 0;
			end
			6'b 100100:
			// AND
			begin
				alu = 3'b100;
				aluControl = 0;
			end
			6'b 100101:
			// OR
			begin
				alu = 3'b101;
				aluControl = 0;
			end
			6'b 100110:
			// XOR
			begin
				alu = 3'b110;
				aluControl = 0;
			end
			6'b 100111:
			// NOR
			begin
				alu = 3'b111;
				aluControl = 0;
			end
			6'b 101010:
			// SLT
			begin
				alu = 3'b001;
				aluControl = 1;
			end
			// J
			6'b 000010:
			begin
				alu = 3'b0;
				aluControl = 0;
			end
		endcase
	end 
	else begin
			alu = control;
	end
end
endmodule