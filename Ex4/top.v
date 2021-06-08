//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 - Dynamic LED lights
// Student Name: Stephen Darby
// Date: 8/6/2021
//
//  Description: In this exercise, you need to design a LED based lighting solution, 
//  following the diagram provided in the exercises documentation. The lights change 
//  as long as a button is pressed, and stay the same when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           colour [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module LEDLights(
	input rst,
	input clk,
	input button,
	output [2:0] colour
	);

	reg [2:0] colour; 
	//Everything is held within this loop
	always @ (posedge clk) 
	begin
		if(rst) 
		begin
			colour = 3'b001;
		end
		
		else 
		begin
			if(button) 
				colour = colour + 3'b001;	
		end

		if ((colour== 3'b000)||(colour==3'b111)) 
			colour = 3'b001;
	end

endmodule
