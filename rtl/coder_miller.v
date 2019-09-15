`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Lev
// 
// Create Date: 15.09.2019 18:23:04
// Design Name: 
// Module Name: coder
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


module coder_miller(
        input            clk_100m,
        input            code_i,
        output    reg    miller_code_o
    );
reg [1:0] miller_code  = 2'b00;

    
always@( posedge clk_100m) begin

case( miller_code ) 
    2'b00:begin
        if( code_i == 1'b1 ) begin
            miller_code_o <= 1'b0;
            #10
            miller_code_o <= 1'b1;
            miller_code   <= 2'b01;
        end
        else begin
            miller_code_o <= 1'b1;
            #10
            miller_code_o <= 1'b1;
            miller_code <= 2'b11;
        end
    end
    2'b01:begin
        if( code_i == 1'b1 ) begin
            miller_code_o <= 1'b1;
            #10
            miller_code_o <= 1'b0;
            miller_code   <= 2'b10;
        end
        else begin
            miller_code_o <= 1'b1;
            
            miller_code_o <= 1'b1;
            miller_code   <= 2'b11;
        end
    end
    2'b10:begin 
        if( code_i == 1'b1 ) begin
            miller_code_o <= 1'b0;
            #10
            miller_code_o <= 1'b1;
            miller_code   <= 2'b01;
        end
        else begin
            miller_code_o <= 1'b0;
            #10
            miller_code_o <= 1'b0;
            miller_code   <= 2'b00;
        end
    end
    2'b11:begin 
        if( code_i == 1'b1 ) begin
            miller_code_o <= 1'b1;
            #10
            miller_code_o <= 1'b0;
            miller_code   <= 2'b10;
        end
        else begin
            miller_code_o <= 1'b0;
            #10
            miller_code_o <= 1'b0;
            miller_code  <= 2'b00;
        end
    end
endcase



end


endmodule
