//////////////////////////////////////////////////////////////////////////////////
// Exercise #7 - Lights Selector
// Student Name: Stephen Darby
// Date: 10/6/21
//
//  Description: In this exercise, you need to implement a selector between RGB 
// lights and a white light, coded in RGB. If sel is 0, white light is used. If
//  the sel=1, the coded RGB colour is the output.
//
//  inputs:
//           clk, sel, rst, button
//
//  outputs:
//           light [23:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module lightsSelector (input clk,
	input sel, 
	input rst, 
	input button, 
	output [23:0] light
	);

	//Defining White for the input to the multiplexer
	reg [23:0] white = 24'hFFFFFF;
	//Wiring RGB for the input to the mulitplexer
	wire [23:0] RGB;
	//Wiring colour for the input to the RGB converter
	wire [2:0] colour;

	//I note that enable (for the converter) should always be set to 1 here
	//No wire or register is necessary
	

	//Calling the lighting module (Ex 4)
	LEDLights LEDLights (
   	.rst(rst),	//From the main input
        .clk(clk),	//From the main input
        .button(button),//From the main input
        .colour(colour) //An output
	);

	//Calling the RGB Conversion module (Ex 6)
    	ColourConverter ColourConverter (
        .clk(clk),	//From the main input
        .colour(colour),//From LEDLights
        .enable(1),	//Always 1 in this implementation
        .rgb(RGB)	//An output
	);

	//Calling the multiplexer (Ex 2)
	multiplex24 Multiplexer (
        .a(white), 	//From this file
        .b(RGB),	//From ColourConverter
        .sel(sel),	//From the main input
        .out(light)	//The output!
    	);

endmodule




