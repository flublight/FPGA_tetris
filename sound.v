
module sound(input CLK, input RESET, input [4:0] BTN, output SPEAKER0, output SPEAKER1);
   reg [15:0] count;
   reg 	      s;

      reg [24:0] tquantum;
      reg [8:0] b16num;
	         
	 `define hi 440
         `define BPM 187

         `define so 82*`hi*2
         `define ra 73*`hi*2
         `define si 65*`hi*2
         `define octdo 61*`hi*2
          `define octre 54 *`hi*2
          `define octmi 48*`hi*2
          `define octfa 46*`hi*2
          `define octso 41*`hi*2
          `define octra 73*`hi
          `define octsi 65*`hi
           `define ooctdo 61*`hi
           `define ooctre 54 *`hi
           `define ooctmi 48*`hi
           `define ooctfa 46*`hi
           `define ooctso 41*`hi
           `define ooctra 73*`hi/2
           `define ooctsi 65*`hi/2
           `define Br 0

    always @(posedge CLK)begin 
    if(b16num==127)begin
	b16num<=0;
	end    else if(tquantum==25000000*60/(`BPM*4)-1) begin
        tquantum <= 0;
        b16num <= b16num + 1;
    end else begin
        tquantum <= tquantum + 1;
    end
    end
    
   always @(posedge CLK) begin
       if(RESET==1||BTN[3]==1)begin
       count <= 0;
	//tquantum<=0;
	//b16num<=0;
       s <= 0;
       end else if(b16num<128) begin 
         if((b16num==0 && count==`ooctmi)||
           (b16num==1 && count==`ooctmi)||
           (b16num==2 && count==`ooctmi)||
           (b16num==4 && count==`octsi)||
           (b16num==6 && count==`ooctdo)||
           (b16num==8 && count==`ooctre)||
           (b16num==10 && count==`ooctmi)||
           (b16num==11 && count==`ooctre)||
           (b16num==12 && count==`ooctdo)||
           (b16num==14 && count==`octsi)||
           (b16num==16 && count==`octra)||
           (b16num==16 && count==`octra)||
           (b16num==17 && count==`octra)||
           (b16num==20 && count==`octra)||
           (b16num==22 && count==`ooctdo)||
           (b16num==24 && count==`ooctmi)||
           (b16num==25 && count==`ooctmi)||
           (b16num==28 && count==`ooctre)||
           (b16num==30 && count==`ooctdo)||
           (b16num==32 && count==`octsi)||
           (b16num==33 && count==`octsi)||
           (b16num==36 && count==`octsi)||
           (b16num==38 && count==`ooctdo)||
           (b16num==40 && count==`ooctre)||
           (b16num==41 && count==`ooctre)||
           (b16num==44 && count==`ooctmi)||
           (b16num==45 && count==`ooctmi)||
           (b16num==48 && count==`ooctdo)||
           (b16num==49 && count==`ooctdo)||
           (b16num==52 && count==`octra)||
           (b16num==53 && count==`octra)||
           (b16num==56 && count==`octra)||
           (b16num==57 && count==`octra)||  
           (b16num==66 && count==`ooctre)||
           (b16num==67 && count==`ooctre)||
           (b16num==70 && count==`ooctfa)||
           (b16num==72 && count==`ooctra)||
           (b16num==74 && count==`ooctra)||
           (b16num==75 && count==`ooctra)||
           (b16num==76 && count==`ooctso)||
           (b16num==78 && count==`ooctfa)||
           (b16num==80 && count==`ooctmi)||
           (b16num==81 && count==`ooctmi)||
           (b16num==84 && count==`ooctmi)||
           (b16num==86 && count==`ooctdo)||
           (b16num==88 && count==`ooctmi)||
           (b16num==89 && count==`ooctmi)||
           (b16num==92 && count==`ooctre)||
           (b16num==94 && count==`ooctdo)||
           (b16num==96 && count==`octsi)||
           (b16num==97 && count==`octsi)||
           (b16num==100 && count==`octsi)||
           (b16num==102 && count==`ooctdo)||
           (b16num==104 && count==`ooctre)||
           (b16num==105 && count==`ooctre)||
           (b16num==108 && count==`ooctmi)||
           (b16num==109 && count==`ooctmi)||
           (b16num==112 && count==`ooctdo)||
           (b16num==113 && count==`ooctdo)||
           (b16num==116 && count==`octra)||
           (b16num==117 && count==`octra)||
           (b16num==120 && count==`octra)||
           (b16num==121 && count==`octra))begin
                count <= 0;
                s     <= ~s;
          end else begin
                count <= count+1;
          end
       end else begin
          count <= count+1;
       end
    end
 assign SPEAKER0 = s;
 assign SPEAKER1 = ~SPEAKER0; 
 
endmodule // sound


module clock_25MHz(output reg clk_25MHz);
   initial clk_25MHz = 0;
   always  #20 clk_25MHz = ~clk_25MHz; // 1/(25x10^6)=40nsec 
endmodule

module soundSim;
   wire CLK25M,speaker0,speaker1;
   reg [4:0] btn;
   reg       reset;
   clock_25MHz clock_25MHz(CLK25M);
   sound sound(CLK25M,reset,btn,speaker0,speaker1);
   initial begin
      $display("reset  speaker0 time(ns)");
      $monitor(" %b        %b   ",reset,speaker0,$stime);
      btn = 4'b0000;
      @(posedge CLK25M) reset = 1;
      @(posedge CLK25M) reset = 0;
      #20000000;
      $finish;
   end
endmodule // soundSim

