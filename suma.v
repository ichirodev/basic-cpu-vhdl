`timescale 1ns/1ps

module suma(
    input [31:0] in_suma,
    output reg[31:0] c
);
reg indata;
wire [31:0] b;
assign b = 32'd4;
//  Cable 'b' con un valor de 4 para sumar
always@(*)begin
    c = in_suma + b;
end

initial
begin
	c = 32'd0;
end
/*  Siempre que haya un cambio en el modulo
la salida 'c' mandara la suma de la entrada
a y el cable 'b' con un valor de 4, al inicio
la salida valdra 0 al comienzo por que tenemos
una instruccion correspondiente a las celdas 0 a 3.
*/
endmodule