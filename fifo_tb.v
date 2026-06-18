`include"FIFO.v"
module top;

parameter w=8;
parameter d=8;
reg [w-1:0]w_data;
reg clk,rst,wt_en,rd_en;
wire full,empty,overflow,underflow;
wire [w-1:0]rdata;
integer i,j;
fifo #(.d(d),.w(w)) uut(
				.clk(clk),
				.rst(rst),
				.w_data(w_data),
				.wt_en(wt_en),
				.rd_en(rd_en),
				.full(full),
				.empty(empty),
				.rdata(rdata),
				.overflow(overflow),
				.underflow(underflow));
always #5 clk=~clk;
initial begin
	$monitor("%0t Overflow=%b Underflow=%b Full=%b Empty=%b",$time,overflow,underflow,full,empty);
	clk=0;
	reset();
	write(0,d);
	read(0,d);
	@(posedge clk);
	#500;
	$stop;
end
task reset();begin
	rst=1;
	w_data=0;
	wt_en=0;
	rd_en=0;
	repeat(2)@(posedge clk);
	rst=0;
end
endtask
task write(input integer a,b);
begin
	for(i=a;i<b;i=i+1)begin
		wt_en=1;
		w_data=$random;
		@(posedge clk);
	end
	wt_en=0;
	w_data=0;
end
endtask
task read(input integer a,b);begin
	for(j=a;j<b;j=j+1)begin
		rd_en=1;
		@(posedge clk);
		end
		rd_en=0;
	end
endtask
endmodule
