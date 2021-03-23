`timescale 1ns/1ps

module pFinal(
    input clk_s
);
//  Cables
wire [31:0] word;
wire [31:0] muxiv_out;
wire [31:0] suma_muxiv; // Entrada Mux4
wire [31:0] alu_out; // Resultado de la ALU
wire [31:0] dr1; // Salida BReg
wire [31:0] dr2_alu; // Salida de Mux3 hacia la ALU
wire [31:0] dr2; // Salida BReg
wire [31:0] muxv_pc; // Salida del Mux5 hacia el contador
wire [31:0] pc_memI; // Salida del contador con la direccion de la instruccion
wire [31:0] suma_out; // Resultado proveniente de la suma de direcciones
wire [31:0] inst; // Instrucción proveniente de la memoria de instrucciones
wire [31:0] o_signext; // Sign Extension salida
wire [31:0] sleft2_alu; // Shift left con dirección a ALU
wire [31:0] u_muxv; // Union de cables hacia mux5
wire [31:0] dw; // Dato que viene desde el Mux1 hacia el banco de registros
wire [25:0] sleft_union; // Shift left con dirección a Mux 5
wire [4:0] addr_breg; // Direccion de escritura para el Banco de Registros
wire [2:0] uc_aluc; // Desde UC a Alu Control
wire [2:0] aluc_alu; // De Alu Control a la ALU principal
wire uc_breg; // De UC a BReg para escribir o leer
wire reg_dst; // De UC a Mux2
wire alusrc; // De UC a Mux3
wire sel_muxiv; // Selector para el Mux 4
wire memRead;
wire memWrite;
wire mem_to_reg;
wire j_muxv;
wire zeroflag;
wire uc_branch;
wire s_alucontrol;
//  Instancias
pc pc_1(
    .a(muxv_pc),
    .b(pc_memI),
    .clk(clk_s)
);
mem_instrucciones mem_1(
    .data1(pc_memI),
    .instruccion_salida(inst)
);
suma suma_1(
    .in_suma(pc_memI),
    .c(suma_out)
);
u_control U_control(
	.op(inst[31:26]),
    .W_bank(uc_breg),
	.reg_dst(reg_dst),
	.alu_src(alusrc),
	.alu_c(uc_aluc),
	.W_ram(memWrite), 
	.R_ram(memRead),
	.mux_c(mem_to_reg),
	.uccc(uc_branch),
	.uc_j(j_muxv)
);

signExt signd(
	.data(inst[15:0]),
	.converted(o_signext)
);

mux2_2 mux_1(
	.A(word),
	.B(alu_out),
	.sel(mem_to_reg),
	.out(dw)
);
mux2_1 mux_2(
	.A(inst[20:16]),
	.B(inst[15:11]),
	.sel(reg_dst),
	.out(addr_breg)
);

mux2_2 mux_3(
	.A(dr2),
	.B(o_signext),
	.sel(alusrc),
	.out(dr2_alu)
);

mux4 mux_4(
	.nge(suma_muxiv),
	.b(suma_out),
	.ggmux4(sel_muxiv),
	.mux4_out(muxiv_out)
);

mux_pc mux_5(
    .o_muxv(u_muxv),
	.mux4_out(muxiv_out),
	.uc_j(j_muxv),
	.pc_io(muxv_pc)
);

bancoreg reg_bank(
	.R_W(uc_breg),
	.reg1(inst[25:21]),
	.reg2(inst[20:16]),
	.address(addr_breg),
	.data_in(dw),
	.data_out_1(dr1),
	.data_out_2(dr2)
);
Alu_control alu_control(
	.funct(inst[5:0]),
	.control(uc_aluc),
	.aluControl(s_alucontrol),
	.alu(aluc_alu)
);

Alu alu(
	.A(dr1),
	.B(dr2_alu),
	.control(s_alucontrol),
	.sel(aluc_alu),
	.zf(zeroflag),
	.res(alu_out)
);
Ram ram(
	.dir(alu_out),
	.W(memRead),
	.R(memWrite),
	.wordIn(dr2),
	.wordOut(word)
);

newALU newALU_1(
    .beta(suma_out),
    .gamma(sleft2_alu),
	.nge(suma_muxiv)
);

gg miniMux(
	.zf(zeroflag),
	.i_branch(uc_branch),
	.selmuxiv(sel_muxiv)
);

sleft shiftleft_1(
	.shiftleft(inst[25:0]),
    .shifted(sleft_union)
);

sleft1 shiftleft_2(
	.in_sl1(o_signext),
	.out_sl1(sleft2_alu)
);

union_j union(
	.i_shiftleft(sleft_union),
	.i_suma(suma_out[31:26]),
	.o_muxv(u_muxv)
);
endmodule