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

//From the module
	reg clk;
    reg rst;
    reg change;
	reg on_off;
	wire [7:0] counter_out;

//For testing purposes
    reg err;
	reg [7:0] prev_counter_out;
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
//This needs to be used to test my module - there are only 8 cases (and everything is purely combinational) so I can do a simple exhastive test.
//Cases are numbered in binary for the values of rst/change/on_off respectively
//A 5-period pause is put in after each test to allow for easier reading of simulation data.
//Maybe (The above line is yet to be implemented!)
	initial
	begin
		//Initialising pre-forever
		rst=0;
		change=0;
		on_off=0;
		err=0;

		forever
		begin
		#CLK_PERIOD //Pause. Do I need to pause before every test to allow the clock to cycle???

		//Call_RAND is designed to randomly call the counter a few times to ensure there are nonzero values of counter_out immediately before the test step. This is yet to be implemented

		//The first 4 cases test whether the counter resets whenever rst goes high

		//Case 100
		//Call_RAND
		rst=1; change=0; on_off=0;
		if(counter_out!=0)
			begin
				$display("***TEST FAILED! counter_out==%d, expected out=0 - it's a reset! 					***",counter_out);
             err=1;
			end

		//Case 101
		//Call_RAND
		rst=1; change=0; on_off=1;
		if(counter_out!=0)
			begin
				$display("***TEST FAILED! counter_out==%d, expected out=0 - it's a reset! 					***",counter_out);
             err=1;
			end

		//Case 110
		//Call_RAND
		rst=1; change=1; on_off=0;
		if(counter_out!=0)
			begin
				$display("***TEST FAILED! counter_out==%d, expected out=0 - it's a reset! 					***",counter_out);
             err=1;
			end

		//Case 111
		//Call_RAND
		rst=1; change=1; on_off=1;
		if(counter_out!=0)
			begin
				$display("***TEST FAILED! counter_out==%d, expected out=0 - it's a reset! 					***",counter_out);
             err=1;
			end
		
		//The next two tests ensure that the counter remains constant when change is low

		//Case 000
		//Call_RAND
		prev_counter_out=counter_out;
		rst=0; change=0; on_off=0;
		if(counter_out!=prev_counter_out)
			begin
				$display("***TEST FAILED! counter_out==%d, prev_counter_out==%d - It should remain constant***",counter_out, prev_counter_out);
             err=1;
			end

		//Case 001
		//Call_RAND
		prev_counter_out=counter_out;
		rst=0; change=0; on_off=1;
		if(counter_out!=prev_counter_out)
			begin
				$display("***TEST FAILED! counter_out==%d, prev_counter_out==%d - It should remain constant***",counter_out, prev_counter_out);
             err=1;
			end

		//The final two testts ensure that the counter counts up or down as appropriate

		//Case 010
		//Call_RAND
		prev_counter_out=counter_out;
		rst=0; change=1; on_off=0;
		if(counter_out!=(prev_counter_out-1))
			begin
				$display("***TEST FAILED! counter_out==%d, prev_counter_out==%d - It should count down by one***",counter_out, prev_counter_out);
             err=1;
			end

		//Case 011
		//Call_RAND
		prev_counter_out=counter_out;
		rst=0; change=1; on_off=1;
		if(counter_out!=(prev_counter_out+1))
			begin
				$display("***TEST FAILED! counter_out==%d, prev_counter_out==%d - It should count up by one***",counter_out, prev_counter_out);
             err=1;
			end

		end
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
