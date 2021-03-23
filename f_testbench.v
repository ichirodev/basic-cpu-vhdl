`timescale 1ns/1ps

module f_testbench();

reg clk1 = 0;

pFinal pFinal_1(
    .clk_s(clk1)
);

always #10 clk1 = ~(clk1);

initial
begin
	#5000;
	$stop;
end


endmodule