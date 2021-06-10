//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Lights Selector
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex7 - Lights Selector
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////


module top_tb();

	//Instantiation
	    lightsSelector top (
		.clk(clk),
		.sel(sel),
		.rst(rst),
		.button(button),
		.light(light)
	    );

endmodule
