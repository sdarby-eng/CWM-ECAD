//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 - Air Conditioning
// Student Name: Stephen Darby	
// Date: 8/6/21
//
//  Description: In this exercise, you need to an air conditioning control system
//  According to the state diagram provided in the exercise.
//
//  inputs:
//           clk, temperature [4:0]
//
//  outputs:
//           heating, cooling
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/ 100ps 

module ac(input clk, 
	input [4:0] temperature, 
	output reg heating, 
	output reg cooling); 
  
//The transition values
parameter coolOn = 22; 
parameter heatOn = 18; 
parameter idleOn = 20;


always @(posedge clk)
begin
	if(heating) //In the heating state (or both)
	begin
		if(temperature>=idleOn)
		begin
			heating<=0;
			cooling<=0;
		end
	end
	else if (cooling) //In the cooling state (or both)
	begin
		if(temperature<=idleOn)
		begin
			cooling<=0;
			heating<=0;
		end
	end
	else //In the idle state
	begin
		if(temperature<=heatOn)
		begin
			heating<=1;
			cooling<=0;
		end
		else if(temperature>=coolOn)
		begin
			cooling<=1;
			heating<=0;
		end
	end
end


endmodule

