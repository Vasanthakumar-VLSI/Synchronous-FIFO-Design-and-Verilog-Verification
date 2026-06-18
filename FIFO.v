module fifo(clk,rst,w_data,wt_en,rd_en,full,empty,rdata,underflow,overflow);
parameter w=8;
parameter d=4;
parameter dw=$clog2(d);
input [w-1:0]w_data;
input clk,rst,wt_en,rd_en;
reg [dw-1:0]wt_pt,rd_pt;
//reg [dw-1:0]count;
reg rd_flag,wt_flag;
reg [w-1:0]mem[d-1:0];
output reg [w-1:0]rdata;
output reg full,empty,overflow,underflow;
integer i;

always @(posedge clk)begin
	if(rst)begin
			overflow=0;
			underflow=0;
			rdata=0;
			wt_pt=0;
			wt_flag=0;
			rd_flag=0;
			rd_pt=0;
			full=0;
			empty=1;
			for(i=0;i<d;i=i+1) mem[i]=0;
		end
	else begin
		if(wt_en)begin
			if(!full)begin
				mem[wt_pt]=w_data;
				//count<=count+1;
				if(wt_pt==d-1)begin
				wt_flag=~wt_flag;
				wt_pt=0;
				end
				else
				wt_pt<=wt_pt+1;
				end
			else
				overflow=1;
		end
		else
			overflow=0;
		if(rd_en)begin
			if(!empty)begin
				rdata=mem[rd_pt];
				//count<=count-1;
				if(rd_pt==d-1)begin
				rd_flag=~rd_flag;
				rd_pt=0;
				end
				else
				rd_pt<=rd_pt+1;
				end
			else
				underflow=1;
		end
		else
		underflow=0;
	end
	full=(wt_pt==rd_pt && wt_flag != rd_flag);
	empty=(wt_pt==rd_pt && wt_flag == rd_flag); 
    
end
endmodule
