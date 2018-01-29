module color(
	    	(* mark_debug ="true"*) input Clk, 
	    	(* mark_debug ="true"*) input Reset, 
	     input [9:0] Hcount, 
	     input [8:0] Vcount, 
	     output [7:0] Red, 
	     output [7:0] Green, 
	     output [7:0] Blue,
	  //   output SPEAKER1, 
         input [4:0] BTN,/*
	     	(* mark_debug ="true"*)input Btnl,
	    	(* mark_debug ="true"*) input Btnr,
	    	(* mark_debug ="true"*) input Btnu,
	    	(* mark_debug ="true"*) input Btns,*/
	    	(* mark_debug ="true"*) input [7:0]CONT//input from Controler

	     );
//display 

 //default
/*
	`define b0 16'b0000000000000000
	`define b1 16'b0000001000000001
	`define b2 16'b0000001111111111
	`define b3 16'b0000000111111110
	reg [127:0]back={`b2,`b1,`b1,`b1,`b1,`b1,`b1},pback={`b2,`b1,`b1,`b1,`b1,`b1,`b1};//ãƒ"ãƒƒãƒˆé??ã«è¶³ã-åˆã‚ã›ã¦èƒŒæ™¯ä½œæ??
*/
    `define b0 32'b00000000000000000000000000000000___
    `define b1 32'b00000000_00000000_10000000_00001000
    `define b2 32'b00000000_00000000_11111111_11111000
    `define b3 32'b00000000_00000000_11111111_11111000
    `define b4 32'b111111111111111111_11111111_1111111
        reg [511:0]back={`b2,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1},pback={`b2,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1,`b1};//ãƒ"ãƒƒãƒˆé??ã«è¶³ã-åˆã‚ã›ã¦èƒŒæ™¯ä½œæ??
	wire[511:0]block,block2,map;

    wire [23:0]c;
    assign c = colortable(block16x16(Hcount[4:1],Vcount[4:1]));
    assign pos = {Vcount[8:5], Hcount[9:5]};
    assign Red = map[pos]==1 ? c[ 7: 0]:0;
    assign Green = map[pos]==1 ? c[15: 8]:0;
    assign Blue = map[pos]==1 ? c[23:16]:0;
    wire [8:0] pos;//1ãŒã‚ã‚‹ã‹ãªã?ã‹ã?®çœŸç†å€¤
    
    
    `define next_x 32//16
       
        
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
        
        assign block=blocking(kaiten,r,x,y);
        assign map = 
           {`b3 >> (32-score)
//         , back[111:0]|block[111:0]
         , back[481:0]|block[481:0]
                 };
        
        function [23:0] colortable;
            input [1:0] index_i; // 0-Black, 1-SandyBrown, 2-Brown, 3-White
            reg [23:0] CTBL [0:3] = {24'h100000,24'hF4A460,24'hA52A2A,24'hFFFFFF};
            colortable = CTBL[index_i];
        endfunction

