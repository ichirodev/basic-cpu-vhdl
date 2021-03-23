`timescale 1ns/1ps

module pc(
    input [31:0] a,
    input clk,
    output reg [31:0] b
);

reg [31:0] pc1;

always@(posedge clk)
begin
    if(clk == 1)
        begin
            b = pc1;
            pc1 = a;
        end
end

initial begin
    pc1 = 0;
end

/*  Siempre que haya un flanco positivo
en nuestro reloj esté mandara la salida
a la memoria y a la ALU
*/
endmodule