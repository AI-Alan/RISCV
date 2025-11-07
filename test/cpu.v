// cpu.v
module CPU (
    input clk
);

wire [31:0] a, b, result;
reg [3:0] alu_control;
reg reg_write;
reg [4:0] rd, rs1, rs2;

// Instantiate Register File
RegisterFile rf (
    .clk(clk),
    .reg_write(reg_write),
    .read_reg1(rs1),
    .read_reg2(rs2),
    .write_reg(rd),
    .write_data(result),
    .read_data1(a),
    .read_data2(b)
);

// Instantiate ALU
ALU alu (
    .a(a),
    .b(b),
    .alu_control(alu_control),
    .result(result)
);

// Hardcode ADD x3 = x1 + x2
initial begin
    alu_control = 4'b0000; // ADD
    rs1 = 5'd1; // x1
    rs2 = 5'd2; // x2
    rd  = 5'd3; // x3
    reg_write = 0;
    #5 reg_write = 1;
    #5 reg_write = 0;
end

endmodule
