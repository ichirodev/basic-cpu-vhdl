`timescale 1ns/1ps
module bancoreg(
	input R_W,
	input [4:0 ] reg1,
	input [4:0 ] reg2,
	input [4:0 ] address,
	input [31:0] data_in,
	output reg [31:0] data_out_1,
	output reg [31:0] data_out_2
);
reg [31:0]breg[31:0];

initial begin
	breg[0] = 32'd0;
	breg[1] = 32'd15;
	breg[2] = 32'd0;
	breg[3] = 32'd21;
	breg[4] = 32'd0;
	breg[5] = 32'd27;
	breg[6] = 32'd0;
	breg[7] = 32'd33;
	breg[8] = 32'd0;
	breg[9] = 32'd39;
	breg[10] = 32'd0;
	breg[11] = 32'd45;
	breg[12] = 32'd1;
	breg[13] = 32'd2;
	breg[14] = 32'd3;
	breg[15] = 32'd4;
	breg[16] = 32'd5;
	breg[17] = 32'd6;
	breg[18] = 32'd7;
	breg[19] = 32'd8;
	breg[20] = 32'd9;
	breg[21] = 32'd10;
	breg[22] = 32'd11;
	breg[23] = 32'd0;
	breg[24] = 32'd0;
	breg[25] = 32'd0;
	breg[26] = 32'd0;
	breg[27] = 32'd0;
	breg[28] = 32'd0;
	breg[29] = 32'd0;
	breg[30] = 32'd0;
	breg[31] = 32'd0;
end

always @(*)
	begin
		if(R_W == 1)
		begin	
			breg[address] = data_in;
		end
		else
		begin
		data_out_1 <= breg[reg1];
		data_out_2 <= breg[reg2];
		end
	end
endmodule