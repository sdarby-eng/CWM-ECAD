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
	inout on_off,
	output counter_out[7:0]
    );
                    
    //Todo: add registers and wires, if needed
	reg r; //HELP!

    //Todo: add user logic

	always @(posedge clk or posedge rst)
	begin
	if(rst)
	r <= 0;
	else if(!change)
	pass; //This is probably invalid!
	else if(on_off)
	r<= r + 1;
	else
	r<= r - 1;

	//I need to find some way of getting r into counter_out here (but outside the if statement, which looks syntactically challenging. Unless if statements only support a single line after them...
	//should r just be counter_out?
	//If this is the case, r ought to be a wire, but r must be a register because it's in an always loop.

	end
      
endmodule
