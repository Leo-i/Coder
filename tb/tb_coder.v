`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2019 18:28:22
// Design Name: 
// Module Name: tb_coder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_coder();

reg        clk_100m        = 1'b1;
reg        signal_to_coder = 1'b1;

wire from_coder;

coder miller_code(
.clk_100m(clk_100m),
.code_i(signal_to_coder),
.miller_code_o(from_coder)
);

always begin
#10
clk_100m        <= ~clk_100m;
end

initial begin
#20
signal_to_coder <= 0;
#20
signal_to_coder <= 0;
#20
signal_to_coder <= 0;
#20
signal_to_coder <= 1;
#20
signal_to_coder <= 0;
#20
signal_to_coder <= 0;
#20
signal_to_coder <= 1;
#20
signal_to_coder <= 0;
#20
$finish;
end
//always begin
//#20
//signal_to_coder <= $random;
//end


endmodule
