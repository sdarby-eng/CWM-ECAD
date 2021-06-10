//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - RGB Colour Converter
// Student Name: Stephen Darby
// Date: 10/6/21
//
// Description: A testbench module to test Ex6 - RGB Colour Converter
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module colourConverterTb();

parameter CLK_PERIOD = 10;
parameter PAUSE = 3*CLK_PERIOD;

reg clk;
reg enable;
reg[2:0] colour;
wire[23:0] rgb; 


reg err;
reg[23:0] prev_rgb;

//clock generation
initial
    begin
       clk = 1'b1;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end



//Finish test, check for success
initial begin
        #(1000)
        if (err==0) 
	begin
          $display("***TEST PASSED! :) ***");
        end
        
        $finish;
end

//THIS BIT FEELS ODD
ColourConverter notTop(
    .clk (clk), 
    .enable (enable), 
    .colour (colour), 
    .rgb (rgb)
    );

endmodule
