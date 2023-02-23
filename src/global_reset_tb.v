`timescale 1ns / 1ps



module global_reset_tb (
output reg slowest_sync_clk,
output reg ext_reset_in,
input peripheral_aresetn,

input  interconnect_aresetn,
input   peripheral_reset
    );
 
 
pl_reset_wrapper reset_test (.slowest_sync_clk(slowest_sync_clk) ,
.ext_reset_in(ext_reset_in) , 
.peripheral_aresetn(peripheral_aresetn) ,
.interconnect_aresetn(interconnect_aresetn) ,
.peripheral_reset(peripheral_reset)  ); 
    
always begin  slowest_sync_clk=1'b1; #5;  slowest_sync_clk=1'b0; #5;    end     // 100MHz Clock generation


initial begin
ext_reset_in=1'b1;
#70;
ext_reset_in=1'b0;
#70;
ext_reset_in=1'b1;
#50;


end
    
    
    
endmodule
