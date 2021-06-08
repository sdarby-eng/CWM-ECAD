//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Dynamic LED lights
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex4 - Dynamic LED lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb();

	parameter CLK_PERIOD = 10;
	parameter PAUSE = 3*CLK_PERIOD;
  

    //Initialising regitsers and wires
    reg clk;
    reg rst;    
    reg button;    
    wire [2:0] colour;
    reg [2:0] colour_prev_state;
    reg err;

    //Clock generation
	initial 
	begin
		clk = 1'b0;
        	forever
         		#(CLK_PERIOD/2) clk=~clk;
    	end

	//Testing

	initial 
	begin 
		rst = 1;        
		err = 0;
		button = 1;;
		colour_prev_state = 0;

		//Reset Testing
		#PAUSE
		if (colour != 3'b001) 
		begin
		    err = 1;
		    $display("***TEST FAILED! Reset maps to 1!***");   
		end

		rst = 0;
		#PAUSE
		if (colour == 'b001) 
		begin
			#PAUSE
			if (colour == 'b001) 
			begin
		   		 err = 1;
		   		 $display("***TEST FAILED! Reset is off, so colour should change!***");   
	      		end   
		end

		//Button Testing
		#PAUSE
		button = 0;
		colour_prev_state = colour;
		#PAUSE
		if (colour != colour_prev_state) 
		begin
		    err = 1;
		    $display("***TEST FAILED! The button should stop incrementing things!***");   
		end
	
		//Testing for illegal states forever
		forever
		begin
			#PAUSE
			if (colour == 3'b111 || colour == 3'b000) 
			begin 
           			 err = 1;
           			 $display("***TEST FAILED! Illegal State Reached!***");
			end        
        	end  
	end





    //If no error flags, raised, success!
    initial begin
        #1000
        if (err==0)
            $display("***TEST PASSED! :) ***");
        $finish;
    end

    LEDLights top(
        .clk (clk),
	 .rst (rst),
        .button(button),
        .colour(colour)
    );

endmodule
