`timescale 1ns/1ps
module u_control(
	input [5:0]op,
	output reg W_bank, //Escritura en banco de registros
	output reg reg_dst, //Para operacion inmediata, se utiliza para que el registro destino sea el origen
	output reg alu_src, //Para tomar el dato inmediato a la alu
	output reg [2:0]alu_c, //Para la operacion de la alu
	output reg W_ram, //Escritura en ram
	output reg R_ram, //Lectura en ram
	output reg mux_c, //0 para mandar al banco de registros
	output reg uccc,
	output reg uc_j // 
);

//alu_c = 3'b111; significa que no es inmediata
always @(*)
begin 
	case (op)
		6'b000000: //Tipo R
		begin
			W_ram = 1'b0;
			R_ram = 1'b0;
			alu_c = 3'b111; 
			mux_c = 1'b0;
			reg_dst = 1'b0;
			alu_src = 1'b1;
			W_bank <= 1'b1;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b000100: // BEQ
		begin
			W_ram = 1'b0;
			R_ram = 1'b0;
			alu_c = 3'b001; 
			mux_c = 1'b0;
			reg_dst = 1'b0;
			alu_src = 1'b0;
			W_bank <= 1'b0;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b001000: // Suma inmediata
		begin
			W_ram = 1'b0;
			R_ram = 1'b0;
			alu_c = 3'b000;
			reg_dst = 1'b1; 
			alu_src = 1'b0;
			mux_c = 1'b0;
			W_bank <= 1'b1;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b001101: //Or inmediata
		begin
			W_bank = 1'b1;
			alu_c = 3'b101;
			W_ram = 1'b0;
			R_ram = 1'b0;
			mux_c = 1'b0;
			reg_dst = 1'b1; 
			alu_src = 1'b0;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b001100: //And inmediata
		begin
			W_bank = 1'b1;
			alu_c = 3'b100;
			W_ram = 1'b0;
			R_ram = 1'b0;
			mux_c = 1'b0;
			reg_dst = 1'b1; 
			alu_src = 1'b0;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b100011: //TODO lw
		begin
			W_bank = 1'b1;
			alu_c = 3'b000; //suma inmediata
			W_ram = 1'b0;
			R_ram = 1'b1;
			mux_c = 1'b1;
			reg_dst = 1'b1; 
			alu_src = 1'b0;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b101011: //TODO sw
		begin
			W_bank = 1'b0;
			R_ram = 1'b0;
			reg_dst = 1'b1; 
			alu_c = 3'b000; //suma inmediata
			alu_src = 1'b0;
			mux_c = mux_c;
			W_ram <= 1'b1;
			uccc = 1'b1;
			uc_j = 1'b0;
		end
		6'b000010: // J
		begin
			W_bank = 1'b0;
			R_ram = 1'b0;
			reg_dst = 1'b0; 
			alu_c = 3'b000;
			alu_src = 1'b0;
			mux_c = 1'b0;
			W_ram <= 1'b0;
			uccc = 1'b0;
			uc_j = 1'b1; // Deja pasar la dirección a la que debe dirigirse
		end
		// Para el branch manda señal a "gg" para hacer AND
		// gg manda 1, si es 1 entonces mandara la suma del
		// newALU al mux 5
		default
		begin
			W_bank = 1'b0;
			R_ram = 1'b0;
			reg_dst = 1'b0; 
			alu_c = 3'b000;
			alu_src = 1'b0;
			mux_c = 1'b0;
			W_ram <= 1'b0;
			uccc = 1'b0;
			uc_j = 1'b1;
		end
	endcase
end

endmodule