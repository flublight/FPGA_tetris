module color(
	    	(* mark_debug ="true"*) input Clk, 
	    	(* mark_debug ="true"*) input Reset, 
	     input [9:0] Hcount, 
	     input [8:0] Vcount, 
	     output [7:0] Red, 
	     output [7:0] Green, 
	     output [7:0] Blue,
	  //   output SPEAKER1, 
	     	(* mark_debug ="true"*)input Btnl,
	    	(* mark_debug ="true"*) input Btnr,
	    	(* mark_debug ="true"*) input Btnu,
	    	(* mark_debug ="true"*) input Btns,
	    	(* mark_debug ="true"*) input [7:0]CONT
	     );

	`define b0 16'b0000000000000000
	`define b1 16'b0000001000000001
	`define b2 16'b0000001111111111
	`define b3 16'b0000000111111110


	reg [127:0]used,back={`b2,`b1,`b1,`b1,`b1,`b1,`b1},pback={`b2,`b1,`b1,`b1,`b1,`b1,`b1};//ビット�??に足し合わせて背景作�??
	
	reg [3:0] x=4;
	(* mark_debug ="true"*)reg [2:0] y=0,cline;	
	reg [1:0] r=2;
	(* mark_debug ="true"*)reg [31:0] count=1,count2;
	reg [31:0] musictime;
	reg [35:0] pushtime,diff;
	(* mark_debug ="true"*)reg [34:0] next=10000000/2-1,pnext=1;
	reg [10:0] round=1;
	reg [127:0] isline;
	reg botan,botanold,kaiten=0;
	reg [15:0]score;
	reg musicflag;
	wire[127:0]block,block2,map;
	wire[3:0]CRT;
	(* mark_debug ="true"*)reg gameover;//term で�?定時間�?��?
	(* mark_debug ="true"*)wire bibun;
    wire [6:0] pos;//1があるかな�?か�?�真理値
    wire [3:0] isline;
    reg s,p;
    assign bibun= botan & ~botanold ;
    assign CRT[0]=CONT[0]|CONT[4];
    assign CRT[1]=CONT[1]|CONT[5];
    assign CRT[2]=CONT[2]|CONT[6];
    assign CRT[3]=CONT[3]|CONT[7];
/*
	assign pos={Vcount[8:6], Hcount[9:6]};//縦は8個�?�横は?��０�?��?表示可能	
	assign Red = map[pos]==1 ? 0:0;
    assign Green = map[pos]==1 ? 255:0;
    assign Blue = map[pos]==1 ? 255:0;
*/
    assign block=blocking(kaiten,r,x,y);
      assign map = 
      {//16'b1111111111111111 >> (16-p)
         16'b0000000000000000+score
    , back[111:0]|block[111:0]};
  
    wire [23:0]c;
    assign c = colortable(block16x16(Hcount[5:2],Vcount[5:2]));
    assign pos = {Vcount[8:6], Hcount[9:6]};
    assign Red = map[pos]==1 ? c[ 7: 0]:0;
    assign Green = map[pos]==1 ? c[15: 8]:0;
    assign Blue = map[pos]==1 ? c[23:16]:0;
    //assign SPEAKER1=s;

   function [127:0] blocking;
        input k;
        input [1:0]rr;
        input [3:0]xx;
        input [2:0]yy;
     begin if(k==0)
                case(rr)
                0: blocking =(1<<xx)<<yy*16 ;
                1: blocking =(1<<xx|1<<x+1)<<yy*16;
                2: blocking =(1<<xx|1<<x+1|1<<x-1)<<yy*16;
                3: blocking =(1<<xx|1<<x+1|1<<x-1|1<<x-2)<<yy*16;
                endcase
           else case(rr)
                0: blocking =(1<<xx)<<yy*16 ;
                1: blocking =(1<<xx) << yy*16 |(1 << xx) << yy*16+16;
                2: blocking =(1<<xx)<<yy*16|(1<<xx)<<yy*16+16|(1<<xx)<<yy*16-16;
                3: blocking =(1<<xx)<<yy*16|(1<<xx)<<yy*16+16|(1<<xx) <<yy*16-16|(1<<xx)<<yy*16-32;
           endcase
                           
      end
   endfunction  
             
 
   function [7:0] mseqf8_0 (input [7:0] din);
      reg xor_result;
      begin
       xor_result = din[7] ^ din[3] ^ din[2] ^ din[1];
       mseqf8_0 = {din[6:0], xor_result};
      end
   endfunction
                  
  function [7:0] mseqf8_1 (input [7:0] din);
      reg xor_result;
      begin
            xor_result = din[7] ^ din[4] ^ din[2] ^ din[0];
            mseqf8_1 = {din[6:0], xor_result};
      end
  endfunction
                  
