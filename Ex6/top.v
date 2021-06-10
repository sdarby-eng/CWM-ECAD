//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 - RGB Colour Converter
// Student Name: Stephen Darby
// Date: 10/6/21
//
//
//  Description: In this exercise, you need to design a memory with 8 entries, 
//  converting colours to their RGB code.
//
//  inputs:
//           clk, colour [2:0], enable
//
//  outputs:
//           rgb [23:0]
//
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps

module ColourConverter(input clk,
	input [2:0] colour,
	input enable,
	output wire [23:0] rgb
	);


//Instatiating the core
rgbGen instance_name (
	.clka(clk),
        .ena(enable),
        .wea(1'b0),
        .addra(colour),
        .dina(24'b0),
        .douta(rgb)
);

endmodule
