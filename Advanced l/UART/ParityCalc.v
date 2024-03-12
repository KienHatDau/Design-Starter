module parityCalc #(
    parameter DATAWIDTH=8
) (
    input clk,rst,
    input data_Valid,PAR_TYP,
    input [DATAWIDTH-1:0] P_DATA,
    output reg par_bit
);
reg [DATAWIDTH-1:0]memory;
integer i;
always @(posedge clk or negedge rst) begin
    if(!rst)
    memory<=0;
    else
    if(data_Valid)
    memory<=P_DATA;
end
always @(*) begin

    if(PAR_TYP==0)
    begin
        par_bit = memory[0];
        for(i=1;i<DATAWIDTH;i=i+1)
        begin
            par_bit=par_bit^memory[i];
        end
    end
    else
    begin
         par_bit = P_DATA[0];
        for(i=1;i<DATAWIDTH;i=i+1)
        begin
            par_bit=par_bit~^memory[i];
        end
    end 
end
   
endmodule