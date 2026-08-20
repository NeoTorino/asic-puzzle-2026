`timescale 1ns/1ps

module tb_test;

    reg  clk;
    reg  rst_n;
    reg  enable;
    reg  I;
    wire [7:0] O;
    wire success;

    integer idx;

    // MSB (leftmost character) first.
    reg [120:0] s1 = 121'b0000000101010000100000000000010101010000000000001010000001000001000000100000101000010000000100000010000010010001010000000;

    top dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .I(I),
        .O(O),
        .success(success)
    );

    // Generate VCD waveform
    initial begin
        $dumpfile("tb_test.vcd");
        $dumpvars(0, tb_test);
    end


    // 10 ns clock period
    initial clk = 0;
    always #5 clk = ~clk;

    task run_vector(input [120:0] vector, input [127:0] label);
        begin
            $display("---- Running %0s ----", label);

            rst_n  = 0;
            enable = 0;
            I      = 0;

            @(negedge clk);
            @(negedge clk);

            @(negedge clk);
            rst_n = 1;
            $display("%0t  rst_n -> 1", $time);

            @(negedge clk);
            enable = 1;
            $display("%0t  enable -> 1", $time);

            for (idx = 120; idx >= 0; idx = idx - 1) begin
                I = vector[idx];
                @(negedge clk);
            end

            enable = 0;

            $display("%0t  enable -> 0", $time);

            repeat (31) begin
                @(negedge clk);
                $display("%0t  %0s -> O = %b  0x%0h  ASCII='%c'  success=%b", $time, label, O, O, O, success);
            end

            $display("%0s -> O = %b (0x%0h)  success = %b", label, O, O, success);
            $display("");
        end
    endtask

    initial begin
        run_vector(s1, "s1");
        $finish;
    end

endmodule
