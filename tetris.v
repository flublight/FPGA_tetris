`timescale 1ns / 1ps
//work on Vivado 2016.2
module tetris(
             input CLK100M,               // 100MHz clock input
             input [4:0] BTN,             // Button (BTN4=BTNC,BTN3=BTND,BTN2=BTNR,BTN1=BTNL,BTN0=BTNU)
             input [3:0] SW,              // Switch (SW3,SW2,SW1,SW0)
             output [3:0] LED,            // LED    (LD3,LD2,LD1,LD0)
             output [3:0] VGA_RED, output [3:0] VGA_GREEN, output [3:0] VGA_BLUE,
             output VGA_HS, output VGA_VS,// VGA signals
             output SPEAKER0, output SPEAKER1 // Speaker
             );	    
   // make 25MHz clock from 100MHz clock
   reg [1:0] 	       count=0;
   wire 	       CLK25M;
   always @(posedge CLK100M) begin
      count <= count + 1;
   end
   assign CLK25M = count[1];
	
   // LED
   assign LED = {VGA_VS,VGA_HS,SW[1],SW[0]};
  
   // generate VGA video timing
   wire VtcVde;
   wire [12:0] VtcHCnt, VtcVCnt;
//   VGAtiming VGAtiming(CLK100M,BTN[0],VtcVde,VGA_HS,VGA_VS,VtcHCnt,VtcVCnt);//1280*960
   VGAtiming VGAtiming(CLK25M,BTN[0],VtcVde,VGA_HS,VGA_VS,VtcHCnt,VtcVCnt);
   assign VGA_RED   = VtcVde==0 ? 0:Red[7:4];
   assign VGA_GREEN = VtcVde==0 ? 0:Green[7:4];
   assign VGA_BLUE  = VtcVde==0 ? 0:Blue[7:4];

   // specify color for each pixel
   wire [7:0] Red,Green,Blue;
   color color(CLK25M,SW[1],VtcHCnt[9:0],VtcVCnt[8:0],Red,Green,Blue,BTN[4:0]);
   
   // generate sound
   sound sound(CLK25M, SW[0], BTN, SPEAKER0, SPEAKER1);
endmodule
