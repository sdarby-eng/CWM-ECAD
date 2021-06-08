//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a counter of active IoT devices, where 
//  if the rst=1, the counter should be set to zero. If event=0, the value
//  should stay constant. If on-off=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, change, on_off
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module monitor (
	//Inputs and Outputs (ports) defined here
	input clk,
	input rst,
	input change,
	input on_off,
	output[7:0] counter_out
    );
                    
	reg r; 
	assign counter_out = r; //permanement pipe
 
	always @(posedge clk) //posedge rst not necessary
	begin
		if(rst)
			r <= 0;
		else if(change)
			begin
			if(on_off)
				r<= r + 1;
			else
				r<= r - 1;
			end
		//else pass is implicit (but would actually cause errors if written out!)
	end
      
endmodule