always @(posedge Clk) begin

	
   	 //リセ�?ト�?��?
	if(Reset==1&&gameover==1)begin
	   //x<=16'b0000000000010000;
       x<=4;
       y<=0;    
       kaiten<=0;
       back<=pback;
	   count2<=0;
	   round<=1;
	   score<=0;
	   next<=15000000-1;
	   gameover<=0;
	   r<=2;	   

	end 

    else if((back[15:0]&block))begin
         gameover<=1;
    end
    
                     //�?番下まで落ちた時の処�?    
    else 
        //if ((pnext+1000000)==next)begin
         if((block<<16) & back && pnext==next)begin  
         back  <=back | block;
         x<=4;
         y<=0;       
         round<=round+1;
         kaiten<=0;
         r<=r+1;
         pnext<=1;
         p=0;
        // r<=mseqf8_0(r)>>r+count2;
         count2<=0;
         
    end
            
            
                //カウント落下制御
    else if(count2==next)begin
      y<=y+1;
     count2<=0;
     pnext<=1;
    end 
                 

                //ブロ�?クの横移�? 
         
    else if(Btnl|CRT[1] && bibun&& !((block>>1)&back))begin// && !(block-1)&back)begin
        x<=x-1;  
    end else if(Btnr|CRT[2] && bibun&&!((block<<1)&back))begin
        x<=x+1; 
        botan<=1;                    
    end
    
                     
    else if(round%8==0)begin
         next<=next-100000*round;    
         round<=round+1;
     end

   else if (back[95:80]==`b2)begin
//        back[95:80]<= `b1;
        back[15:0]<=  `b1;        
        back[31:16] <= back[15:0];
        back[47:32] <= back[31:16];
        back[63:48] <= back[47:32];
        back[79:64] <= back[63:48];
        back[95:80] <= back[79:64];
        score<=score+1;
        musicflag<=1;
    end

       else if (back[79:64]==`b2)begin
    //        back[95:80]<= `b1;
            back[15:0]<=  `b1;        
            back[31:16] <= back[15:0];
            back[47:32] <= back[31:16];
            back[63:48] <= back[47:32];
            back[79:64] <= back[63:48];
            score<=score+1;
            musicflag<=1;
        end

           else if (back[63:48]==`b2)begin
        //        back[95:80]<= `b1;
                back[15:0]<=  `b1;        
                back[31:16] <= back[15:0];
                back[47:32] <= back[31:16];
                back[63:48] <= back[47:32];
                score<=score+1;
                musicflag<=1;
            end

               else if (back[47:32]==`b2)begin
            //        back[95:80]<= `b1;
                    back[15:0]<=  `b1;        
                    back[31:16] <= back[15:0];
                    back[47:32] <= back[31:16];
                    score<=score+1;
                    musicflag<=1;
                end

                   else if (back[31:16]==`b2)begin
                //        back[95:80]<= `b1;
                        back[15:0]<=  `b1;        
                        back[31:16] <= back[15:0];
                        score<=score+1;
                        musicflag<=1;
                    end


       else begin    
       musicflag<=0;
       botan<=0; 
       botanold<=0;
       pushtime<=0;
       count2<=count2+1;
       pnext<=pnext+1;
        end
      
                 //チャタリング防止の為      
       if(botan)begin
        botanold<=1;
            end     
        
       if(Btnr==1||Btnl==1||Btnu==1||Btns==1||CRT[0]||CRT[1]||CRT[2]||CRT[3])begin
         botan<=1;    
         pushtime<=pushtime+1;  
       end        
       
       if(musictime==8000000)begin
       musictime<=0;
       musicflag<=0;
       end
       
       if(musicflag)begin
         musictime<=musictime+1; 
        s<=~s;
       end
       //回転
       if ((Btnu==1||Btns==1||CRT[0])&&bibun)begin
          kaiten<=kaiten+1;
       end  
       
    cline<=cline+1;                       
    isline<=back[15:0]<<cline*16;
      
end

/*	
	function check;
input [127:0] map_i;
input [3:0] x_i;
input [2:0] y_i;
input signed [3:0] offset_x_i;
input signed [2:0] offset_y_i;
begin
check = map_i[((x_i + offset_x_i) & 4’b1111)
+ ((y_i + offset_y_i) & 3’b111) *16];
end
endfunction
*/


    function [1:0] block16x16;// returns one of 4 colors for each pixel
        input [3:0] x_i;
        input [3:0] y_i;
        reg [15:0] data0 [0:15]
        = {16'h7FFE,16'h3FFD,16'h1FFB,16'h0FF7,16'h000F,16'h000F,16'h000F,16'h000F,
        16'h000F,16'h000F,16'h000F,16'h000F,16'h0007,16'h0003,16'h0001,16'h0000};
        reg [15:0] data1 [0:15]
        = {16'h0001,16'h0002,16'h0004,16'h0008,16'h0FF0,16'h0FF0,16'h0FF0,16'h0FF0,
        16'h0FF0,16'h0FF0,16'h0FF0,16'h0FF0,16'h1000,16'h2000,16'h4000,16'h8000};
        block16x16 = ((data0[y_i] >> x_i) & 1) | ((data1[y_i] >> x_i) & 1) << 1;
    endfunction
    
    
    function [23:0] colortable;
        input [1:0] index_i; // 0-Black, 1-SandyBrown, 2-Brown, 3-White
        reg [23:0] CTBL [0:3] = {24'h100000,24'hF4A460,24'hA52A2A,24'hFFFFFF};
        colortable = CTBL[index_i];
    endfunction


/*
      $display("reset  speaker0 time(ns)");
      $monitor(" %b   %b     %b  ",Btnr,x,y);
      btn = 4'b0000;
      @(posedge CLK)#10;
	
	#50
	Btnr=1;
	#50 Btnr=0;

      $finish;
*/

endmodule