/*
        assign pos={Vcount[8:6], Hcount[9:6]};//ç¸¦ã¯8å€‹ã?æ¨ªã¯?¼'ï¼å?‹å?è¡¨ç¤ºå¯èƒ½    
        assign Red = map[pos]==1 ? 0:0;
        assign Green = map[pos]==1 ? 255:0;
        assign Blue = map[pos]==1 ? 255:0;
    */
   function [511:0] blocking;
         input [2:0]k;
         input [1:0]rr;
         input [5:0]xx;
         input [5:0]yy;
  
      begin 
                               
      
      if(k==0)
                         case(rr)
            
                         0: blocking =(1<<xx|1<<xx+1)<<yy*`next_x |(1<<xx|1<<xx+1)<<yy*`next_x+`next_x;
                         1: blocking =(1<<xx|1<<xx+1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx+1)<<yy*`next_x-`next_x;
                         2: blocking =(1<<xx|1<<x+1|1<<x-1)<<yy*`next_x|(1<<xx)<<yy*`next_x-`next_x;
                         3: blocking =(1<<xx|1<<x+1|1<<x-1|1<<x-2)<<yy*`next_x;
                         endcase
                    else if(k==1)
                    case(rr)
                         0: blocking =(1<<xx|1<<xx+1)<<yy*`next_x |(1<<xx|1<<xx+1)<<yy*`next_x+`next_x;
                         1: blocking =(1<<xx|1<<xx-1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx+1)<<yy*`next_x+`next_x;
                         2: blocking =(1<<xx|1<<xx-1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx)<<yy*`next_x-`next_x;
                         3: blocking =(1<<xx)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx) <<yy*`next_x-`next_x|(1<<xx)<<yy*`next_x-2*`next_x;                    endcase
                    if(k==2)
                                    case(rr)
                          0: blocking =(1<<xx|1<<xx+1)<<yy*`next_x |(1<<xx|1<<xx+1)<<yy*`next_x+`next_x;
                                    1: blocking =(1<<xx|1<<xx+1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx+1)<<yy*`next_x-`next_x;
                                    2: blocking =(1<<xx|1<<x+1|1<<x-1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x;
                                    3: blocking =(1<<xx|1<<x+1|1<<x-1|1<<x-2)<<yy*`next_x;
                                    endcase
                               else if(k==3)
                               case(rr)
                        0: blocking =(1<<xx|1<<xx+1)<<yy*`next_x |(1<<xx|1<<xx+1)<<yy*`next_x+`next_x;
                                    1: blocking =(1<<xx|1<<xx-1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx+1)<<yy*`next_x-`next_x;
                                    2: blocking =(1<<xx|1<<xx+1)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx)<<yy*`next_x-`next_x;
                                    3: blocking =(1<<xx)<<yy*`next_x|(1<<xx)<<yy*`next_x+`next_x|(1<<xx) <<yy*`next_x-`next_x|(1<<xx)<<yy*`next_x-2*`next_x;
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
                   
//sound	
	reg musicflag;
	reg [31:0] musictime;

