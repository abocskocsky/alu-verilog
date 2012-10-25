`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// 
// Design Name:   pulse_width_modulator
// Module Name:   test_pulse_width_modulator.v
// Authors:       Andrew Bocskocsky and Byron Hood
// 
////////////////////////////////////////////////////////////////////////////////

module test_pulse_width_modulator;

	// Inputs
	reg CLK;
	reg RSTB;
	reg [7:0] FREQ;
	reg [7:0] DUTY_CYCLE;

	// Outputs
	wire SIGNAL;

	// Instantiate the Unit Under Test (UUT)
	pulse_width_modulator uut (
		.CLK(CLK), 
		.RSTB(RSTB), 
		.FREQ(FREQ), 
		.DUTY_CYCLE(DUTY_CYCLE), 
		.SIGNAL(SIGNAL)
	);

   always #5 CLK = ~CLK;  // To emulate the 100MHz FGPA
	initial begin
		// Reset the PWM first
      CLK = 1'b0;
      RSTB = 1'b0;
      FREQ = 8'b0;
      DUTY_CYCLE = 8'b0;
      @(posedge(CLK));
		RSTB = 1'b1;

      // Now configure it with 50% duty cycle and 1 block of 256 cycles per wave.
		FREQ = 8'h0;
		DUTY_CYCLE = 8'h7f;
		repeat (512) @(posedge(CLK)); // 2 waves
      
      RSTB = 1'b0;
      @(posedge(CLK));
		RSTB = 1'b1;
      
      // Now configure it with 75% duty cycle and 3 blocks of 256 cycles per wave.
		FREQ = 8'h2;
		DUTY_CYCLE = 8'hbf;
		repeat (1536) @(posedge(CLK)); // 2 waves @ 3 blocks each
      
      RSTB = 1'b0;
      @(posedge(CLK));
		RSTB = 1'b1;
      
      // ~25% duty cycle and 1 block of 256 cycles per wave.
		FREQ = 8'h0;
		DUTY_CYCLE = 8'h3f;
		repeat (512) @(posedge(CLK)); // 2 waves @ 3 blocks each
      
      RSTB = 1'b0;
      @(posedge(CLK));
		RSTB = 1'b1;
      
      // 0% duty cycle and 1 block of 256 cycles per wave.
		FREQ = 8'h0;
		DUTY_CYCLE = 8'h0;
		repeat (512) @(posedge(CLK)); // 2 waves @ 3 blocks each
      
      RSTB = 1'b0;
      @(posedge(CLK));
		RSTB = 1'b1;
      
      // 100% duty cycle and 1 block of 256 cycles per wave.
		FREQ = 8'h0;
		DUTY_CYCLE = 8'hff;
		repeat (512) @(posedge(CLK)); // 2 waves @ 3 blocks each
      $finish;
	end
      
endmodule

