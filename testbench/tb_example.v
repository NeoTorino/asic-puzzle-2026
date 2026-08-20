`timescale 1ns/1ps

module tb_puzzle;

    reg  clk;
    reg  rst_n;
    reg  enable;
    reg  I;
    wire [7:0] O;
    wire success;

    integer idx;

    // The two 121-bit vectors from the puzzle, taken as given, MSB (leftmost
    // character) first.
    reg [120:0] s1 = 121'b0010101000000010110000101001100000000010000001110110000100101100001110011000000010110000001011100000000010000011001110000;
    reg [120:0] s2 = 121'b1101011000010011110000000001000001000011000011101110000100001100001001011000000101110000110011100000000010000000000100000;

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
        $dumpfile("tb_puzzle.vcd");
        $dumpvars(0, tb_puzzle);
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
        run_vector(s2, "s2");
        $finish;
    end

endmodule
