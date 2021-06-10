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
reg[23:0] rgbList [7:0];

//clock generation
initial
    begin
       clk = 1'b1;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end


//Testing
initial
begin
	//Storing the color values for future testing
	rgbList[0] = 24'h000000; 	//BLACK
	rgbList[1] = 24'h0000FF;	//BLUE	
	rgbList[2] = 24'h00FF00;	//GREEN
	rgbList[3] = 24'h00FFFF;	//CYAN
	rgbList[4] = 24'hFF0000;	//RED
	rgbList[5] = 24'hFF00FF;	//MAGENTA
	rgbList[6] = 24'hFFFF00;	//YELLOW
	rgbList[7] = 24'hFFFFFF;	//WHITE

	//initialising the registers
	prev_rgb=0;
	enable=0;
	colour=0;
	
	err=0;
	#PAUSE;
	
	forever
	begin
	//Saving values and incrementing
	prev_rgb = rgb;
	colour = colour + 1;
	#PAUSE;

	//Testing enable on
	enable=1;
	#PAUSE;
		if(prev_rgb  == rgb) 
		begin
			$display("Test Failed, RGB should change");
		          err = 1;
		end

	//Testing enable off
	enable=0;
	#PAUSE;
		if(prev_rgb  != rgb) 
		begin
			$display("Test Failed, RGB should not change");
		          err = 1;
		end
	end
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
ColourConverter top(
    .clk (clk), 
    .enable (enable), 
    .colour (colour), 
    .rgb (rgb)
    );

endmodule
