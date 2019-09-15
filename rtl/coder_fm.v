`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2019 21:15:43
// Design Name: 
// Module Name: coder_fm
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


module coder_fm(
        input            clk_100m,
        input            code_i,
        output    reg    miller_code_o
    );
initial miller_code_o = 1'b1;

reg delay = 1'b0;

    
always@( clk_100m) begin

if( code_i ) begin 
    if(~delay)begin
         miller_code_o <= ~miller_code_o;
         delay         <= 1'b1;
     end
     else begin
         delay         <= 1'b0;
     end
end 
else begin
   miller_code_o <= ~miller_code_o;
end

end

endmodule
