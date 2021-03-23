`timescale 1ns/1ps

module mem_instrucciones(
input [31:0] data1,
output reg [31:0] instruccion_salida
);
//	Registro encargado de almacenar las instrucciones
reg [7:0] mem_inst [0:1023];
//	Registros que me dice en que numero de indice voy
//	Ciclo encargado de mandar como una sola instruccion 4 celdas de memoria
always @(*)
begin
    instruccion_salida = {mem_inst[data1], mem_inst[data1 + 1], mem_inst[data1 + 2], mem_inst[data1 + 3]};
end
/*	Mis instrucciones:
[0 a 3] instruccion 1
[4 a 7] instruccion 2
[8 a 11] instruccion 3
[12 a 15] instruccion 4
...	*/
initial begin
$readmemb("C:/Users/ichi/Desktop/alpha.txt", mem_inst);
/* mem_inst[0] = 8'b00000000;
mem_inst[1] = 8'b01100001;
mem_inst[2] = 8'b11111000; 
mem_inst[3] = 8'b00100010; 
//  1.- 000000,00011,00001,11111,00000,100010 
//  R, Resta del registro 3 y 1, almacenado en el registro 31
mem_inst[4] = 8'b00000001;
mem_inst[5] = 8'b11001100;
mem_inst[6] = 8'b11110000;
mem_inst[7] = 8'b00100010;
// 2.- 000000,01110,01100,11110,00000,100010
// R, Resta del registro 14 y 12, almacenado en el registro 30
mem_inst[8] = 8'b00000011;
mem_inst[9] = 8'b11111110;
mem_inst[10] = 8'b11101000;
mem_inst[11] = 8'b00011010;
// 3.- 000000,11111,11110,11101,00000,011010
// R, Division del registro 31 sobre 30, almacenado en el registro 29
mem_inst[12] = 8'b00000001;
mem_inst[13] = 8'b10101100;
mem_inst[14] = 8'b11100000;
mem_inst[15] = 8'b00100010;
// 4.- 000000,01101,01100,11100,00000,100010
// R, Resta del registro 13 y 12, almacenado en el registro 28
mem_inst[16] = 8'b00000011;
mem_inst[17] = 8'b10011101;
mem_inst[18] = 8'b11011000;
mem_inst[19] = 8'b00011000;
// 5.- 000000,11100,11101,11011,00000,011000
// R, Multiplicación del registro 28 y 29, almacenado en el registro 27
mem_inst[20] = 8'b00000011;
mem_inst[21] = 8'b01100001;
mem_inst[22] = 8'b00010000;
mem_inst[23] = 8'b00100000;
// 6.- 000000,11011,00001,00010,00000,100000
// R, Suma del registro 27 y 1, almacenado en el registro 2
//      Resultado de la primera interpolación
//
mem_inst[24] = 8'b00000000;
mem_inst[25] = 8'b10100011;
mem_inst[26] = 8'b11111000;
mem_inst[27] = 8'b00100010;
// 7.- 000000,00101,00011,11111,00000,100010
// R, Resta del registro 5 y 3, almacenado en el registro 31
mem_inst[28] = 8'b00000010;
mem_inst[29] = 8'b00001110;
mem_inst[30] = 8'b11110000;
mem_inst[31] = 8'b00100010;
// 8.- 000000,10000,01110,11110,00000,100010
// R, Resta del registro 16 y 14, almacenado en el registro 30
mem_inst[32] = 8'b00000011;
mem_inst[33] = 8'b11111110;
mem_inst[34] = 8'b11101000;
mem_inst[35] = 8'b00011010;
// 9.- 000000,11111,11110,11101,00000,011010
// R, Division del registro 31 sobre 30, almacenado en el registro 29
mem_inst[36] = 8'b00000001;
mem_inst[37] = 8'b11101110;
mem_inst[38] = 8'b11100000;
mem_inst[39] = 8'b00100010;
// 10.- 000000,01111,01110,11100,00000,100010
// R, Resta del registro 15 y 14, almacenado en el registro 28
mem_inst[40] = 8'b00000011;
mem_inst[41] = 8'b10011101;
mem_inst[42] = 8'b11011000;
mem_inst[43] = 8'b00011000;
// 11.- 000000,11100,11101,11011,00000,011000
// R, Multiplicación del registro 28 y 29, almacenado en el registro 27
mem_inst[44] = 8'b00000011;
mem_inst[45] = 8'b01100011;
mem_inst[46] = 8'b00100000;
mem_inst[47] = 8'b00100000;
// 12.- 000000,11011,00011,00100,00000,100000
// R, Suma del registro 27 y 3, almacenado en el registro 4
//      Resultado de la segunda interpolación
//
mem_inst[48] = 8'b00000000;
mem_inst[49] = 8'b11100101;
mem_inst[50] = 8'b11111000;
mem_inst[51] = 8'b00100010;
// 13.- 000000,00111,00101,11111,00000,100010
// R, Resta del registro 7 y 5, almacenado en el registro 31
mem_inst[52] = 8'b00000010;
mem_inst[53] = 8'b01010000;
mem_inst[54] = 8'b11110000;
mem_inst[55] = 8'b00100010;
// 14.- 000000,10010,10000,11110,00000,100010
// R, Resta del registro 18 y 16, almacenado en el registro 30
mem_inst[56] = 8'b00000011;
mem_inst[57] = 8'b11111110;
mem_inst[58] = 8'b11101000;
mem_inst[59] = 8'b00011010;
// 15.- 000000,11111,11110,11101,00000,011010
// R, Division del registro 31 sobre 30, almacenado en el registro 29
mem_inst[60] = 8'b00000001;
mem_inst[61] = 8'b11101110;
mem_inst[62] = 8'b11100000;
mem_inst[63] = 8'b00100010;
// 16.- 000000,01111,01110,11100,00000,100010
// R, Resta del registro 17 y 16, almacenado en el registro 28
mem_inst[64] = 8'b00000011;
mem_inst[65] = 8'b10011101;
mem_inst[66] = 8'b11011000;
mem_inst[67] = 8'b00011000;
// 17.- 000000,11100,11101,11011,00000,011000
// R, Multiplicación del registro 28 y 29, almacenado en el registro 27
mem_inst[68] = 8'b00000011;
mem_inst[69] = 8'b01100101;
mem_inst[70] = 8'b00110000;
mem_inst[71] = 8'b00100000;
// 18.- 000000,11011,00101,00110,00000,100000
// R, Suma del registro 27 y 5, almacenado en el registro 6
//      Resultado de la tercera interpolación
//
mem_inst[72] = 8'b00000001;
mem_inst[73] = 8'b00100111;
mem_inst[74] = 8'b11111000;
mem_inst[75] = 8'b00100010;
// 19.- 000000,01001,00111,11111,00000,100010
// R, Resta del registro 9 y 7, almacenado en el registro 31
mem_inst[76] = 8'b00000010;
mem_inst[77] = 8'b10010010;
mem_inst[78] = 8'b11110000;
mem_inst[79] = 8'b00100010;
// 20.- 000000,10100,10010,11110,00000,100010
// R, Resta del registro 20 y 18, almacenado en el registro 30
mem_inst[80] = 8'b00000011;
mem_inst[81] = 8'b11111110;
mem_inst[82] = 8'b11101000;
mem_inst[83] = 8'b00011010;
// 21.- 000000,11111,11110,11101,00000,011010
// R, Division del registro 31 sobre 30, almacenado en el registro 29
mem_inst[84] = 8'b00000010;
mem_inst[85] = 8'b01110010;
mem_inst[86] = 8'b11100000;
mem_inst[87] = 8'b00100010;
// 22.- 000000,10011,10010,11100,00000,100010
// R, Resta del registro 19 y 18, almacenado en el registro 28
mem_inst[88] = 8'b00000011;
mem_inst[89] = 8'b10011101;
mem_inst[90] = 8'b11011000;
mem_inst[91] = 8'b00011000;
// 23.- 000000,11100,11101,11011,00000,011000
// R, Multiplicación del registro 28 y 29, almacenado en el registro 27
mem_inst[92] = 8'b00000011;
mem_inst[93] = 8'b01100111;
mem_inst[94] = 8'b01000000;
mem_inst[95] = 8'b00100000;
// 24.- 000000,11011,00111,01000,00000,100000
// R, Suma del registro 27 y 7, almacenado en el registro 8
//      Resultado de la cuarta interpolación
//
mem_inst[96] = 8'b00100001;
mem_inst[97] = 8'b00101010;
mem_inst[98] = 8'b00000000;
mem_inst[99] = 8'b00000011;
// 25.- 001000,01001,01010,0000000000000011
// I, Agregar ultimo dato de la interpolación
//      Resultado de una interpolación mas, como prueba de la suma inmediata
//
mem_inst[100] = 8'b00100001;
mem_inst[101] = 8'b01111111
mem_inst[102] = 8'b00000000
mem_inst[103] = 8'b00000011
//  26.- 000010,0000000000000000001111101
// J, Salto a instrucción numero 125
mem_inst[125] = 8'b00010001;
mem_inst[126] = 8'b10011100;
mem_inst[127] = 8'b00000000;
mem_inst[128] = 8'b00001000;
// 27.- 000100,01100,11100,0000000000001000
// R, BEQ entre los registros 12 y 18, salto de 8
mem_inst[100] = 8'b00001000;
mem_inst[101] = 8'b00000000;
mem_inst[102] = 8'b00000000;
mem_inst[103] = 8'b01111101;
// 28.- 001000,01011,11111,0000000000000011
// I, Suma inmediata del registro 11 + 3, con destino del reg. 31  */
end 
endmodule