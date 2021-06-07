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
    
//Todo: Parameters
    //Parameters    
    parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg clk;
    reg rst;
    reg change;
	reg on_off;
	reg counter_out[7:0];
    reg err;
    wire out;

//Todo: Clock generation
	initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

//Todo: User logic
	initial
	begin

	end
    
//Todo: Finish test, check for success
     //An initial block that ends the simulation, and declares success (if valid)
     initial begin
        #50 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end

//Todo: Instantiate counter module
   //User's module
    monitor top (
     .clk (clk),
     .rst (rst),
     .on_off (on_off),
     .change (change)
     );
 
endmodule 
