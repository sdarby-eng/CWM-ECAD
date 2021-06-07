//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Active IoT Devices Monitor
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - Active IoT Devices Monitor
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
    //Parameters    
    parameter CLK_PERIOD = 10;

//Registers and wires
//All the registers except err are used for the inputs and outputs of the module, err is used as a flag //Wires for outputs, regs for anything that is being created (because it needs to be held outside of a block
	reg clk;
    reg rst;
    reg change;
	reg on_off;
    reg err;
	wire [7:0] counter_out;
    wire out;

//Clock generation
//This is taken from exercise 1 and 2, and so should work, though the speed is currently unknown
	initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

//User logic
//This needs to be used to test my module - it will be added after I have a functioning testbench!
	initial
	begin

	end
    
//Finish test, check for success
//An initial block that ends the simulation, and declares success (if valid)
//This can only run if err=0 after the pause. This will only occur if all of the tests pass
     initial begin
        #50 //This should probably be longer! Be careful!
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Instantiate counter module
//This syntax might be horribly wrong...
    monitor top (
     .clk (clk),
     .rst (rst),
     .on_off (on_off),
     .change (change),
	.counter_out (counter_out)	
     );
 
endmodule 
