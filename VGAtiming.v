// horizontal constants

`define H_PW      96 // sync 同期信号　
`define H_FP      16 // front porch
`define H_DISPW  640 // active video 画面に映るところ
`define H_BP      48 // back porch
`define H_POL      0 // negative polarity 負の極性？

// vertical constants
`define V_PW       2 // sync
`define V_FP      10 // front porch, fixed from 33
`define V_DISPW  480 // active video
`define V_BP      33 // back porch, fixed from 10
`define V_POL      0 // negative polarity

/*
`define H_PW     136 // sync 同期信号　
`define H_FP      80 // front porch
`define H_DISPW 1280 // active video 画面に映るところ
`define H_BP     216 // back porch
`define H_POL      0 // negative polarity 負の極性？

// vertical constants
`define V_PW       3 // sync
`define V_FP       1 // front porch, fixed from 33
`define V_DISPW  960 // active video
`define V_BP      30 // back porch, fixed from 10
`define V_POL      0 // negative polarity
*/
module VGAtiming(
		 input PCLK_I,
		 input RST_I,
		 output BLANK_O,
		 output HSYNC_O,
		 output VSYNC_O,
		 output [12:0] HCNT_O,
		 output [12:0] VCNT_O
		 );
   reg [12:0] HCnt;  // horizontal counter
   reg [12:0] VCnt;  // vertical counter
   reg hsync, vsync; // horizontal/vertical sync
   reg blank; // data enable
   
   always @(posedge PCLK_I) begin //クロックたち上がり時には
      if (RST_I == 1) begin//リセット処理
	 HCnt <= `H_DISPW + `H_FP + `H_PW + `H_BP - 1; 
	 VCnt <= `V_DISPW + `V_FP + `V_PW + `V_BP - 1;
	 blank <= 0;
	 hsync <= 1;
	 vsync <= 1;
      end else begin
//**
	 // pixel/line counters and video data enable
	 if (HCnt == `H_DISPW + `H_FP + `H_PW + `H_BP - 1) begin
	    HCnt <= 0;
	    VCnt <= VCnt + 1;
	 end else begin
	    HCnt <= HCnt + 1;
	 end

	 if(VCnt== `V_DISPW + `V_FP + `V_PW + `V_BP - 1 && HCnt == `H_DISPW + `H_FP + `H_PW + `H_BP - 1) begin
	    VCnt  <= 0;
	 end

	if(`H_BP+`H_DISPW +`H_FP>= HCnt && `H_DISPW +`H_FP-1<=HCnt)begin
	    hsync<=0;
    end

	else	begin
	 hsync <= 1;
	end

	if(`V_BP+`V_DISPW +`V_FP>= VCnt && `V_DISPW +`V_FP-1<=VCnt)begin 
	   vsync<=0;
	end

	else	begin
	 vsync <= 1;
	end
	if(HCnt< `H_DISPW-1 && VCnt < `V_DISPW ||
	 HCnt==`H_DISPW + `H_FP + `H_PW + `H_BP - 1&&
	 ( VCnt < `V_DISPW-1 || VCnt == `V_DISPW + `V_FP + `V_PW + `V_BP - 1))begin
	 blank<=1;
	end
	else begin
	 blank <= 0;
	end

	end
    end

   assign HCNT_O = HCnt;
   assign VCNT_O = VCnt;
   assign HSYNC_O = `H_POL ? ~hsync:hsync;
   assign VSYNC_O = `V_POL ? ~vsync:vsync;
   assign BLANK_O = blank;

endmodule // VGAtiming

module clock2_25MHz(output reg clk_25MHz);
   initial clk_25MHz = 0;
   always  #20 clk_25MHz = ~clk_25MHz; // 1/(25x10^6)=40psec 
endmodule

module VGAtimingSim;
   wire clk_25MHz,blank,hsync,vsync;
   wire [10:0] hcnt,vcnt;
   reg 	reset;
   clock2_25MHz clock2_25MHz(clk_25MHz);
   VGAtiming VGAtiming(clk_25MHz,reset,blank,hsync,vsync,hcnt,vcnt);
   initial begin
      $display("clk reset hsync vsync blank hcnt vcnt   time(ns)");
      $monitor(" %b    %b     %b     %b     %b   %3d  %3d",clk_25MHz,reset,hsync,vsync,blank,hcnt,vcnt,$stime);
      reset = 0;
      @(posedge clk_25MHz) reset = 1;
      @(posedge clk_25MHz) reset = 0;
      #30000;
      $finish;
   end
endmodule // VGAtimingSim