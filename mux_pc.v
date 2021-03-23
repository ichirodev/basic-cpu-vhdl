`timescale 1ns/1ps

module mux_pc(
    input [31:0] o_muxv,
    input [31:0] mux4_out,
    input uc_j,
    output reg [31:0] pc_io
);

always@(*)
begin
    if (uc_j == 1)begin
        pc_io = o_muxv;
    end
	 if (uc_j == 0)begin
        pc_io = mux4_out;
    end
end
endmodule