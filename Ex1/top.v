//////////////////////////////////////////////////////////////////////////////////
// Exercise #1 - Electric Roller Blinds
// Student Name:
// Date: 
//
//  Description: In this exercise, you need to design a logical unit, where the  
//  where the inputs a,b select which roller control signal func to output according to the following
//  Truth table:
//
//  a | b | out
// -----------------
//  0 | 0 | func[0] - Closed
//  0 | 1 | func [1] - Quarter open
//  1 | 0 | func [2] - Half open
//  1 | 1 | func [3] - Fully open
//
//  inputs:
//           a, b, func[3:0]
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module blinds(
    input a,
    input b,
    input [3:0] func,
    output out
    );
    
    wire   out;
         
      assign out = func[2*a+b]; //Bad implementation
	// assign out = func[a+a+b]; //Better? (Still seems lazy though)
	// assign out = func[b'ab];	//Probably optimal but the synatax is wrong - I'm looking to concanenate in binary here!
	

endmodule
