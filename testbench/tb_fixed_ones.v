`timescale 1ns/1ps

module tb_puzzle;

    reg  clk;
    reg  rst_n;
    reg  enable;
    reg  I;
    wire [7:0] O;
    wire success;

    integer idx;

    // ---- Config ----------------------------------------------------------
    localparam NBITS      = 121;
    localparam NONES      = 38;
    localparam PROGRESS_INTERVAL = 10000; // print progress every N trials

    integer max_trials;   // 0 = unlimited
    integer dump_trials;  // 0 = unlimited (dump for whole run, if +dump given)

    top dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .I(I),
        .O(O),
        .success(success)
    );

    // 10 ns clock period
    initial clk = 0;
    always #5 clk = ~clk;

    // ---- Optional VCD dump, only if invoked with +dump ---------------------
    reg dump_enabled;
    initial begin
        dump_enabled = $test$plusargs("dump");
        if (dump_enabled) begin
            $dumpfile("reconstructed.vcd");
            $dumpvars(0, tb_puzzle);
        end

        if (!$value$plusargs("dump_trials=%d", dump_trials))
            dump_trials = 0; // 0 = no cutoff, dump for whole run

        if (dump_enabled && dump_trials > 0)
            $display("[%0t] Waveform dump will stop after %0d trials.", $time, dump_trials);
    end

    // ---- Random seed + logfile naming --------------------------------------
    // No $system dependency: pass a timestamp in from the shell with
    // +timestamp=..., since Verilog itself has no wall-clock access and
    // $system requires a VPI module whose install path varies by platform.
    integer rand_seed;
    integer reseed_copy;
    integer tmp_seeded;
    integer seed_was_given;
    string  logfile_name;
    string  timestamp_str;

    initial begin
        seed_was_given = $value$plusargs("seed=%d", rand_seed);
        if (!seed_was_given)
            rand_seed = 32'hDEADBEEF;

        reseed_copy = rand_seed;         // $random mutates its argument, so
        tmp_seeded  = $random(reseed_copy); // use a disposable copy, not rand_seed
        $display("[%0t] Using random seed = %0d", $time, rand_seed);

        if ($value$plusargs("logfile=%s", logfile_name)) begin
            $display("[%0t] Using explicit logfile name: %s", $time, logfile_name);
        end else begin
            if (!$value$plusargs("timestamp=%s", timestamp_str))
                timestamp_str = "unknown_time"; // fallback if none supplied

            if (seed_was_given)
                logfile_name = $sformatf("successes_seed%0d_%s.txt", rand_seed, timestamp_str);
            else
                logfile_name = $sformatf("successes_%s.txt", timestamp_str);

            $display("[%0t] Auto-generated logfile name: %s", $time, logfile_name);
        end
    end

    // ---- Max trials ------------------------------------------------------
    initial begin
        if (!$value$plusargs("max_trials=%d", max_trials))
            max_trials = 0; // 0 = unlimited
        if (max_trials > 0)
            $display("[%0t] Will stop after %0d trials.", $time, max_trials);
    end

    // ---- Fisher-Yates shuffle to build a 121-bit vector with exactly 38 ones
    integer perm [0:NBITS-1];

    task generate_vector(output reg [NBITS-1:0] vector);
        integer i, j, t;
        begin
            for (i = 0; i < NBITS; i = i + 1)
                perm[i] = i;

            for (i = NBITS-1; i > 0; i = i - 1) begin
                j = $random % (i+1);
                if (j < 0) j = j + (i+1); // $random can return negative
                t = perm[i];
                perm[i] = perm[j];
                perm[j] = t;
            end

            vector = {NBITS{1'b0}};
            for (i = 0; i < NONES; i = i + 1)
                vector[perm[i]] = 1'b1;
        end
    endtask

    // ---- Drive one vector into the DUT and sample the result --------------
    task run_vector(input [NBITS-1:0] vector, output reg out_success, output reg [7:0] out_O);
        begin
            rst_n  = 0;
            enable = 0;
            I      = 0;

            @(negedge clk);
            @(negedge clk);
            @(negedge clk);
            rst_n = 1;

            @(negedge clk);
            enable = 1;

            for (idx = NBITS-1; idx >= 0; idx = idx - 1) begin
                I = vector[idx];
                @(negedge clk);
            end

            enable = 0;

            repeat (31) @(negedge clk);

            out_success = success;
            out_O       = O;
        end
    endtask

    // ---- Main search loop ---------------------------------------------------
    integer trial_count;
    integer success_count;
    integer file_handle;
    integer file_ok;
    reg [NBITS-1:0] rand_vector;
    reg got_success;
    reg [7:0] got_O;

    initial begin
        trial_count   = 0;
        success_count = 0;

        file_handle = $fopen(logfile_name, "a");
        file_ok     = (file_handle != 0);

        if (file_ok)
            $display("[%0t] Logging successes to %s", $time, logfile_name);
        else
            $display("[%0t] WARNING: could not open %s - will stop after the first success.", $time, logfile_name);

        while ((max_trials == 0) || (trial_count < max_trials)) begin
            generate_vector(rand_vector);
            trial_count = trial_count + 1;

            run_vector(rand_vector, got_success, got_O);

            if (got_success) begin
                success_count = success_count + 1;
                $display("[%0t] SUCCESS #%0d on trial %0d: O=0x%0h vector=%b",
                          $time, success_count, trial_count, got_O, rand_vector);

                if (file_ok) begin
                    $fwrite(file_handle, "trial=%0d O=0x%0h vector=%b\n",
                            trial_count, got_O, rand_vector);
                    $fflush(file_handle);
                end else begin
                    $display("[%0t] Stopping: no file logging available.", $time);
                    $finish;
                end
            end

            if (dump_enabled && dump_trials > 0 && trial_count == dump_trials) begin
                $display("[%0t] Reached dump_trials=%0d, turning off waveform capture.", $time, dump_trials);
                $dumpoff;
            end

            if (trial_count % PROGRESS_INTERVAL == 0)
                $display("[%0t] progress: %0d vectors tested, %0d successes found",
                          $time, trial_count, success_count);
        end

        $display("[%0t] Done: %0d trials, %0d successes.", $time, trial_count, success_count);
        if (file_ok) $fclose(file_handle);
        $finish;
    end

endmodule