//system
 `define next_x 32//16
   
	reg [5:0] x=10;
	(* mark_debug ="true"*)reg [4:0] y=0,cline;	
	reg [1:0] r;
	(* mark_debug ="true"*)reg [31:0] count=1,count2;
	reg [35:0] pushtime,diff;
	(* mark_debug ="true"*)reg [34:0] next=10000000/2-1,pnext=1;
	reg [10:0] round=1;
	reg [511:0] isline;
	reg botan,botanold;
	reg [1:0]kaiten;
	reg [31:0]score;
wire[3:0]CRT;
	(* mark_debug ="true"*)reg gameover;//term ã§ä¸?å®šæ™‚é-"å?¦ç?
	(* mark_debug ="true"*)wire bibun;
    wire [5:0] isline;
    reg s,p,dwn;
    assign bibun= botan & ~botanold ;
    assign CRT[0]=CONT[0]|CONT[4];
    assign CRT[1]=CONT[1]|CONT[5];
    assign CRT[2]=CONT[2]|CONT[6];
    assign CRT[3]=CONT[3]|CONT[7];
    assign Btnu=BTN[0];
    assign Btnl=BTN[1];
    assign Btnr=BTN[2];
    assign Btnd=BTN[3];
    assign Btnc=BTN[4];
    //assign SPEAKER1=s;


always @(posedge Clk) begin //game

	
   	 //ãƒªã‚»ãƒ?ãƒˆå?¦ç?
	if(Reset|gameover)begin
	   //x<=16'b0000000000010000;
       x<=7;
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

    else if((back[31:0]&block))begin
         gameover<=1;
    end
    
                     //ä¸?ç•ªä¸‹ã¾ã§è½ã¡ãŸæ™‚ã®å‡¦ç?    
    else 
        //if ((pnext+1000000)==next)begin
         if((block<<`next_x) & back && pnext==next)begin  //block touthed bottoms
         back  <=back | block;
         x<=7;
         y<=0;       
         round<=round+1;
         kaiten<=0;
         r<=(r+13+pushtime);
         pnext<=1;
         count2<=0;         
         pushtime<=0;
         dwn<=0;
    end
            
            
                //ã‚«ã‚¦ãƒ³ãƒˆè½ä¸‹åˆ¶å¾¡
    else if(count2==next)begin//block falls
      y<=y+1;
     count2<=0;
     pnext<=1;
    end 
                 

                //ãƒ-ãƒ­ãƒ?ã‚¯ã®æ¨ªç§»å‹? 
         
    else if(Btnl|CRT[1] && bibun&& !((block>>1)&back))begin// && !(block-1)&back)begin
        x<=x-1;  
        botan<=1;
    end else if(Btnr|CRT[2] && bibun&&!((block<<1)&back))begin
        x<=x+1; 
        botan<=1;                    
    end
    
                     
    else if(round%8==0)begin
         next<=next-50000*round;    
         round<=round+1;
     end
  /*
             else if (back[`next_x*13-1:12*`next_x]==`b2)begin
  //        back[95:80]<= `b1;
              back[`next_x-1:0]<=  `b1;        
      back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
      back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
      back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
      back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
      back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
      back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
      back[`next_x*8-1:7*`next_x] <= back[`next_x*7-1:6*`next_x];
      back[`next_x*9-1:8*`next_x] <= back[`next_x*8-1:7*`next_x];
      back[`next_x*12-1:11*`next_x] <= back[`next_x*11-1:10*`next_x];
      back[`next_x*13-1:12*`next_x] <= back[`next_x*12-1:11*`next_x];
                score<=score+1;
          musicflag<=1;
      end
   */
          else if (back[`next_x*12-1:11*`next_x]==`b2)begin
   //        back[95:80]<= `b1;
               back[`next_x-1:0]<=  `b1;        
       back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
       back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
       back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
       back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
       back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
       back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
       back[`next_x*8-1:7*`next_x] <= back[`next_x*7-1:6*`next_x];
       back[`next_x*9-1:8*`next_x] <= back[`next_x*8-1:7*`next_x];
       back[`next_x*10-1:9*`next_x] <= back[`next_x*9-1:8*`next_x];
       back[`next_x*11-1:10*`next_x] <= back[`next_x*10-1:9*`next_x];
       back[`next_x*12-1:11*`next_x] <= back[`next_x*11-1:10*`next_x];
               score<=score+1;
           musicflag<=1;
       end
          else if (back[`next_x*11-1:10*`next_x]==`b2)begin
             //        back[95:80]<= `b1;
                         back[`next_x-1:0]<=  `b1;        
                 back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
                 back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
                 back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
                 back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
                 back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
                 back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
                 back[`next_x*8-1:7*`next_x] <= back[`next_x*7-1:6*`next_x];
                 back[`next_x*9-1:8*`next_x] <= back[`next_x*8-1:7*`next_x];
                 back[`next_x*10-1:9*`next_x] <= back[`next_x*9-1:8*`next_x];
                 back[`next_x*11-1:10*`next_x] <= back[`next_x*10-1:9*`next_x];
                                       score<=score+1;
                     musicflag<=1;
                 end
                           else if (back[`next_x*10-1:9*`next_x]==`b2)begin
                             //        back[95:80]<= `b1;
                                         back[`next_x-1:0]<=  `b1;        
                                 back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
                                 back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
                                 back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
                                 back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
                                 back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
                                 back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
                                 back[`next_x*8-1:7*`next_x] <= back[`next_x*7-1:6*`next_x];
                                 back[`next_x*9-1:8*`next_x] <= back[`next_x*8-1:7*`next_x];
                                 back[`next_x*10-1:9*`next_x] <= back[`next_x*9-1:8*`next_x];
                                       score<=score+1;
                                     musicflag<=1;
                                 end

   else if (back[`next_x*9-1:8*`next_x]==`b2)begin
  //        back[95:80]<= `b1;
              back[`next_x-1:0]<=  `b1;        
      back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
      back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
      back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
      back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
      back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
      back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
      back[`next_x*8-1:7*`next_x] <= back[`next_x*7-1:6*`next_x];
      back[`next_x*9-1:8*`next_x] <= back[`next_x*8-1:7*`next_x];
          score<=score+1;
          musicflag<=1;
      end
   else if (back[`next_x*8-1:7*`next_x]==`b2)begin
   //        back[95:80]<= `b1;
               back[`next_x-1:0]<=  `b1;        
       back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
       back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
       back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
       back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
       back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
       back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
       back[`next_x*8-1:7*`next_x] <= back[`next_x*7-1:6*`next_x];
     score<=score+1;
           musicflag<=1;
       end
   else if (back[`next_x*7-1:6*`next_x]==`b2)begin
    //        back[95:80]<= `b1;
                back[`next_x-1:0]<=  `b1;        
        back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
        back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
        back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
        back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
        back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
        back[`next_x*7-1:6*`next_x] <= back[`next_x*6-1:5*`next_x];
        score<=score+1;
            musicflag<=1;
        end

   else if (back[`next_x*6-1:5*`next_x]==`b2)begin
  //        back[95:80]<= `b1;
              back[`next_x-1:0]<=  `b1;        
      back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
      back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
      back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
      back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
      back[`next_x*6-1:5*`next_x] <= back[`next_x*5-1:4*`next_x];
          score<=score+1;
          musicflag<=1;
      end

       else if (back[`next_x*5-1:4*`next_x]==`b2)begin
    //        back[95:80]<= `b1;
            back[`next_x-1:0]<=  `b1;        
            back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
            back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
            back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
            back[`next_x*5-1:4*`next_x] <= back[`next_x*4-1:3*`next_x];
            score<=score+1;
            musicflag<=1;
        end

           else if (back[`next_x*4-1:3*`next_x]==`b2)begin
            back[`next_x-1:0]<=  `b1;        
           back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
           back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
           back[`next_x*4-1:3*`next_x] <= back[`next_x*3-1: 2*`next_x];
                score<=score+1;
                musicflag<=1;
            end

               else if (back[`next_x*3-1:2*`next_x]==`b2)begin
               back[`next_x-1:0]<=  `b1;        
               back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
               back[`next_x*3-1:2*`next_x] <= back[`next_x*2-1:`next_x];
                    score<=score+1;
                    musicflag<=1;
                end

                   else if (back[`next_x*2-1:`next_x]==`b2)begin
                   back[`next_x-1:0]<=  `b1;        
                   back[`next_x*2-1:`next_x] <= back[`next_x-1:0];
                   score<=score+1;
                        musicflag<=1;
                    end


       else begin    
       
       musicflag<=0;
       botan<=0; 
       botanold<=0;
       count2<=count2+1;
       pnext<=pnext+1;
        end
      
                 //ãƒãƒ£ã‚¿ãƒªãƒ³ã‚°é˜²æ­¢ã®ç‚º      
       if(botan)begin
        botanold<=1;
            end     
        
       if(Btnr==1||Btnl==1||Btnc==1||Btnd==1||CRT[0]||CRT[1]||CRT[2]||CRT[3])begin
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
       //å›žè»¢
       if ((Btnc|CRT[0])&bibun)begin
          kaiten<=kaiten+1;
       end  
       else if((Btnd|CRT[0])&&pushtime!=0 &&!((block<<`next_x) & back)&&dwn)begin
                  y<=y+1;
          end
      else if(dwn==0)begin
            dwn<=1;
      end
    cline<=cline+1;                       
    isline<=back[31:0]<<cline*`next_x;
      
end

/*	
	function check;
input [127:0] map_i;
input [3:0] x_i;
input [2:0] y_i;
input signed [3:0] offset_x_i;
input signed [2:0] offset_y_i;
begin
check = map_i[((x_i + offset_x_i) & 4â€™b1111)
+ ((y_i + offset_y_i) & 3â€™b111) *16];
end
endfunction
*/


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