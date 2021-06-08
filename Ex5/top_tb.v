//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Air Conditioning
// Student Name: Stephen Darby
// Date: 8/6/21
//
// Description: A testbench module to test Ex5 - Air Conditioning
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 100ps 

module top_tb();
  
// Define any parameters
	parameter CLK_PERIOD = 10;
	parameter PAUSE = 3*CLK_PERIOD; 
  
// Define any registers and wires 
	reg clk; 
	reg [4:0] temperature; 
	wire heating; 
	wire cooling; 
	reg err; 

	integer randomTemp;
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
		temperature = 20;
		err = 0;

		forever
		begin
			#PAUSE;
			randomTemp = $unsigned($random)%32; //Picks a random temperature
			//temperature = randomTemp; IS THIS VALID???
			#PAUSE; //Lets the system sort itself out for a few clock cycles

			//Testing for all illegal states
			if(cooling && heating)
			begin
				 $display("***TEST FAILED! :(. Heating and Cooling! ***");
				err = 1;
			end

			else if(cooling && temperature<=20)
			begin
				 $display("***TEST FAILED! :(. Should not be cooling! ***");
				err = 1;
			end
			else if(heating && temperature>=20)
			begin
				 $display("***TEST FAILED! :(. Should not be heating! ***");
				err = 1;
			end
			else if(temperature>=22)
			begin
				 $display("***TEST FAILED! :(. Should be cooling! ***");
				err = 1;
			end
			else if(temperature<=18)
			begin
				 $display("***TEST FAILED! :(. Should be heating! ***");
				err = 1;
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

    ac top(
	.clk (clk),
	.temperature (temperature),
        .heating(heating),
        .cooling(cooling)
    );
	
endmodule
