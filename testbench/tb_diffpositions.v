`timescale 1ns/1ps

module tb_puzzle;

    reg  clk;
    reg  rst_n;
    reg  enable;
    reg  I;
    wire [7:0] O;
    wire success;

    integer idx;
    integer j;

    // ---- Config ------------------------------------------------------
    localparam NBITS = 121;
    localparam NDIFF = 30;   // positions where s1/s2 differ
    localparam KONES = 15;   // number of those 30 that must be 1
    localparam integer TOTAL_SPACE = 155117520; // C(30,15)

    // 91-bit skeleton: agreement bits from s1/s2, diff positions zeroed.
    reg [NBITS-1:0] base_vector = 121'h4058020040cc2184300601c010020;

    // Bit-select indices (0=LSB, matching vector[idx] in run_vector below)
    // of the 30 positions where s1 and s2 disagree, ascending.
    integer diff_pos [0:NDIFF-1];

    integer comb [0:KONES-1];   // current combination: indices into diff_pos[]

    top dut (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .I(I),
        .O(O),
        .success(success)
    );

    initial begin
        $dumpfile("tb_diffpositions.vcd");
        $dumpvars(0, tb_puzzle);
    end

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        diff_pos[0]  = 4;
        diff_pos[1]  = 6;
        diff_pos[2]  = 9;
        diff_pos[3]  = 10;
        diff_pos[4]  = 30;
        diff_pos[5]  = 31;
        diff_pos[6]  = 32;
        diff_pos[7]  = 39;
        diff_pos[8]  = 40;
        diff_pos[9]  = 41;
        diff_pos[10] = 51;
        diff_pos[11] = 52;
        diff_pos[12] = 53;
        diff_pos[13] = 62;
        diff_pos[14] = 72;
        diff_pos[15] = 73;
        diff_pos[16] = 76;
        diff_pos[17] = 81;
        diff_pos[18] = 87;
        diff_pos[19] = 92;
        diff_pos[20] = 96;
        diff_pos[21] = 98;
        diff_pos[22] = 105;
        diff_pos[23] = 109;
        diff_pos[24] = 115;
        diff_pos[25] = 116;
        diff_pos[26] = 117;
        diff_pos[27] = 118;
        diff_pos[28] = 119;
        diff_pos[29] = 120;
    end

    // ---- Time formatting: HH:MM:SS from raw $time (in ns per timescale) ----
    // Plain Verilog-2001, no "string"/"automatic" needed.
    integer hms_h, hms_m, hms_s;

    task compute_hms(input time t);
        time total_seconds;
        begin
            total_seconds = t / 1_000_000_000; // simulation seconds
            hms_h = total_seconds / 3600;
            hms_m = (total_seconds % 3600) / 60;
            hms_s = total_seconds % 60;
        end
    endtask

    // ---- Combination generator: lexicographic k-of-n, no repeats -----
    task get_next_combination(output reg more);
        integer i;
        begin
            i = KONES - 1;
            while ((i >= 0) && (comb[i] == i + NDIFF - KONES))
                i = i - 1;

            if (i < 0) begin
                more = 1'b0;
            end else begin
                comb[i] = comb[i] + 1;
                for (j = i + 1; j < KONES; j = j + 1)
                    comb[j] = comb[j-1] + 1;
                more = 1'b1;
            end
        end
    endtask

    task build_vector(output reg [NBITS-1:0] vector);
        integer k;
        begin
            vector = base_vector;
            for (k = 0; k < KONES; k = k + 1)
                vector[diff_pos[comb[k]]] = 1'b1;
        end
    endtask

    // ---- Drive one candidate, same sequencing as tb_puzzle.v ---------
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

    // ---- Main exhaustive search ---------------------------------------
    localparam PROGRESS_INTERVAL = 100000;

    integer skip_count;
    integer max_trials;
    integer trial_count;
    integer success_count;
    integer file_handle;
    integer file_ok;
    reg [NBITS-1:0] cand_vector;
    reg got_success;
    reg [7:0] got_O;
    reg more_combos;
    integer k;
    integer done_count;
    real    percent_done;

    initial begin

        if (!$value$plusargs("skip=%d", skip_count))
            skip_count = 0;
        if (!$value$plusargs("max_trials=%d", max_trials))
            max_trials = 0; // 0 = unlimited (run to end of combination space)

        // initial combination: {0,1,...,KONES-1}
        for (k = 0; k < KONES; k = k + 1)
            comb[k] = k;

        // fast-forward without touching the DUT, for resume/parallel runs
        more_combos = 1'b1;
        for (k = 0; k < skip_count && more_combos; k = k + 1)
            get_next_combination(more_combos);

        if (!more_combos) begin
            compute_hms($time);
            $display("[%02d:%02d:%02d] skip=%0d exceeds the combination space (%0d). Nothing to do.",
                      hms_h, hms_m, hms_s, skip_count, TOTAL_SPACE);
            $finish;
        end

        compute_hms($time);
        $display("[%02d:%02d:%02d] Starting exhaustive search, skip=%0d, max_trials=%0d, total space=%0d",
                  hms_h, hms_m, hms_s, skip_count, max_trials, TOTAL_SPACE);

        file_handle = $fopen("tb_diffposition_successes.txt", "a");
        file_ok     = (file_handle != 0);

        trial_count   = 0;
        success_count = 0;

        while (more_combos && ((max_trials == 0) || (trial_count < max_trials))) begin
            build_vector(cand_vector);
            trial_count = trial_count + 1;

            run_vector(cand_vector, got_success, got_O);

            // Turn off dumping after 20 iterations to save disk space
            if (trial_count == 20) begin
                $dumpoff;
            end

            if (got_success) begin
                success_count = success_count + 1;
                compute_hms($time);
                $display("[%02d:%02d:%02d] *** SUCCESS on combination #%0d: O=0x%0h vector=%b ***",
                          hms_h, hms_m, hms_s, skip_count + trial_count, got_O, cand_vector);
                if (file_ok) begin
                    $fwrite(file_handle, "combo=%0d O=0x%0h vector=%b\n",
                            skip_count + trial_count, got_O, cand_vector);
                    $fflush(file_handle);
                end
            end

            done_count = skip_count + trial_count;

            if (done_count % PROGRESS_INTERVAL == 0) begin
                percent_done = 100.0 * done_count / TOTAL_SPACE;
                compute_hms($time);
                $display("[%02d:%02d:%02d] progress: %0d / %0d tested (%0.4f%%), %0d successes",
                          hms_h, hms_m, hms_s, done_count, TOTAL_SPACE, percent_done, success_count);
            end

            get_next_combination(more_combos);
        end

        done_count   = skip_count + trial_count;
        percent_done = 100.0 * done_count / TOTAL_SPACE;
        compute_hms($time);
        $display("[%02d:%02d:%02d] Done. %0d trials this run, %0d successes. Overall: %0d / %0d (%0.4f%%)",
                  hms_h, hms_m, hms_s, trial_count, success_count, done_count, TOTAL_SPACE, percent_done);
        if (file_ok) $fclose(file_handle);
        $finish;
    end

endmodule