// Generated from KLayout SKY130 SPICE extraction
// Logical gate-level representation

module top (
    output [7:0] O,
    input I,
    input clk,
    input enable,
    input rst_n,
    output reg success
);

reg  \$1048 , \$1126 , \$1140 , \$1220 , \$1221 , \$1272 , \$1280 , \$1287 , \$1362 , \$1363 , \$1414 , \$1454 , \$1503 , \$1513 , \$1527 , \$1555 , \$1618 , \$1652 , \$1730 , \$1742 , \$1782 , \$1879 , \$1959 , \$2016 , \$2019 , \$2020 , \$2052 , \$2103 , \$2185 , \$2209 , \$2221 , \$2222 , \$2223 , \$2224 , \$2229 , \$2263 , \$2265 , \$2376 , \$2377 , \$2458 , \$2462 , \$2548 , \$2651 , \$2658 , \$27 , \$2732 , \$2752 , \$2813 , \$2815 , \$2851 , \$2895 , \$2906 , \$3057 , \$3159 , \$3168 , \$3178 , \$3381 , \$3387 , \$340 , \$347 , \$3475 , \$3481 , \$3691 , \$3692 , \$3785 , \$3791 , \$3813 , \$3902 , \$3906 , \$3981 , \$4031 , \$4089 , \$416 , \$4168 , \$417 , \$418 , \$4189 , \$4196 , \$4197 , \$425 , \$4285 , \$4318 , \$609 , \$688 , \$689 , \$782 , \$837 , \$864 , \$882 , \$929 , \$980 ;
wire \$1 , \$100 , \$1002 , \$1008 , \$1021 , \$1026 , \$1037 , \$1039 , \$1046 , \$105 , \$1050 , \$1058 , \$1073 , \$1083 , \$1091 , \$1095 , \$1103 , \$1128 , \$1143 , \$115 , \$1170 , \$1173 , \$1186 , \$120 , \$1202 , \$1203 , \$1205 , \$1213 , \$1223 , \$1224 , \$1227 , \$1243 , \$1256 , \$126 , \$1262 , \$1271 , \$1273 , \$1274 , \$1275 , \$1283 , \$1288 , \$1299 , \$1303 , \$131 , \$1386 , \$139 , \$14 , \$1402 , \$1404 , \$1418 , \$1419 , \$1420 , \$1422 , \$1425 , \$1426 , \$1428 , \$1429 , \$143 , \$1439 , \$1460 , \$1462 , \$1466 , \$1468 , \$1469 , \$147 , \$1473 , \$1475 , \$148 , \$1483 , \$1490 , \$1496 , \$15 , \$150 , \$1500 , \$1501 , \$1507 , \$151 , \$1517 , \$1532 , \$1538 , \$1539 , \$1543 , \$1554 , \$1557 , \$1558 , \$1562 , \$1563 , \$1564 , \$1566 , \$157 , \$1571 , \$1582 , \$1592 , \$16 , \$1611 , \$1615 , \$1619 , \$1627 , \$1642 , \$1649 , \$1650 , \$166 , \$1660 , \$1663 , \$1682 , \$169 , \$1695 , \$1699 , \$17 , \$1702 , \$1705 , \$1709 , \$1728 , \$1733 , \$1740 , \$1743 , \$1754 , \$1757 , \$1764 , \$1765 , \$1768 , \$1773 , \$1774 , \$1775 , \$1783 , \$1787 , \$179 , \$1791 , \$180 , \$181 , \$1822 , \$1823 , \$1826 , \$1831 , \$1835 , \$1838 , \$1842 , \$1875 , \$1878 , \$1901 , \$1910 , \$1915 , \$1934 , \$1936 , \$1937 , \$194 , \$195 , \$1958 , \$1960 , \$1975 , \$1983 , \$2001 , \$2005 , \$2017 , \$2018 , \$2029 , \$2033 , \$2037 , \$2039 , \$2043 , \$2048 , \$2049 , \$205 , \$2053 , \$2068 , \$2072 , \$2076 , \$2079 , \$2083 , \$2084 , \$209 , \$2100 , \$2108 , \$2110 , \$2113 , \$2124 , \$2127 , \$2135 , \$2137 , \$2140 , \$2145 , \$2155 , \$2160 , \$2167 , \$2173 , \$2189 , \$2193 , \$2201 , \$2216 , \$2235 , \$2236 , \$2237 , \$2246 , \$2250 , \$2253 , \$2266 , \$2269 , \$227 , \$2270 , \$2285 , \$2288 , \$2293 , \$2294 , \$2295 , \$23 , \$2306 , \$2313 , \$2318 , \$2321 , \$2323 , \$2324 , \$2328 , \$2331 , \$234 , \$2352 , \$2379 , \$2404 , \$2406 , \$2415 , \$2419 , \$2420 , \$2421 , \$2423 , \$2425 , \$2437 , \$2438 , \$2441 , \$2449 , \$2450 , \$2453 , \$2454 , \$2455 , \$247 , \$2475 , \$2491 , \$2497 , \$2500 , \$2511 , \$2517 , \$2518 , \$2520 , \$2523 , \$2531 , \$2542 , \$2566 , \$2567 , \$2568 , \$2569 , \$2578 , \$2583 , \$2586 , \$2588 , \$2592 , \$2593 , \$2600 , \$2601 , \$2602 , \$2639 , \$2640 , \$2646 , \$2648 , \$2654 , \$2655 , \$2660 , \$2662 , \$2666 , \$2668 , \$2670 , \$2680 , \$2681 , \$2687 , \$2690 , \$2691 , \$2694 , \$2697 , \$2702 , \$2705 , \$2728 , \$2736 , \$2741 , \$2743 , \$2748 , \$2754 , \$2762 , \$2768 , \$2773 , \$2776 , \$2793 , \$28 , \$2809 , \$2816 , \$2827 , \$2834 , \$2860 , \$2861 , \$2862 , \$2863 , \$2872 , \$2878 , \$288 , \$2889 , \$2897 , \$29 , \$2900 , \$2904 , \$2907 , \$291 , \$2910 , \$2921 , \$2924 , \$2955 , \$2971 , \$2974 , \$2982 , \$2987 , \$30 , \$3042 , \$3046 , \$3048 , \$3054 , \$306 , \$3060 , \$3062 , \$3065 , \$3066 , \$3068 , \$3079 , \$3080 , \$3084 , \$31 , \$3100 , \$3101 , \$311 , \$3116 , \$313 , \$3139 , \$314 , \$3146 , \$3148 , \$316 , \$317 , \$3171 , \$3173 , \$3174 , \$3175 , \$3176 , \$3212 , \$3217 , \$3227 , \$3229 , \$3246 , \$3250 , \$3264 , \$3284 , \$3285 , \$3291 , \$330 , \$3302 , \$3303 , \$3310 , \$3311 , \$3328 , \$3331 , \$3333 , \$3339 , \$3353 , \$3355 , \$3369 , \$3384 , \$3385 , \$3388 , \$3417 , \$3424 , \$3427 , \$3434 , \$3437 , \$3440 , \$3443 , \$345 , \$3466 , \$348 , \$3487 , \$3490 , \$3491 , \$3497 , \$35 , \$3500 , \$3504 , \$3506 , \$3508 , \$351 , \$3515 , \$3516 , \$3531 , \$3535 , \$3540 , \$3541 , \$3546 , \$3548 , \$3575 , \$3588 , \$3592 , \$3607 , \$3620 , \$3623 , \$3628 , \$3634 , \$3635 , \$3651 , \$368 , \$3694 , \$3698 , \$37 , \$3700 , \$3705 , \$3706 , \$372 , \$373 , \$3732 , \$3734 , \$3736 , \$3742 , \$3748 , \$375 , \$376 , \$378 , \$3788 , \$3789 , \$3793 , \$3797 , \$38 , \$380 , \$381 , \$3812 , \$3825 , \$3829 , \$383 , \$3848 , \$386 , \$3860 , \$3861 , \$3868 , \$3874 , \$3883 , \$3886 , \$3889 , \$389 , \$3892 , \$3907 , \$391 , \$3913 , \$3919 , \$3943 , \$3951 , \$3953 , \$3994 , \$4002 , \$4020 , \$4022 , \$4030 , \$4032 , \$4041 , \$407 , \$4119 , \$4124 , \$4127 , \$413 , \$4142 , \$4148 , \$4172 , \$4173 , \$4180 , \$4187 , \$4188 , \$4192 , \$4203 , \$421 , \$4210 , \$4214 , \$423 , \$4238 , \$4240 , \$4242 , \$4245 , \$4252 , \$4255 , \$4257 , \$427 , \$4287 , \$4290 , \$4294 , \$430 , \$4316 , \$4346 , \$4352 , \$439 , \$441 , \$442 , \$443 , \$46 , \$47 , \$476 , \$486 , \$489 , \$49 , \$490 , \$492 , \$50 , \$501 , \$504 , \$51 , \$519 , \$521 , \$534 , \$54 , \$549 , \$55 , \$554 , \$556 , \$558 , \$56 , \$563 , \$569 , \$57 , \$572 , \$58 , \$589 , \$591 , \$593 , \$601 , \$606 , \$61 , \$627 , \$631 , \$635 , \$643 , \$645 , \$65 , \$653 , \$654 , \$664 , \$665 , \$668 , \$676 , \$681 , \$684 , \$686 , \$692 , \$702 , \$703 , \$710 , \$711 , \$717 , \$718 , \$72 , \$729 , \$730 , \$734 , \$737 , \$760 , \$78 , \$781 , \$785 , \$791 , \$792 , \$796 , \$797 , \$80 , \$804 , \$805 , \$811 , \$82 , \$827 , \$83 , \$831 , \$836 , \$846 , \$856 , \$857 , \$859 , \$861 , \$865 , \$866 , \$874 , \$879 , \$880 , \$888 , \$89 , \$896 , \$899 , \$907 , \$919 , \$93 , \$933 , \$94 , \$954 , \$956 , \$966 , \$967 , \$969 , \$97 , \$975 , \$98 , \$983 , \$984 , \$986 , \$997 , \$I10 , \$I11 , \$I13 , \$I13690 , \$I13694 , \$I13706 , \$I13710 , \$I13722 , \$I13726 , \$I13972 , \$I13977 , \$I13984 , \$I14 , \$I14176 , \$I14181 , \$I14188 , \$I15 , \$I16 , \$I17 , \$I18 , \$I37 , \$I38 , \$I39 , \$I40 , \$I41 , \$I42 , \$I52 , \$I53 , \$I54 , \$I55 , \$I56 , \$I57 , \$I58 , \$I59 , \$I60 , \$I85 , \$I86 , \$I87 , \$I88 , \$I90 , \$I91 , \$I92 , \$I93 , \$I94 , \$I96 ;

// X$4 sky130_fd_sc_hd__o21a_2
assign \$148  = ((\$31  | \$1 ) & (\$16 ));

// X$7 sky130_fd_sc_hd__and2_2
assign \$1  = (\$89  & \$23 );

// X$9 sky130_fd_sc_hd__a21boi_2
assign \$3919  = ~((\$1414  & \$3868 ) | (~\$3813 ));

// X$10 sky130_fd_sc_hd__a21o_2
assign \$3860  = ((\$1363  & \$1414 ) | (\$1362 ));

// X$11 sky130_fd_sc_hd__and2_2
assign \$3048  = (\$3813  & \$3868 );

// X$12 sky130_fd_sc_hd__nor3b_2
assign \$3548  = ~(\$3437  | \$3491  | ~\$3487 );

// X$13 sky130_fd_sc_hd__a21oi_2
assign \$3303  = ~((\$3487  & \$3491 ) | (\$3437 ));

// X$14 sky130_fd_sc_hd__o31a_2
assign \$3497  = ((\$3466  | \$3500  | \$3331 ) & (\$3427 ));

// X$16 sky130_fd_sc_hd__nor3_2
assign \$3592  = ~(\$3437  | \$3487  | \$3491 );

// X$17 sky130_fd_sc_hd__o31a_2
assign \$3628  = ((\$3466  | \$3635  | \$3540 ) & (\$3490 ));

// X$18 sky130_fd_sc_hd__o31a_2
assign \$3623  = ((\$3466  | \$3736  | \$3424 ) & (\$3607 ));

// X$20 sky130_fd_sc_hd__a22o_2
assign \$3516  = ((1'b0 & \$3548 ) | (\$3592  & 1'b0));

// X$21 sky130_fd_sc_hd__o31a_2
assign \$3504  = ((\$3466  | \$3506  | \$3339 ) & (\$3508 ));

// X$25 sky130_fd_sc_hd__a211oi_2
assign \$3437  = ~((\$3953  & \$3981 ) | (\$1103 ) | (\$737 ));

// X$26 sky130_fd_sc_hd__inv_2
assign \$3491  = ~\$3913 ;

// X$27 sky130_fd_sc_hd__xnor2_2
assign \$3943  = ~(\$1363  ^ \$1414 );

// X$28 sky130_fd_sc_hd__and3_2
assign O[7] = (\$3813  & \$3515  & \$3868 );

// X$30 sky130_fd_sc_hd__and3_2
assign O[0] = (\$3813  & \$3734  & \$3868 );

// X$31 sky130_fd_sc_hd__and3_2
assign O[2] = (\$3813  & \$3497  & \$3868 );

// X$32 sky130_fd_sc_hd__inv_2
assign \$3953  = ~success;

// X$34 sky130_fd_sc_hd__and3_2
assign O[6] = (\$3813  & \$3504  & \$3868 );

// X$35 sky130_fd_sc_hd__dfxtp_2
always @(posedge \$3588 ) begin
    \$1414  <= \$3919 ;
end

// X$37 sky130_fd_sc_hd__nand4_2
assign \$3868  = ~(\$1527  & \$1362  & \$1363  & \$1414 );

// X$38 sky130_fd_sc_hd__and3_2
assign O[4] = (\$3813  & \$3628  & \$3868 );

// X$41 sky130_fd_sc_hd__and4b_2
assign \$4252  = (~\$3813  & \$3159  & \$375  & \$2455 );

// X$43 sky130_fd_sc_hd__a32o_2
assign \$4257  = ((\$2269  & \$4203  & \$4252 ) | (success & \$4255 ));

// X$44 sky130_fd_sc_hd__or2_2
assign \$4316  = (\$3159  | \$3813 );

// X$45 sky130_fd_sc_hd__nand2b_2
assign \$4255  = ~(~\$3813  & \$3159 );

// X$46 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3588  or negedge rst_n) begin
    if (!rst_n)
        success <= 1'b0;
    else
        success <= \$4257 ;
end

// X$51 sky130_fd_sc_hd__and3b_2
assign \$2702  = (~\$933  & \$2569  & \$2670 );

// X$52 sky130_fd_sc_hd__a21oi_2
assign \$2694  = ~((\$2697  & \$2705 ) | (\$2639 ));

// X$53 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$2728 

// X$54 sky130_fd_sc_hd__inv_2
assign \$2640  = ~\$1527 ;

// X$55 sky130_fd_sc_hd__a22o_2
assign \$2776  = ((\$2639  & \$2592 ) | (\$2600  & \$2773 ));

// X$57 sky130_fd_sc_hd__xnor2_2
assign \$2569  = ~(\$2680  ^ \$2982 );

// X$58 sky130_fd_sc_hd__xnor2_2
assign \$2687  = ~(\$2651  ^ \$2694 );

// X$59 sky130_fd_sc_hd__o31a_2
assign \$2768  = ((\$1362  | \$2639  | \$2648 ) & (\$2705 ));

// X$60 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2155  or negedge rst_n) begin
    if (!rst_n)
        \$2732  <= 1'b0;
    else
        \$2732  <= \$2762 ;
end

// X$62 sky130_fd_sc_hd__xor2_2
assign \$3079  = (\$2651  ^ \$2813 );

// X$64 sky130_fd_sc_hd__nor2_2
assign \$2668  = ~(\$2569  | \$2666 );

// X$65 sky130_fd_sc_hd__xnor2_2
assign \$2741  = ~(\$2752  ^ \$2754 );

// X$66 sky130_fd_sc_hd__and2b_2
assign \$2748  = (~\$2670  & \$2583 );

// X$70 sky130_fd_sc_hd__o31a_2
assign \$3874  = ((\$3466  | \$3651  | \$3353 ) & (\$3310 ));

// X$71 sky130_fd_sc_hd__a22o_2
assign \$3500  = ((\$2328  & \$3548 ) | (\$3592  & \$2039 ));

// X$72 sky130_fd_sc_hd__o31a_2
assign \$3620  = ((\$3466  | \$3742  | \$3434 ) & (\$3546 ));

// X$74 sky130_fd_sc_hd__a22o_2
assign \$3651  = ((\$2331  & \$3548 ) | (\$3592  & \$2083 ));

// X$75 sky130_fd_sc_hd__a22o_2
assign \$3635  = ((1'b0 & \$3548 ) | (\$3592  & \$2160 ));

// X$76 sky130_fd_sc_hd__o31a_2
assign \$3734  = ((\$3466  | \$3732  | \$3440 ) & (\$3369 ));

// X$80 sky130_fd_sc_hd__a22o_2
assign \$3506  = ((\$2500  & \$3548 ) | (\$3592  & \$2236 ));

// X$84 sky130_fd_sc_hd__a21oi_2
assign \$2049  = ~((\$2043  & \$2029 ) | (\$2048 ));

// X$85 sky130_fd_sc_hd__and2b_2
assign \$2029  = (~\$1363  & \$1414 );

// X$86 sky130_fd_sc_hd__and2b_2
assign \$2039  = (~\$2043  & \$2037 );

// X$91 sky130_fd_sc_hd__clkbuf_8
assign \$2216  = \$1271 ;

// X$92 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$2216 

// X$94 sky130_fd_sc_hd__clkbuf_8
assign \$785  = \$1271 ;

// X$95 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$785 

// X$100 sky130_fd_sc_hd__clkbuf_8
assign \$1875  = \$1271 ;

// X$101 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1649  or negedge rst_n) begin
    if (!rst_n)
        \$1730  <= 1'b0;
    else
        \$1730  <= \$1775 ;
end

// X$102 sky130_fd_sc_hd__or2_2
assign \$1783  = (\$1730  | I);

// X$103 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$1875 

// X$108 sky130_fd_sc_hd__clkbuf_8
assign \$3889  = \$1271 ;

// X$109 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$3889 

// X$110 sky130_fd_sc_hd__a31o_2
assign \$4020  = ((I & \$933  & \$4022 ) | (\$3906 ));

// X$112 sky130_fd_sc_hd__nand4_2
assign \$3907  = ~(I & \$933  & \$3906  & \$4022 );

// X$113 sky130_fd_sc_hd__and4bb_2
assign \$4022  = (~\$340  & ~\$864  & \$425  & \$27 );

// X$114 sky130_fd_sc_hd__and4b_2
assign \$4032  = (~\$864  & \$425  & \$340  & \$27 );

// X$118 sky130_fd_sc_hd__clkbuf_8
assign \$1649  = \$1271 ;

// X$119 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$1649 

// X$121 sky130_fd_sc_hd__a22o_2
assign \$1775  = ((\$1699  & \$1730 ) | (\$1728  & \$1615 ));

// X$122 sky130_fd_sc_hd__inv_2
assign \$1699  = ~\$933 ;

// X$123 sky130_fd_sc_hd__or4bb_2
assign \$1733  = (\$340  | \$425  | ~\$864  | ~\$27 );

// X$124 sky130_fd_sc_hd__or4_2
assign \$1705  = (\$340  | \$27  | \$425  | \$864 );

// X$125 sky130_fd_sc_hd__o211a_2
assign \$1728  = ((\$1652  | \$1650 ) & (\$1783 ) & (\$933 ));

// X$130 sky130_fd_sc_hd__clkbuf_8
assign \$3588  = \$1271 ;

// X$131 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$3588 

// X$132 sky130_fd_sc_hd__clkbuf_8
assign \$2728  = \$1271 ;

// X$133 sky130_fd_sc_hd__or3b_2
assign \$2773  = (\$1414  | \$1362  | ~\$1363 );

// X$134 sky130_fd_sc_hd__xnor2_2
assign \$2863  = ~(\$2732  ^ \$2924 );

// X$135 sky130_fd_sc_hd__dfstp_2
always @(posedge \$2728  or negedge rst_n) begin
    if (!rst_n)
        \$2815  <= 1'b1;
    else
        \$2815  <= \$2743 ;
end

// X$137 sky130_fd_sc_hd__xnor2_2
assign \$3229  = ~(\$2732  ^ \$2955 );

// X$138 sky130_fd_sc_hd__a221o_2
assign \$2743  = ((\$933  & \$2732 ) | (\$2815  & \$2834 ) | (\$2668 ));

// X$140 sky130_fd_sc_hd__nor2_2
assign \$3042  = ~(\$1362  | \$1527 );

// X$141 sky130_fd_sc_hd__nand2_2
assign \$2705  = ~(\$1363  & \$1527 );

// X$142 sky130_fd_sc_hd__a31o_2
assign \$2762  = ((\$2907  & \$2872  & \$2809 ) | (\$2878 ));

// X$143 sky130_fd_sc_hd__xnor2_2
assign \$2860  = ~(\$2861  ^ \$2862 );

// X$145 sky130_fd_sc_hd__xor2_2
assign \$2816  = (\$2813  ^ \$2768 );

// X$146 sky130_fd_sc_hd__a211o_2
assign \$2662  = ((\$1414  & \$1362 ) | (\$2640 ) | (\$2648 ));

// X$147 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2728  or negedge rst_n) begin
    if (!rst_n)
        \$2813  <= 1'b0;
    else
        \$2813  <= \$2827 ;
end

// X$150 sky130_fd_sc_hd__a221o_2
assign \$3084  = ((\$933  & \$2752 ) | (\$2583  & \$2660 ) | (\$2834 ));

// X$154 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$2155 

// X$156 sky130_fd_sc_hd__clkbuf_8
assign \$2155  = \$1271 ;

// X$160 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$3250 

// X$161 sky130_fd_sc_hd__and2_2
assign \$3333  = (\$3178  & \$3246 );

// X$162 sky130_fd_sc_hd__or4b_2
assign \$3291  = (\$340  | \$864  | \$425  | ~\$27 );

// X$163 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3066  or negedge rst_n) begin
    if (!rst_n)
        \$3168  <= 1'b0;
    else
        \$3168  <= \$3176 ;
end

// X$164 sky130_fd_sc_hd__inv_2
assign \$3246  = ~\$3168 ;

// X$165 sky130_fd_sc_hd__o21a_2
assign \$3385  = ((\$3381  | \$3284 ) & (\$3285 ));

// X$167 sky130_fd_sc_hd__nor2_2
assign \$3284  = ~(\$3291  | \$3388 );

// X$169 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3250  or negedge rst_n) begin
    if (!rst_n)
        \$3387  <= 1'b0;
    else
        \$3387  <= \$3443 ;
end

// X$172 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$2294 

// X$174 sky130_fd_sc_hd__clkbuf_8
assign \$2294  = \$1271 ;

// X$178 sky130_fd_sc_hd__and2b_2
assign \$933  = (~\$3159  & enable);

// X$180 sky130_fd_sc_hd__or4b_2
assign \$3913  = (\$737  | success | \$1103  | ~\$3981 );

// X$181 sky130_fd_sc_hd__o21ba_2
assign \$4041  = ((success | \$3981 ) & (~\$1103 ));

// X$183 sky130_fd_sc_hd__nand3_2
assign \$3861  = ~(\$1362  & \$1363  & \$1414 );

// X$184 sky130_fd_sc_hd__dfxtp_2
always @(posedge \$3588 ) begin
    \$1363  <= \$3994 ;
end

// X$186 sky130_fd_sc_hd__dfxtp_2
always @(posedge \$3066 ) begin
    \$1362  <= \$4002 ;
end

// X$187 sky130_fd_sc_hd__a21boi_2
assign \$3994  = ~((\$3868  & \$3943 ) | (~\$3813 ));

// X$189 sky130_fd_sc_hd__and3_2
assign O[3] = (\$3813  & \$3620  & \$3868 );

// X$192 sky130_fd_sc_hd__or4b_2
assign \$4142  = (\$27  | \$340  | \$425  | ~\$864 );

// X$194 sky130_fd_sc_hd__nand2_2
assign \$4180  = ~(I & \$933 );

// X$195 sky130_fd_sc_hd__nor2_2
assign \$4172  = ~(\$4142  | \$4180 );

// X$198 sky130_fd_sc_hd__o21a_2
assign \$4173  = ((\$4168  | \$4172 ) & (\$4148 ));

// X$200 sky130_fd_sc_hd__or4b_2
assign \$1273  = (\$760  | \$1050  | \$984  | ~\$899 );

// X$201 sky130_fd_sc_hd__nor2_2
assign \$1224  = ~(\$1273  | \$1275 );

// X$202 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$983  or negedge rst_n) begin
    if (!rst_n)
        \$1220  <= 1'b0;
    else
        \$1220  <= \$1243 ;
end

// X$203 sky130_fd_sc_hd__or4_2
assign \$1213  = (\$1272  | \$1274  | \$1273  | \$1275 );

// X$204 sky130_fd_sc_hd__a21o_2
assign \$1299  = ((\$1221  & \$1224 ) | (\$1272 ));

// X$206 sky130_fd_sc_hd__inv_2
assign \$1274  = ~\$1221 ;

// X$207 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$729  or negedge rst_n) begin
    if (!rst_n)
        \$1287  <= 1'b0;
    else
        \$1287  <= \$1303 ;
end

// X$210 sky130_fd_sc_hd__a31o_2
assign \$1283  = ((I & \$933  & \$1288 ) | (\$1287 ));

// X$224 sky130_fd_sc_hd__a31o_2
assign \$967  = ((I & \$933  & \$1046 ) | (\$1048 ));

// X$225 sky130_fd_sc_hd__nor4_2
assign \$1046  = ~(\$899  | \$760  | \$1050  | \$984 );

// X$271 sky130_fd_sc_hd__nand4_2
assign \$4124  = ~(I & \$933  & \$4031  & \$4032 );

// X$272 sky130_fd_sc_hd__o21a_2
assign \$4030  = ((\$4089  | \$4124 ) & (\$4119 ));

// X$273 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3829  or negedge rst_n) begin
    if (!rst_n)
        \$4031  <= 1'b0;
    else
        \$4031  <= \$4030 ;
end

// X$274 sky130_fd_sc_hd__and2b_2
assign \$2425  = (~\$4031  & \$4089 );

// X$276 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3889  or negedge rst_n) begin
    if (!rst_n)
        \$4089  <= 1'b0;
    else
        \$4089  <= \$4127 ;
end

// X$280 sky130_fd_sc_hd__nand4_2
assign \$1262  = ~(I & \$933  & \$1287  & \$1288 );

// X$281 sky130_fd_sc_hd__and2b_2
assign \$441  = (~\$1287  & \$1280 );

// X$282 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$983  or negedge rst_n) begin
    if (!rst_n)
        \$1221  <= 1'b0;
    else
        \$1221  <= \$1256 ;
end

// X$283 sky130_fd_sc_hd__nand2b_2
assign \$1386  = ~(~\$1280  & \$1262 );

// X$285 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$983  or negedge rst_n) begin
    if (!rst_n)
        \$1272  <= 1'b0;
    else
        \$1272  <= \$1299 ;
end

// X$289 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3829  or negedge rst_n) begin
    if (!rst_n)
        \$3906  <= 1'b0;
    else
        \$3906  <= \$3951 ;
end

// X$290 sky130_fd_sc_hd__nand2b_2
assign \$3848  = ~(~\$3902  & \$3907 );

// X$294 sky130_fd_sc_hd__and2b_2
assign \$2421  = (~\$3906  & \$3902 );

// X$295 sky130_fd_sc_hd__clkbuf_8
assign \$3829  = \$1271 ;

// X$296 sky130_fd_sc_hd__o21a_2
assign \$3951  = ((\$3902  | \$3907 ) & (\$4020 ));

// X$297 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$3829 

// X$300 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1649  or negedge rst_n) begin
    if (!rst_n)
        \$416  <= 1'b0;
    else
        \$416  <= \$1765 ;
end

// X$301 sky130_fd_sc_hd__xor2_2
assign \$1791  = (\$417  ^ \$1754 );

// X$302 sky130_fd_sc_hd__a21o_2
assign \$1562  = ((\$417  & \$1754 ) | (\$418 ));

// X$304 sky130_fd_sc_hd__nand3_2
assign \$1835  = ~(\$417  & \$418  & \$1754 );

// X$305 sky130_fd_sc_hd__inv_2
assign \$1838  = ~\$1754 ;

// X$309 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$785  or negedge rst_n) begin
    if (!rst_n)
        \$347  <= 1'b0;
    else
        \$347  <= \$1538 ;
end

// X$310 sky130_fd_sc_hd__nor2_2
assign \$1507  = ~(\$347  | \$1532 );

// X$311 sky130_fd_sc_hd__and3_2
assign \$1563  = (\$1558  & \$933  & \$1532 );

// X$312 sky130_fd_sc_hd__o311a_2
assign \$1564  = ((\$347  | \$1532  | \$1566 ) & (\$1835 ) & (\$1562 ));

// X$314 sky130_fd_sc_hd__mux2_1
assign \$1538  = (\$347  ? \$1566  : \$1563 );

// X$315 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1875  or negedge rst_n) begin
    if (!rst_n)
        \$2185  <= 1'b0;
    else
        \$2185  <= \$2135 ;
end

// X$316 sky130_fd_sc_hd__mux2_1
assign \$2135  = (\$933  ? \$2103  : \$2185 );

// X$317 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1875  or negedge rst_n) begin
    if (!rst_n)
        \$2222  <= 1'b0;
    else
        \$2222  <= \$2189 ;
end

// X$322 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2216  or negedge rst_n) begin
    if (!rst_n)
        \$425  <= 1'b0;
    else
        \$425  <= \$2246 ;
end

// X$324 sky130_fd_sc_hd__xor2_2
assign \$2246  = (\$425  ^ \$2173 );

// X$328 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2216  or negedge rst_n) begin
    if (!rst_n)
        \$864  <= 1'b0;
    else
        \$864  <= \$2542 ;
end

// X$329 sky130_fd_sc_hd__a221oi_2
assign \$2542  = ~((\$933  & \$1558 ) | (\$2321  & \$864 ) | (\$2578 ));

// X$331 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2294  or negedge rst_n) begin
    if (!rst_n)
        \$2895  <= 1'b0;
    else
        \$2895  <= \$2974 ;
end

// X$332 sky130_fd_sc_hd__nand2b_2
assign \$2793  = ~(~\$2851  & \$2889 );

// X$336 sky130_fd_sc_hd__and2b_2
assign \$2454  = (~\$2895  & \$2851 );

// X$337 sky130_fd_sc_hd__o21a_2
assign \$2974  = ((\$2851  | \$2889 ) & (\$2897 ));

// X$340 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1649  or negedge rst_n) begin
    if (!rst_n)
        \$418  <= 1'b0;
    else
        \$418  <= \$1564 ;
end

// X$341 sky130_fd_sc_hd__a31o_2
assign \$1642  = ((\$1558  & \$933  & \$347 ) | (\$416 ));

// X$342 sky130_fd_sc_hd__nand2_2
assign \$1566  = ~(\$1558  & \$933 );

// X$344 sky130_fd_sc_hd__and4_2
assign \$1754  = (\$1558  & \$933  & \$416  & \$347 );

// X$345 sky130_fd_sc_hd__nand3b_2
assign \$1532  = ~(~\$417  & \$418  & \$416 );

// X$347 sky130_fd_sc_hd__o211a_2
assign \$1765  = ((\$1532  | \$1566 ) & (\$1642 ) & (\$1838 ));

// X$350 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3066  or negedge rst_n) begin
    if (!rst_n)
        \$3381  <= 1'b0;
    else
        \$3381  <= \$3385 ;
end

// X$351 sky130_fd_sc_hd__a21o_2
assign \$3443  = ((\$3381  & \$3284 ) | (\$3387 ));

// X$352 sky130_fd_sc_hd__or4_2
assign \$3285  = (\$3387  | \$3384  | \$3291  | \$3388 );

// X$354 sky130_fd_sc_hd__inv_2
assign \$3384  = ~\$3381 ;

// X$355 sky130_fd_sc_hd__and2_2
assign \$2518  = (\$3387  & \$3384 );

// X$357 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3250  or negedge rst_n) begin
    if (!rst_n)
        \$3475  <= 1'b0;
    else
        \$3475  <= \$3535 ;
end

// X$359 sky130_fd_sc_hd__nand2_2
assign \$3388  = ~(I & \$933 );

// X$362 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2155  or negedge rst_n) begin
    if (!rst_n)
        \$2019  <= 1'b0;
    else
        \$2019  <= \$2140 ;
end

// X$363 sky130_fd_sc_hd__o21a_2
assign \$2140  = ((\$2019  | \$2072 ) & (\$2201 ));

// X$364 sky130_fd_sc_hd__nor2_2
assign \$2072  = ~(\$2068  | \$2079 );

// X$366 sky130_fd_sc_hd__and2b_2
assign \$1128  = (~\$2016  & \$2052 );

// X$368 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2155  or negedge rst_n) begin
    if (!rst_n)
        \$2016  <= 1'b0;
    else
        \$2016  <= \$2124 ;
end

// X$370 sky130_fd_sc_hd__nand2b_2
assign \$2193  = ~(~\$2052  & \$2076 );

// X$373 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$729  or negedge rst_n) begin
    if (!rst_n)
        \$1280  <= 1'b0;
    else
        \$1280  <= \$1386 ;
end

// X$374 sky130_fd_sc_hd__and2_2
assign \$442  = (\$1272  & \$1274 );

// X$376 sky130_fd_sc_hd__or4b_2
assign \$1404  = (\$899  | \$760  | \$1050  | ~\$984 );

// X$378 sky130_fd_sc_hd__clkbuf_8
assign \$983  = \$1271 ;

// X$379 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$983 

// X$383 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3250  or negedge rst_n) begin
    if (!rst_n)
        \$3691  <= 1'b0;
    else
        \$3691  <= \$3700 ;
end

// X$384 sky130_fd_sc_hd__o21a_2
assign \$3748  = ((\$3692  | \$3694 ) & (\$3698 ));

// X$385 sky130_fd_sc_hd__a21o_2
assign \$3700  = ((\$3692  & \$3694 ) | (\$3691 ));

// X$387 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3250  or negedge rst_n) begin
    if (!rst_n)
        \$3692  <= 1'b0;
    else
        \$3692  <= \$3748 ;
end

// X$389 sky130_fd_sc_hd__or4_2
assign \$3698  = (\$3691  | \$3705  | \$3706  | \$3797 );

// X$393 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3889  or negedge rst_n) begin
    if (!rst_n)
        \$4196  <= 1'b0;
    else
        \$4196  <= \$4192 ;
end

// X$394 sky130_fd_sc_hd__or4_2
assign \$4148  = (\$4189  | \$4187  | \$4142  | \$4180 );

// X$395 sky130_fd_sc_hd__a21o_2
assign \$4188  = ((\$4168  & \$4172 ) | (\$4189 ));

// X$397 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3829  or negedge rst_n) begin
    if (!rst_n)
        \$4189  <= 1'b0;
    else
        \$4189  <= \$4188 ;
end

// X$400 sky130_fd_sc_hd__and2b_2
assign \$2450  = (~\$4197  & \$4196 );

// X$403 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2294  or negedge rst_n) begin
    if (!rst_n)
        \$2209  <= 1'b0;
    else
        \$2209  <= \$2295 ;
end

// X$404 sky130_fd_sc_hd__o21a_2
assign \$2295  = ((\$2229  | \$2293 ) & (\$2270 ));

// X$409 sky130_fd_sc_hd__and2b_2
assign \$591  = (~\$2209  & \$2229 );

// X$410 sky130_fd_sc_hd__nand2b_2
assign \$2253  = ~(~\$2229  & \$2293 );

// X$411 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1875  or negedge rst_n) begin
    if (!rst_n)
        \$1879  <= 1'b0;
    else
        \$1879  <= \$1878 ;
end

// X$412 sky130_fd_sc_hd__nand2b_2
assign \$1878  = ~(~\$1879  & \$1958 );

// X$415 sky130_fd_sc_hd__a31o_2
assign \$2005  = ((I & \$933  & \$1960 ) | (\$1959 ));

// X$416 sky130_fd_sc_hd__o21a_2
assign \$2001  = ((\$1879  | \$1958 ) & (\$2005 ));

// X$420 sky130_fd_sc_hd__a21o_2
assign \$2053  = ((\$2019  & \$2072 ) | (\$2020 ));

// X$421 sky130_fd_sc_hd__a31o_2
assign \$2127  = ((I & \$933  & \$2018 ) | (\$2016 ));

// X$422 sky130_fd_sc_hd__and4bb_2
assign \$2018  = (~\$899  & ~\$984  & \$1050  & \$760 );

// X$423 sky130_fd_sc_hd__o21a_2
assign \$2124  = ((\$2052  | \$2076 ) & (\$2127 ));

// X$424 sky130_fd_sc_hd__nand2_2
assign \$2079  = ~(I & \$933 );

// X$426 sky130_fd_sc_hd__or4_2
assign \$2201  = (\$2020  | \$2017  | \$2068  | \$2079 );

// X$428 sky130_fd_sc_hd__nand4_2
assign \$2076  = ~(I & \$933  & \$2016  & \$2018 );

// X$430 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2155  or negedge rst_n) begin
    if (!rst_n)
        \$2052  <= 1'b0;
    else
        \$2052  <= \$2193 ;
end

// X$433 sky130_fd_sc_hd__a21o_2
assign \$1554  = ((\$1555  & \$1517 ) | (\$1503 ));

// X$434 sky130_fd_sc_hd__o21a_2
assign \$1557  = ((\$1555  | \$1517 ) & (\$1501 ));

// X$435 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$983  or negedge rst_n) begin
    if (!rst_n)
        \$1503  <= 1'b0;
    else
        \$1503  <= \$1554 ;
end

// X$436 sky130_fd_sc_hd__a31o_2
assign \$1627  = ((I & \$933  & \$1439 ) | (\$1454 ));

// X$438 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1460  or negedge rst_n) begin
    if (!rst_n)
        \$1555  <= 1'b0;
    else
        \$1555  <= \$1557 ;
end

// X$440 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1460  or negedge rst_n) begin
    if (!rst_n)
        \$1618  <= 1'b0;
    else
        \$1618  <= \$1764 ;
end

// X$444 sky130_fd_sc_hd__and4bb_2
assign \$3575  = (~\$864  & ~\$425  & \$340  & \$27 );

// X$445 sky130_fd_sc_hd__o21a_2
assign \$3634  = ((\$3475  | \$3531 ) & (\$3541 ));

// X$450 sky130_fd_sc_hd__or4b_2
assign \$3706  = (\$27  | \$340  | \$864  | ~\$425 );

// X$451 sky130_fd_sc_hd__and4bb_2
assign \$2145  = (~\$760  & ~\$984  & \$1050  & \$899 );

// X$452 sky130_fd_sc_hd__a31o_2
assign \$2270  = ((I & \$933  & \$2145 ) | (\$2209 ));

// X$453 sky130_fd_sc_hd__or4b_2
assign \$2068  = (\$899  | \$760  | \$984  | ~\$1050 );

// X$455 sky130_fd_sc_hd__nand4_2
assign \$2293  = ~(I & \$933  & \$2209  & \$2145 );

// X$457 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2155  or negedge rst_n) begin
    if (!rst_n)
        \$2229  <= 1'b0;
    else
        \$2229  <= \$2253 ;
end

// X$461 sky130_fd_sc_hd__and4bb_2
assign \$1439  = (~\$899  & ~\$1050  & \$984  & \$760 );

// X$462 sky130_fd_sc_hd__nor2_2
assign \$1517  = ~(\$1404  | \$1402 );

// X$463 sky130_fd_sc_hd__or4_2
assign \$1501  = (\$1503  | \$1500  | \$1404  | \$1402 );

// X$465 sky130_fd_sc_hd__nand2_2
assign \$1402  = ~(I & \$933 );

// X$466 sky130_fd_sc_hd__nand4_2
assign \$1582  = ~(I & \$933  & \$1454  & \$1439 );

// X$468 sky130_fd_sc_hd__clkbuf_8
assign \$1460  = \$1271 ;

// X$470 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$1460 

// X$473 sky130_fd_sc_hd__and4bb_2
assign \$1934  = (~\$1362  & ~\$1527  & \$1414  & \$1363 );

// X$474 sky130_fd_sc_hd__and4b_2
assign \$1910  = (~\$1527  & \$1362  & \$1363  & \$1414 );

// X$476 sky130_fd_sc_hd__or3_2
assign \$1915  = (\$1901  | \$1910  | \$1831 );

// X$477 sky130_fd_sc_hd__a211oi_2
assign \$1975  = ~((\$1414  & \$1363 ) | (\$1362 ) | (\$1527 ));

// X$478 sky130_fd_sc_hd__a211o_2
assign \$1983  = ((\$1363  & \$1975 ) | (\$1831 ) | (\$1910 ));

// X$483 sky130_fd_sc_hd__and4bb_2
assign \$4294  = (~\$340  & ~\$425  & \$864  & \$27 );

// X$486 sky130_fd_sc_hd__a31o_2
assign \$4346  = ((I & \$933  & \$4294 ) | (\$4285 ));

// X$487 sky130_fd_sc_hd__and4bb_2
assign \$1558  = (~\$340  & ~\$425  & \$864  & \$27 );

// X$489 sky130_fd_sc_hd__xnor2_2
assign \$2441  = ~(\$340  ^ \$933 );

// X$490 sky130_fd_sc_hd__a211oi_2
assign \$2324  = ~((\$933  & \$1558 ) | (\$2406 ) | (\$2173 ));

// X$492 sky130_fd_sc_hd__nor2_2
assign \$2491  = ~(\$1558  | \$2441 );

// X$493 sky130_fd_sc_hd__a41oi_2
assign \$2578  = ~((\$27  & \$340  & \$425  & \$933 ) | (\$864 ));

// X$497 sky130_fd_sc_hd__and4_2
assign \$314  = (\$234  & \$316  & \$195  & \$194 );

// X$498 sky130_fd_sc_hd__and4_2
assign \$2321  = (\$27  & \$340  & \$425  & \$933 );

// X$499 sky130_fd_sc_hd__and3_2
assign \$2173  = (\$27  & \$340  & \$933 );

// X$500 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2216  or negedge rst_n) begin
    if (!rst_n)
        \$27  <= 1'b0;
    else
        \$27  <= \$2324 ;
end

// X$504 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2216  or negedge rst_n) begin
    if (!rst_n)
        \$340  <= 1'b0;
    else
        \$340  <= \$2491 ;
end

// X$506 sky130_fd_sc_hd__a21oi_2
assign \$2406  = ~((\$340  & \$933 ) | (\$27 ));

// X$507 sky130_fd_sc_hd__and4_2
assign \$2511  = (\$3812  & \$2420  & \$2425  & \$2421 );

// X$508 sky130_fd_sc_hd__and3_2
assign \$2453  = (\$2450  & \$2449  & \$2415 );

// X$510 sky130_fd_sc_hd__a31o_2
assign \$2438  = ((I & \$933  & \$2419 ) | (\$2265 ));

// X$511 sky130_fd_sc_hd__and4_2
assign \$2520  = (\$3333  & \$2454  & \$2517  & \$2518 );

// X$512 sky130_fd_sc_hd__mux2_1
assign \$2379  = (\$933  ? \$2224  : \$2377 );

// X$513 sky130_fd_sc_hd__mux2_1
assign \$2423  = (\$933  ? \$2376  : \$2263 );

// X$514 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2288  or negedge rst_n) begin
    if (!rst_n)
        \$2377  <= 1'b0;
    else
        \$2377  <= \$2379 ;
end

// X$515 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2216  or negedge rst_n) begin
    if (!rst_n)
        \$2458  <= 1'b0;
    else
        \$2458  <= \$2523 ;
end

// X$518 sky130_fd_sc_hd__mux2_1
assign \$2531  = (\$933  ? I : \$2462 );

// X$521 sky130_fd_sc_hd__nand2b_2
assign \$4192  = ~(~\$4196  & \$4238 );

// X$522 sky130_fd_sc_hd__and2_2
assign \$2449  = (\$4189  & \$4187 );

// X$523 sky130_fd_sc_hd__nand4_2
assign \$4238  = ~(I & \$933  & \$4197  & \$4242 );

// X$524 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3889  or negedge rst_n) begin
    if (!rst_n)
        \$4197  <= 1'b0;
    else
        \$4197  <= \$4245 ;
end

// X$526 sky130_fd_sc_hd__o21a_2
assign \$4245  = ((\$4196  | \$4238 ) & (\$4240 ));

// X$528 sky130_fd_sc_hd__inv_2
assign \$4187  = ~\$4168 ;

// X$530 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3889  or negedge rst_n) begin
    if (!rst_n)
        \$4168  <= 1'b0;
    else
        \$4168  <= \$4173 ;
end

// X$531 sky130_fd_sc_hd__a31o_2
assign \$4240  = ((I & \$933  & \$4242 ) | (\$4197 ));

// X$534 sky130_fd_sc_hd__nand2b_2
assign \$4287  = ~(~\$4318  & \$4352 );

// X$535 sky130_fd_sc_hd__and2b_2
assign \$2415  = (~\$4285  & \$4318 );

// X$536 sky130_fd_sc_hd__and4bb_2
assign \$4242  = (~\$27  & ~\$425  & \$864  & \$340 );

// X$537 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3889  or negedge rst_n) begin
    if (!rst_n)
        \$4285  <= 1'b0;
    else
        \$4285  <= \$4290 ;
end

// X$538 sky130_fd_sc_hd__o21a_2
assign \$4290  = ((\$4318  | \$4352 ) & (\$4346 ));

// X$539 sky130_fd_sc_hd__nand4_2
assign \$4352  = ~(I & \$933  & \$4285  & \$4294 );

// X$541 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3829  or negedge rst_n) begin
    if (!rst_n)
        \$4318  <= 1'b0;
    else
        \$4318  <= \$4287 ;
end

// X$545 sky130_fd_sc_hd__nand2b_2
assign \$2904  = ~(~\$1363  & \$1414 );

// X$546 sky130_fd_sc_hd__nand2_2
assign \$3046  = ~(\$2904  & \$2776 );

// X$547 sky130_fd_sc_hd__a22o_2
assign \$3139  = ((\$933  & \$2813 ) | (\$2906  & \$2834 ));

// X$548 sky130_fd_sc_hd__xnor2_2
assign \$2924  = ~(\$2752  ^ \$2906 );

// X$549 sky130_fd_sc_hd__dfstp_2
always @(posedge \$2728  or negedge rst_n) begin
    if (!rst_n)
        \$2752  <= 1'b1;
    else
        \$2752  <= \$2921 ;
end

// X$551 sky130_fd_sc_hd__xor2_2
assign \$2862  = (\$3057  ^ \$2592 );

// X$552 sky130_fd_sc_hd__a221o_2
assign \$2827  = ((\$933  & \$2658 ) | (\$2834  & \$2813 ) | (\$3080 ));

// X$553 sky130_fd_sc_hd__nor2_2
assign \$2834  = ~(\$3048  | \$933 );

// X$554 sky130_fd_sc_hd__a21o_2
assign \$2987  = ((\$2907  & \$3148 ) | (\$3139 ));

// X$555 sky130_fd_sc_hd__a221o_2
assign \$3054  = ((\$933  & \$2651 ) | (\$3057  & \$2834 ) | (\$3060 ));

// X$557 sky130_fd_sc_hd__xnor2_2
assign \$3355  = ~(\$2732  ^ \$3062 );

// X$558 sky130_fd_sc_hd__or3_2
assign \$2861  = (\$2639  | \$2593  | \$3042 );

// X$559 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2728  or negedge rst_n) begin
    if (!rst_n)
        \$2658  <= 1'b0;
    else
        \$2658  <= \$3100 ;
end

// X$563 sky130_fd_sc_hd__o22a_2
assign \$3100  = ((\$2658  | \$2910 ) & (\$2586  | \$3084 ));

// X$564 sky130_fd_sc_hd__nand2b_2
assign \$3788  = ~(~\$3785  & \$3825 );

// X$565 sky130_fd_sc_hd__inv_2
assign \$3705  = ~\$3692 ;

// X$566 sky130_fd_sc_hd__nand4_2
assign \$3825  = ~(I & \$933  & \$3791  & \$3793 );

// X$567 sky130_fd_sc_hd__and4bb_2
assign \$3793  = (~\$27  & ~\$864  & \$425  & \$340 );

// X$568 sky130_fd_sc_hd__nor2_2
assign \$3694  = ~(\$3706  | \$3797 );

// X$569 sky130_fd_sc_hd__nand2_2
assign \$3797  = ~(I & \$933 );

// X$571 sky130_fd_sc_hd__and2_2
assign \$2420  = (\$3691  & \$3705 );

// X$573 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3829  or negedge rst_n) begin
    if (!rst_n)
        \$3785  <= 1'b0;
    else
        \$3785  <= \$3788 ;
end

// X$575 sky130_fd_sc_hd__a31o_2
assign \$3789  = ((I & \$933  & \$3793 ) | (\$3791 ));

// X$578 sky130_fd_sc_hd__a22o_2
assign \$3440  = ((\$2687  & \$3302 ) | (\$3311  & \$1611 ));

// X$579 sky130_fd_sc_hd__nor2_2
assign \$3466  = ~(\$3302  | \$3303 );

// X$580 sky130_fd_sc_hd__nor3b_2
assign \$3302  = ~(\$3487  | \$3491  | ~\$3437 );

// X$581 sky130_fd_sc_hd__a22o_2
assign \$3424  = ((\$3227  & \$3302 ) | (\$3311  & \$1757 ));

// X$583 sky130_fd_sc_hd__or3_2
assign \$3546  = (\$1983  | \$3302  | \$3303 );

// X$584 sky130_fd_sc_hd__nor3b_2
assign \$3311  = ~(\$3437  | \$3487  | ~\$3491 );

// X$585 sky130_fd_sc_hd__a22o_2
assign \$3434  = ((\$2736  & \$3302 ) | (\$3311  & \$1543 ));

// X$587 sky130_fd_sc_hd__o31a_2
assign \$3515  = ((\$3466  | \$3516  | \$3328 ) & (\$3417 ));

// X$588 sky130_fd_sc_hd__or3_2
assign \$3417  = (1'b0 | \$3302  | \$3303 );

// X$590 sky130_fd_sc_hd__or3_2
assign \$3607  = (\$1934  | \$3302  | \$3303 );

// X$591 sky130_fd_sc_hd__or3_2
assign \$3508  = (\$1915  | \$3302  | \$3303 );

// X$594 sky130_fd_sc_hd__a22o_2
assign \$3062  = ((\$1414  & \$3042 ) | (\$2904  & \$1362 ));

// X$595 sky130_fd_sc_hd__nand2_2
assign \$2872  = ~(\$2752  & \$2900 );

// X$596 sky130_fd_sc_hd__xor2_2
assign \$3227  = (\$2906  ^ \$3046 );

// X$598 sky130_fd_sc_hd__or2_2
assign \$2910  = (\$3048  | \$933 );

// X$599 sky130_fd_sc_hd__nand2b_2
assign \$2666  = ~(~\$933  & \$3048 );

// X$600 sky130_fd_sc_hd__xor2_2
assign \$3065  = (\$2658  ^ \$3057 );

// X$602 sky130_fd_sc_hd__nor2_2
assign \$3060  = ~(\$2666  | \$3229 );

// X$603 sky130_fd_sc_hd__a21oi_2
assign \$3212  = ~((\$3101  & \$3079 ) | (\$2666 ));

// X$607 sky130_fd_sc_hd__a22o_2
assign \$3732  = ((\$2250  & \$3548 ) | (\$3592  & \$2049 ));

// X$608 sky130_fd_sc_hd__a22o_2
assign \$3736  = ((\$2318  & \$3548 ) | (\$3592  & \$2113 ));

// X$610 sky130_fd_sc_hd__a22o_2
assign \$3742  = ((\$2475  & \$3548 ) | (\$3592  & \$2110 ));

// X$614 sky130_fd_sc_hd__a22o_2
assign \$3339  = ((\$3355  & \$3302 ) | (\$3311  & \$1682 ));

// X$615 sky130_fd_sc_hd__or3_2
assign \$3369  = (\$1822  | \$3302  | \$3303 );

// X$616 sky130_fd_sc_hd__a22o_2
assign \$3328  = ((\$2655  & \$3302 ) | (\$3311  & 1'b0));

// X$617 sky130_fd_sc_hd__a22o_2
assign \$3353  = ((\$2860  & \$3302 ) | (\$3311  & \$1426 ));

// X$618 sky130_fd_sc_hd__a22o_2
assign \$3540  = ((\$2816  & \$3302 ) | (\$3311  & \$1462 ));

// X$619 sky130_fd_sc_hd__a22o_2
assign \$3331  = ((\$2741  & \$3302 ) | (\$3311  & \$1660 ));

// X$621 sky130_fd_sc_hd__or3_2
assign \$3310  = (\$1826  | \$3302  | \$3303 );

// X$623 sky130_fd_sc_hd__or3_2
assign \$3427  = (\$1936  | \$3302  | \$3303 );

// X$626 sky130_fd_sc_hd__and2b_2
assign \$2517  = (~\$3481  & \$3475 );

// X$627 sky130_fd_sc_hd__nand2b_2
assign \$3535  = ~(~\$3475  & \$3531 );

// X$628 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3250  or negedge rst_n) begin
    if (!rst_n)
        \$3481  <= 1'b0;
    else
        \$3481  <= \$3634 ;
end

// X$632 sky130_fd_sc_hd__nand4_2
assign \$3531  = ~(I & \$933  & \$3481  & \$3575 );

// X$633 sky130_fd_sc_hd__a31o_2
assign \$3541  = ((I & \$933  & \$3575 ) | (\$3481 ));

// X$636 sky130_fd_sc_hd__and2b_2
assign \$195  = (~\$1959  & \$1879 );

// X$637 sky130_fd_sc_hd__nand4_2
assign \$1958  = ~(I & \$933  & \$1959  & \$1960 );

// X$638 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1875  or negedge rst_n) begin
    if (!rst_n)
        \$1959  <= 1'b0;
    else
        \$1959  <= \$2001 ;
end

// X$642 sky130_fd_sc_hd__and2b_2
assign \$1483  = (~\$1362  & \$1414 );

// X$643 sky130_fd_sc_hd__and2_2
assign \$1418  = (\$1363  & \$1466 );

// X$644 sky130_fd_sc_hd__o32ai_2
assign \$1462  = ~((\$1419  | \$1420  | \$1418 ) & (\$1473  | \$1414 ));

// X$646 sky130_fd_sc_hd__a21o_2
assign \$1496  = ((\$1466  & \$1429 ) | (\$1363 ));

// X$647 sky130_fd_sc_hd__and3b_2
assign \$1490  = (~\$1468  & \$1466  & \$1469 );

// X$648 sky130_fd_sc_hd__a31oi_2
assign \$1420  = ~((\$1428  & \$1473  & \$1475 ) | (\$1469 ));

// X$650 sky130_fd_sc_hd__a311o_2
assign \$1422  = ((\$1428  & \$1473  & \$1475 ) | (\$1483 ) | (\$1469 ));

// X$653 sky130_fd_sc_hd__and2b_2
assign \$827  = (~\$593  & \$549 );

// X$654 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$785  or negedge rst_n) begin
    if (!rst_n)
        \$609  <= 1'b0;
    else
        \$609  <= \$643 ;
end

// X$659 sky130_fd_sc_hd__xnor2_2
assign \$2680  = ~(\$2813  ^ \$2658 );

// X$660 sky130_fd_sc_hd__a22o_2
assign \$2878  = ((\$933  & \$2906 ) | (\$2834  & \$2732 ));

// X$661 sky130_fd_sc_hd__xnor2_2
assign \$2982  = ~(\$2906  ^ \$2815 );

// X$662 sky130_fd_sc_hd__xnor2_2
assign \$2600  = ~(\$1527  ^ \$2971 );

// X$663 sky130_fd_sc_hd__and3_2
assign \$2971  = (\$1414  & \$1363  & \$1362 );

// X$665 sky130_fd_sc_hd__xnor2_2
assign \$2900  = ~(\$2732  ^ \$2680 );

// X$666 sky130_fd_sc_hd__a22oi_2
assign \$2646  = ~((\$1414  & \$2640 ) | (\$2592  & \$2566 ));

// X$669 sky130_fd_sc_hd__or2_2
assign \$2809  = (\$2752  | \$2900 );

// X$670 sky130_fd_sc_hd__nor2_2
assign \$2593  = ~(\$1414  | \$1363 );

// X$671 sky130_fd_sc_hd__and2b_2
assign \$2648  = (~\$1414  & \$1363 );

// X$672 sky130_fd_sc_hd__o221a_2
assign \$3068  = ((\$2651  | \$2910 ) & (\$2666  | \$2863 ) & (\$2568 ));

// X$673 sky130_fd_sc_hd__o32a_2
assign \$2921  = ((\$2748  | \$2702  | \$3146 ) & (\$2910  | \$2752 ));

// X$675 sky130_fd_sc_hd__dfstp_2
always @(posedge \$2728  or negedge rst_n) begin
    if (!rst_n)
        \$2906  <= 1'b1;
    else
        \$2906  <= \$2987 ;
end

// X$677 sky130_fd_sc_hd__xor2_2
assign \$2670  = (\$2651  ^ \$2900 );

// X$678 sky130_fd_sc_hd__xor2_2
assign \$2955  = (\$2658  ^ \$2815 );

// X$682 sky130_fd_sc_hd__xnor2_2
assign \$1543  = ~(\$1490  ^ \$1496 );

// X$683 sky130_fd_sc_hd__nor2_2
assign \$1468  = ~(\$1414  | \$1363 );

// X$684 sky130_fd_sc_hd__nand2b_2
assign \$1466  = ~(~\$1414  & \$1362 );

// X$685 sky130_fd_sc_hd__nand2_2
assign \$1663  = ~(\$1414  & \$1363 );

// X$686 sky130_fd_sc_hd__o21bai_2
assign \$1611  = ~((\$1468  | \$1473 ) & (~\$1490 ));

// X$687 sky130_fd_sc_hd__nor3_2
assign \$1425  = ~(\$1362  | \$1468  | \$1428 );

// X$688 sky130_fd_sc_hd__a21oi_2
assign \$1469  = ~((\$1414  & \$1363 ) | (\$1527 ));

// X$690 sky130_fd_sc_hd__nand2b_2
assign \$1475  = ~(~\$1527  & \$1362 );

// X$692 sky130_fd_sc_hd__nand2b_2
assign \$1473  = ~(~\$1362  & \$1527 );

// X$695 sky130_fd_sc_hd__xnor2_2
assign \$3148  = ~(\$2924  ^ \$3065 );

// X$696 sky130_fd_sc_hd__and2b_2
assign \$2907  = (~\$933  & \$3048 );

// X$697 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2728  or negedge rst_n) begin
    if (!rst_n)
        \$3057  <= 1'b0;
    else
        \$3057  <= \$3054 ;
end

// X$699 sky130_fd_sc_hd__xnor2_2
assign \$2660  = ~(\$2651  ^ \$3065 );

// X$700 sky130_fd_sc_hd__o21a_2
assign \$3080  = ((\$3101  | \$3079 ) & (\$3212 ));

// X$701 sky130_fd_sc_hd__a21o_2
assign \$3146  = ((\$933  & \$3057 ) | (\$2834 ));

// X$703 sky130_fd_sc_hd__xor2_2
assign \$3101  = (\$2752  ^ \$3057 );

// X$704 sky130_fd_sc_hd__dfstp_2
always @(posedge \$3066  or negedge rst_n) begin
    if (!rst_n)
        \$2651  <= 1'b1;
    else
        \$2651  <= \$3068 ;
end

// X$708 sky130_fd_sc_hd__or4_2
assign \$1205  = (\$1140  | \$1202  | \$1143  | \$1203 );

// X$709 sky130_fd_sc_hd__nand2_2
assign \$1203  = ~(I & \$933 );

// X$710 sky130_fd_sc_hd__or4b_2
assign \$1143  = (\$899  | \$1050  | \$984  | ~\$760 );

// X$712 sky130_fd_sc_hd__and2_2
assign \$381  = (\$1140  & \$1202 );

// X$714 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$729  or negedge rst_n) begin
    if (!rst_n)
        \$1140  <= 1'b0;
    else
        \$1140  <= \$1223 ;
end

// X$718 sky130_fd_sc_hd__or3_2
assign \$1170  = (\$1126  | \$837  | \$980 );

// X$720 sky130_fd_sc_hd__a21oi_2
assign \$1083  = ~((I & \$933 ) | (\$1126 ));

// X$721 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$729  or negedge rst_n) begin
    if (!rst_n)
        \$1126  <= 1'b0;
    else
        \$1126  <= \$1026 ;
end

// X$722 sky130_fd_sc_hd__and2b_2
assign \$975  = (~\$1037  & \$1173 );

// X$723 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$729  or negedge rst_n) begin
    if (!rst_n)
        \$980  <= 1'b0;
    else
        \$980  <= \$1091 ;
end

// X$729 sky130_fd_sc_hd__or3_2
assign \$865  = (\$874  | \$606  | \$703 );

// X$730 sky130_fd_sc_hd__nor2_2
assign \$1186  = ~(\$791  | \$792 );

// X$731 sky130_fd_sc_hd__nand2b_2
assign \$866  = ~(~\$654  & \$645 );

// X$732 sky130_fd_sc_hd__xnor2_2
assign \$668  = ~(\$864  ^ \$861 );

// X$733 sky130_fd_sc_hd__and3_2
assign \$1058  = (\$866  & \$986  & \$865 );

// X$735 sky130_fd_sc_hd__o211a_2
assign \$899  = ((\$718  | \$805 ) & (\$717 ) & (\$797 ));

// X$736 sky130_fd_sc_hd__xnor2_2
assign \$857  = ~(\$791  ^ \$792 );

// X$738 sky130_fd_sc_hd__a221o_2
assign \$859  = ((\$49  & \$501 ) | (\$846  & \$796 ) | (\$857 ));

// X$739 sky130_fd_sc_hd__mux2_1
assign \$856  = (\$572  ? \$83  : \$811 );

// X$740 sky130_fd_sc_hd__a21oi_2
assign \$796  = ~((\$572  & \$443 ) | (\$49 ));

// X$741 sky130_fd_sc_hd__and3_2
assign \$50  = (\$35  & \$569  & \$23 );

// X$743 sky130_fd_sc_hd__a211o_2
assign \$907  = ((\$572  & \$956 ) | (\$180 ) | (\$857 ));

// X$744 sky130_fd_sc_hd__a31o_2
assign \$954  = ((\$572  & \$166  & \$368 ) | (\$718 ));

// X$745 sky130_fd_sc_hd__or2_2
assign \$846  = (\$572  | \$391 );

// X$748 sky130_fd_sc_hd__a31o_2
assign \$3217  = ((\$1558  & \$1507  & \$933 ) | (\$3159 ));

// X$749 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2294  or negedge rst_n) begin
    if (!rst_n)
        \$3159  <= 1'b0;
    else
        \$3159  <= \$3217 ;
end

// X$751 sky130_fd_sc_hd__a31o_2
assign \$4119  = ((I & \$933  & \$4032 ) | (\$4031 ));

// X$752 sky130_fd_sc_hd__nand2b_2
assign \$4127  = ~(~\$4089  & \$4124 );

// X$756 sky130_fd_sc_hd__a21oi_2
assign \$1571  = ~((\$1774  & \$1650 ) | (\$1695 ));

// X$758 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1649  or negedge rst_n) begin
    if (!rst_n)
        \$1652  <= 1'b0;
    else
        \$1652  <= \$1571 ;
end

// X$760 sky130_fd_sc_hd__mux2_1
assign \$1695  = (\$1699  ? \$1774  : \$1558 );

// X$761 sky130_fd_sc_hd__mux2_1
assign \$1702  = (\$1652  ? \$1783  : \$1650 );

// X$762 sky130_fd_sc_hd__buf_2
assign \$1787  = \$1705 ;

// X$765 sky130_fd_sc_hd__inv_2
assign \$1774  = ~\$1652 ;

// X$768 sky130_fd_sc_hd__a21oi_2
assign \$1008  = ~((\$866  & \$986 ) | (\$865 ));

// X$769 sky130_fd_sc_hd__nand2_2
assign \$986  = ~(\$864  & \$861 );

// X$771 sky130_fd_sc_hd__nand2_2
assign \$490  = ~(\$668  & \$521 );

// X$772 sky130_fd_sc_hd__nor2_2
assign \$563  = ~(\$1008  | \$1058 );

// X$773 sky130_fd_sc_hd__a21o_2
assign \$589  = ((\$423  & \$563 ) | (\$1008 ));

// X$774 sky130_fd_sc_hd__or3_2
assign \$997  = (\$857  | \$534  | \$635 );

// X$775 sky130_fd_sc_hd__o211a_2
assign \$984  = ((\$718  | \$1073 ) & (\$859 ) & (\$797 ));

// X$777 sky130_fd_sc_hd__o21ai_2
assign \$1002  = ~((\$30  | \$50 ) & (\$49 ));

// X$778 sky130_fd_sc_hd__o211a_2
assign \$1050  = ((\$718  | \$856 ) & (\$907 ) & (\$797 ));

// X$781 sky130_fd_sc_hd__o21ai_2
assign \$1073  = ~((\$572  | \$676 ) & (\$205 ));

// X$783 sky130_fd_sc_hd__a21oi_2
assign \$2084  = ~((\$1414  & \$1527 ) | (\$1362 ));

// X$784 sky130_fd_sc_hd__nor2_2
assign \$2033  = ~(\$1527  | \$2029 );

// X$785 sky130_fd_sc_hd__o221a_2
assign \$2110  = ((\$2043  | \$2029 ) & (\$2033  | \$2084 ) & (\$2037 ));

// X$786 sky130_fd_sc_hd__and3b_2
assign \$2113  = (~\$1527  & \$2029  & \$1362 );

// X$787 sky130_fd_sc_hd__and3b_2
assign \$2083  = (~\$1527  & \$1362  & \$1363 );

// X$788 sky130_fd_sc_hd__nand2b_2
assign \$2037  = ~(~\$1414  & \$1363 );

// X$789 sky130_fd_sc_hd__nand2_2
assign \$2100  = ~(\$1414  & \$2043 );

// X$794 sky130_fd_sc_hd__a21oi_2
assign \$383  = ~((\$416  & \$486 ) | (\$351 ));

// X$795 sky130_fd_sc_hd__nand2_2
assign \$556  = ~(\$418  & \$486 );

// X$796 sky130_fd_sc_hd__a31o_2
assign \$601  = ((\$416  & \$417  & \$418 ) | (\$606 ));

// X$797 sky130_fd_sc_hd__o311a_2
assign \$492  = ((\$407  | \$49  | \$519 ) & (\$147 ) & (\$439 ));

// X$798 sky130_fd_sc_hd__o2bb2a_2
assign \$521  = ((~\$425  | ~\$383 ) & (\$476  | \$417 ));

// X$799 sky130_fd_sc_hd__xnor2_2
assign \$147  = ~(\$589  ^ \$554 );

// X$800 sky130_fd_sc_hd__inv_2
assign \$569  = ~\$97 ;

// X$802 sky130_fd_sc_hd__o22ai_2
assign \$501  = ~((\$35  | \$15 ) & (\$227  | \$572 ));

// X$803 sky130_fd_sc_hd__mux2_1
assign \$558  = (\$51  ? \$35  : \$30 );

// X$804 sky130_fd_sc_hd__nand2_2
assign \$654  = ~(\$416  & \$417 );

// X$806 sky130_fd_sc_hd__and2b_2
assign \$554  = (~\$427  & \$653 );

// X$807 sky130_fd_sc_hd__a21oi_2
assign \$684  = ~((\$416  & \$418 ) | (\$417 ));

// X$808 sky130_fd_sc_hd__a211o_2
assign \$681  = ((\$49  & \$61 ) | (\$558 ) | (\$147 ));

// X$810 sky130_fd_sc_hd__xor2_2
assign \$645  = (\$418  ^ \$486 );

// X$811 sky130_fd_sc_hd__xor2_2
assign \$572  = (\$589  ^ \$554 );

// X$813 sky130_fd_sc_hd__mux2_1
assign \$627  = (\$49  ? \$317  : \$631 );

// X$814 sky130_fd_sc_hd__o32a_2
assign \$676  = ((\$49  | \$519  | \$55 ) & (\$380  | \$179 ));

// X$815 sky130_fd_sc_hd__a21oi_2
assign \$635  = ~((\$413  & \$157 ) | (\$147 ));

// X$820 sky130_fd_sc_hd__o211a_2
assign \$2328  = ((\$2306  | \$1362 ) & (\$2235 ) & (\$1363 ));

// X$821 sky130_fd_sc_hd__o21a_2
assign \$2331  = ((\$2306  | \$2237 ) & (\$2235 ));

// X$822 sky130_fd_sc_hd__and3_2
assign \$2318  = (\$1414  & \$2235  & \$2313 );

// X$824 sky130_fd_sc_hd__and2b_2
assign \$2323  = (~\$1363  & \$1414 );

// X$825 sky130_fd_sc_hd__nor3b_2
assign \$2404  = ~(\$1414  | \$1362  | ~\$1363 );

// X$829 sky130_fd_sc_hd__and2b_2
assign \$2313  = (~\$1362  & \$1363 );

// X$830 sky130_fd_sc_hd__o211a_2
assign \$4002  = ((\$1527  | \$3861 ) & (\$3860 ) & (\$3813 ));

// X$832 sky130_fd_sc_hd__inv_2
assign \$3886  = ~\$1527 ;

// X$833 sky130_fd_sc_hd__dfxtp_2
always @(posedge \$3066 ) begin
    \$1527  <= \$3883 ;
end

// X$834 sky130_fd_sc_hd__a21boi_2
assign \$3883  = ~((\$3886  & \$3861 ) | (~\$3813 ));

// X$836 sky130_fd_sc_hd__and3_2
assign O[1] = (\$3813  & \$3874  & \$3868 );

// X$840 sky130_fd_sc_hd__and3_2
assign \$836  = (\$1126  & I & \$933 );

// X$841 sky130_fd_sc_hd__and3_2
assign \$375  = (\$314  & \$376  & \$372 );

// X$842 sky130_fd_sc_hd__and3_2
assign \$372  = (\$1128  & \$373  & \$591 );

// X$843 sky130_fd_sc_hd__and4_2
assign \$376  = (\$381  & \$378  & \$441  & \$442 );

// X$848 sky130_fd_sc_hd__and3_2
assign \$804  = (\$147  & \$82  & \$1002 );

// X$849 sky130_fd_sc_hd__nor2_2
assign \$797  = ~(\$1186  | \$421 );

// X$850 sky130_fd_sc_hd__o21ai_2
assign \$150  = ~((\$31  | \$37 ) & (\$49 ));

// X$855 sky130_fd_sc_hd__and3_2
assign \$2237  = (\$1414  & \$1363  & \$1362 );

// X$856 sky130_fd_sc_hd__a2111oi_2
assign \$2475  = ~((\$1414  & \$1362 ) | (\$1527 ) | (\$2313 ) | (\$2497 ));

// X$859 sky130_fd_sc_hd__nor2_2
assign \$2497  = ~(\$1414  | \$1363 );

// X$860 sky130_fd_sc_hd__a21oi_2
assign \$2500  = ~((\$1414  & \$2313 ) | (\$1527 ));

// X$864 sky130_fd_sc_hd__and3_2
assign \$2455  = (\$2511  & \$2520  & \$2453 );

// X$866 sky130_fd_sc_hd__mux2_1
assign \$2523  = (\$933  ? \$2462  : \$2458 );

// X$867 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2294  or negedge rst_n) begin
    if (!rst_n)
        \$2462  <= 1'b0;
    else
        \$2462  <= \$2531 ;
end

// X$868 sky130_fd_sc_hd__mux2_1
assign \$2437  = (\$933  ? \$2548  : \$2376 );

// X$869 sky130_fd_sc_hd__mux2_1
assign \$2602  = (\$933  ? \$2458  : \$2548 );

// X$870 sky130_fd_sc_hd__a22o_2
assign \$2285  = ((\$1705  & \$2462 ) | (\$1787  & \$2377 ));

// X$875 sky130_fd_sc_hd__mux2_1
assign \$2189  = (\$933  ? \$2263  : \$2222 );

// X$876 sky130_fd_sc_hd__a221o_2
assign \$2419  = ((\$1733  & \$2223 ) | (1'b1 & \$2224 ) | (\$2285 ));

// X$877 sky130_fd_sc_hd__clkbuf_8
assign \$2288  = \$1271 ;

// X$879 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2288  or negedge rst_n) begin
    if (!rst_n)
        \$2224  <= 1'b0;
    else
        \$2224  <= \$2352 ;
end

// X$880 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2288  or negedge rst_n) begin
    if (!rst_n)
        \$2221  <= 1'b0;
    else
        \$2221  <= \$2266 ;
end

// X$881 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2288  or negedge rst_n) begin
    if (!rst_n)
        \$2376  <= 1'b0;
    else
        \$2376  <= \$2437 ;
end

// X$886 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2288  or negedge rst_n) begin
    if (!rst_n)
        \$2265  <= 1'b0;
    else
        \$2265  <= \$2438 ;
end

// X$887 sky130_fd_sc_hd__mux2_1
assign \$2048  = (\$1362  ? \$1527  : \$1363 );

// X$888 sky130_fd_sc_hd__or2_2
assign \$2043  = (\$1362  | \$1527 );

// X$889 sky130_fd_sc_hd__o21ai_2
assign \$2167  = ~((\$1363  | \$1362 ) & (\$1527 ));

// X$890 sky130_fd_sc_hd__o211a_2
assign \$2160  = ((\$1363  | \$2043 ) & (\$2100 ) & (\$2167 ));

// X$1267 sky130_fd_sc_hd__clkbuf_8
assign \$3066  = \$1271 ;

// X$1382 sky130_fd_sc_hd__nor4_2
assign \$3116  = ~(\$27  | \$340  | \$864  | \$425 );

// X$1383 sky130_fd_sc_hd__a31o_2
assign \$2897  = ((I & \$933  & \$3116 ) | (\$2895 ));

// X$1384 sky130_fd_sc_hd__nand4_2
assign \$2889  = ~(I & \$933  & \$2895  & \$3116 );

// X$1601 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2294  or negedge rst_n) begin
    if (!rst_n)
        \$2548  <= 1'b0;
    else
        \$2548  <= \$2602 ;
end

// X$1613 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$983  or negedge rst_n) begin
    if (!rst_n)
        \$1048  <= 1'b0;
    else
        \$1048  <= \$966 ;
end

// X$1615 sky130_fd_sc_hd__nand4_2
assign \$896  = ~(I & \$933  & \$1048  & \$1046 );

// X$1616 sky130_fd_sc_hd__and2b_2
assign \$378  = (~\$1048  & \$882 );

// X$1619 sky130_fd_sc_hd__and3_2
assign O[5] = (\$3813  & \$3623  & \$3868 );

// X$1626 sky130_fd_sc_hd__o21a_2
assign \$966  = ((\$882  | \$896 ) & (\$967 ));

// X$1627 sky130_fd_sc_hd__nand2b_2
assign \$879  = ~(~\$882  & \$896 );

// X$1628 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$983  or negedge rst_n) begin
    if (!rst_n)
        \$882  <= 1'b0;
    else
        \$882  <= \$879 ;
end

// X$1633 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2294  or negedge rst_n) begin
    if (!rst_n)
        \$2851  <= 1'b0;
    else
        \$2851  <= \$2793 ;
end

// X$1640 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1460  or negedge rst_n) begin
    if (!rst_n)
        \$1742  <= 1'b0;
    else
        \$1742  <= \$1768 ;
end

// X$1641 sky130_fd_sc_hd__and2b_2
assign \$194  = (~\$1742  & \$1782 );

// X$1642 sky130_fd_sc_hd__nand2b_2
assign \$1937  = ~(~\$1782  & \$1743 );

// X$1646 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1875  or negedge rst_n) begin
    if (!rst_n)
        \$2103  <= 1'b0;
    else
        \$2103  <= \$2108 ;
end

// X$1661 sky130_fd_sc_hd__o21a_2
assign \$2236  = ((\$1363  | \$2100 ) & (\$2167 ));

// X$1663 sky130_fd_sc_hd__o31a_2
assign \$2250  = ((\$2237  | \$2323  | \$2404 ) & (\$2235 ));

// X$1664 sky130_fd_sc_hd__inv_2
assign \$2235  = ~\$1527 ;

// X$1668 sky130_fd_sc_hd__o21a_2
assign \$3176  = ((\$3168  | \$3171 ) & (\$3173 ));

// X$1669 sky130_fd_sc_hd__clkbuf_8
assign \$3250  = \$1271 ;

// X$1671 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3066  or negedge rst_n) begin
    if (!rst_n)
        \$3178  <= 1'b0;
    else
        \$3178  <= \$3264 ;
end

// X$1672 sky130_fd_sc_hd__a21o_2
assign \$3264  = ((\$3168  & \$3171 ) | (\$3178 ));

// X$1673 sky130_fd_sc_hd__or4_2
assign \$3173  = (\$3178  | \$3246  | \$3175  | \$3174 );

// X$1677 sky130_fd_sc_hd__o21a_2
assign \$1256  = ((\$1221  | \$1224 ) & (\$1213 ));

// X$1678 sky130_fd_sc_hd__a21o_2
assign \$1223  = ((\$1220  & \$1227 ) | (\$1140 ));

// X$1679 sky130_fd_sc_hd__o21a_2
assign \$1243  = ((\$1220  | \$1227 ) & (\$1205 ));

// X$1680 sky130_fd_sc_hd__nor2_2
assign \$1227  = ~(\$1143  | \$1203 );

// X$1681 sky130_fd_sc_hd__nand2_2
assign \$1275  = ~(I & \$933 );

// X$1683 sky130_fd_sc_hd__inv_2
assign \$1202  = ~\$1220 ;

// X$1684 sky130_fd_sc_hd__o21a_2
assign \$1303  = ((\$1280  | \$1262 ) & (\$1283 ));

// X$1686 sky130_fd_sc_hd__and4bb_2
assign \$1288  = (~\$1050  & ~\$984  & \$760  & \$899 );

// X$1689 sky130_fd_sc_hd__o21a_2
assign \$3892  = ((\$3785  | \$3825 ) & (\$3789 ));

// X$1690 sky130_fd_sc_hd__and2b_2
assign \$3812  = (~\$3791  & \$3785 );

// X$1691 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3250  or negedge rst_n) begin
    if (!rst_n)
        \$3791  <= 1'b0;
    else
        \$3791  <= \$3892 ;
end

// X$1693 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3889  or negedge rst_n) begin
    if (!rst_n)
        \$3902  <= 1'b0;
    else
        \$3902  <= \$3848 ;
end

// X$1697 sky130_fd_sc_hd__o21a_2
assign \$1768  = ((\$1782  | \$1743 ) & (\$1773 ));

// X$1698 sky130_fd_sc_hd__a31o_2
assign \$1773  = ((I & \$933  & \$1740 ) | (\$1742 ));

// X$1699 sky130_fd_sc_hd__nand2b_2
assign \$1764  = ~(~\$1618  & \$1582 );

// X$1701 sky130_fd_sc_hd__nand4_2
assign \$1743  = ~(I & \$933  & \$1742  & \$1740 );

// X$1703 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1460  or negedge rst_n) begin
    if (!rst_n)
        \$1782  <= 1'b0;
    else
        \$1782  <= \$1937 ;
end

// X$1707 sky130_fd_sc_hd__o21a_2
assign \$1709  = ((\$1618  | \$1582 ) & (\$1627 ));

// X$1708 sky130_fd_sc_hd__and2_2
assign \$316  = (\$1503  & \$1500 );

// X$1709 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1460  or negedge rst_n) begin
    if (!rst_n)
        \$1454  <= 1'b0;
    else
        \$1454  <= \$1709 ;
end

// X$1711 sky130_fd_sc_hd__inv_2
assign \$1500  = ~\$1555 ;

// X$1713 sky130_fd_sc_hd__and4bb_2
assign \$1740  = (~\$760  & ~\$1050  & \$984  & \$899 );

// X$1714 sky130_fd_sc_hd__and2b_2
assign \$234  = (~\$1454  & \$1618 );

// X$1717 sky130_fd_sc_hd__o21a_2
assign \$919  = ((\$837  | \$593 ) & (\$781 ));

// X$1718 sky130_fd_sc_hd__and2_2
assign \$880  = (\$609  & \$782 );

// X$1720 sky130_fd_sc_hd__nand2_2
assign \$781  = ~(\$836  & \$969 );

// X$1721 sky130_fd_sc_hd__and3_2
assign \$593  = (\$689  & \$688  & \$836 );

// X$1722 sky130_fd_sc_hd__nor3_2
assign \$730  = ~(\$782  | \$929  | \$1170 );

// X$1723 sky130_fd_sc_hd__xnor2_2
assign \$643  = ~(\$609  ^ \$781 );

// X$1724 sky130_fd_sc_hd__inv_2
assign \$888  = ~\$836 ;

// X$1725 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$785  or negedge rst_n) begin
    if (!rst_n)
        \$688  <= 1'b0;
    else
        \$688  <= \$827 ;
end

// X$1726 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$785  or negedge rst_n) begin
    if (!rst_n)
        \$929  <= 1'b0;
    else
        \$929  <= \$975 ;
end

// X$1729 sky130_fd_sc_hd__a32o_2
assign \$686  = ((I & \$933  & \$1095 ) | (\$888  & \$689 ));

// X$1730 sky130_fd_sc_hd__a21o_2
assign \$549  = ((\$689  & \$836 ) | (\$688 ));

// X$1733 sky130_fd_sc_hd__inv_2
assign \$1539  = ~\$1513 ;

// X$1734 sky130_fd_sc_hd__inv_2
assign \$1615  = ~\$1558 ;

// X$1735 sky130_fd_sc_hd__a31o_2
assign \$1619  = ((\$1558  & \$933  & \$1702 ) | (\$1513 ));

// X$1736 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1649  or negedge rst_n) begin
    if (!rst_n)
        \$1513  <= 1'b0;
    else
        \$1513  <= \$1619 ;
end

// X$1741 sky130_fd_sc_hd__inv_2
assign \$2306  = ~\$1414 ;

// X$1742 sky130_fd_sc_hd__o22a_2
assign \$1682  = ((\$1527  | \$1663 ) & (\$1592  | \$1468 ));

// X$1743 sky130_fd_sc_hd__and2_2
assign \$1660  = (\$1663  & \$1592 );

// X$1744 sky130_fd_sc_hd__nand2_2
assign \$1592  = ~(\$1362  & \$1527 );

// X$1745 sky130_fd_sc_hd__nor2_2
assign \$1757  = ~(\$1527  | \$1663 );

// X$1749 sky130_fd_sc_hd__o22a_2
assign \$1822  = ((\$1363  | \$1362 ) & (\$1901  | \$1910 ));

// X$1750 sky130_fd_sc_hd__a31o_2
assign \$1936  = ((\$1414  & \$1362  & \$1823 ) | (\$1842 ));

// X$1751 sky130_fd_sc_hd__nor3_2
assign \$1842  = ~(\$1414  | \$1363  | \$1362 );

// X$1752 sky130_fd_sc_hd__nor4b_2
assign \$1831  = ~(\$1414  | \$1363  | \$1362  | ~\$1527 );

// X$1753 sky130_fd_sc_hd__a21oi_2
assign \$1901  = ~((\$1414  & \$1363 ) | (\$1527 ));

// X$1758 sky130_fd_sc_hd__and2_2
assign \$4203  = (\$1539  & \$692 );

// X$1761 sky130_fd_sc_hd__and2_2
assign \$1428  = (\$1414  & \$1363 );

// X$1763 sky130_fd_sc_hd__nand2b_2
assign \$1429  = ~(~\$1362  & \$1414 );

// X$1764 sky130_fd_sc_hd__and2b_2
assign \$1419  = (~\$1363  & \$1362 );

// X$1765 sky130_fd_sc_hd__o31a_2
assign \$1426  = ((\$1419  | \$1420  | \$1425 ) & (\$1422 ));

// X$1815 sky130_fd_sc_hd__or3_2
assign \$3490  = (\$1975  | \$3302  | \$3303 );

// X$1990 sky130_fd_sc_hd__nor2_2
assign \$3171  = ~(\$3175  | \$3174 );

// X$1991 sky130_fd_sc_hd__or4b_2
assign \$3175  = (\$27  | \$864  | \$425  | ~\$340 );

// X$1993 sky130_fd_sc_hd__nand2_2
assign \$3174  = ~(I & \$933 );

// X$1999 sky130_fd_sc_hd__clkbuf_16
assign \$1271  = clk;

// X$2040 sky130_fd_sc_hd__and2_2
assign \$373  = (\$2020  & \$2017 );

// X$2041 sky130_fd_sc_hd__inv_2
assign \$2017  = ~\$2019 ;

// X$2042 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2155  or negedge rst_n) begin
    if (!rst_n)
        \$2020  <= 1'b0;
    else
        \$2020  <= \$2053 ;
end

// X$2043 sky130_fd_sc_hd__and4b_2
assign \$1960  = (~\$1050  & \$984  & \$760  & \$899 );

// X$2048 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1649  or negedge rst_n) begin
    if (!rst_n)
        \$417  <= 1'b0;
    else
        \$417  <= \$1791 ;
end

// X$2092 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3588  or negedge rst_n) begin
    if (!rst_n)
        \$3981  <= 1'b0;
    else
        \$3981  <= \$4214 ;
end

// X$2094 sky130_fd_sc_hd__a32o_2
assign \$4214  = ((\$4210  & \$4203  & \$4252 ) | (\$3981  & \$4255 ));

// X$2095 sky130_fd_sc_hd__inv_2
assign \$4210  = ~\$2269 ;

// X$2107 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$729 

// X$2108 sky130_fd_sc_hd__clkbuf_8
assign \$729  = \$1271 ;

// X$2133 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$3588  or negedge rst_n) begin
    if (!rst_n)
        \$3813  <= 1'b0;
    else
        \$3813  <= \$4316 ;
end

// X$2140 sky130_fd_sc_hd__nor2_2
assign \$407  = ~(\$105  | \$35 );

// X$2141 sky130_fd_sc_hd__nand2_2
assign \$89  = ~(\$98  & \$29 );

// X$2142 sky130_fd_sc_hd__nand2_2
assign \$413  = ~(\$49  & \$57 );

// X$2143 sky130_fd_sc_hd__nand2_2
assign \$476  = ~(\$347  & \$416 );

// X$2144 sky130_fd_sc_hd__a21oi_2
assign \$169  = ~((\$31  & \$181 ) | (\$49 ));

// X$2145 sky130_fd_sc_hd__o211a_2
assign \$421  = ((\$347  | \$416 ) & (\$417 ) & (\$418 ));

// X$2146 sky130_fd_sc_hd__xor2_2
assign \$78  = (\$347  ^ \$416 );

// X$2147 sky130_fd_sc_hd__and4bb_2
assign \$427  = (~\$347  & ~\$416  & \$417  & \$418 );

// X$2148 sky130_fd_sc_hd__nor2_2
assign \$391  = ~(\$31  | \$89 );

// X$2149 sky130_fd_sc_hd__nand2_2
assign \$664  = ~(\$347  & \$417 );

// X$2150 sky130_fd_sc_hd__nor2_2
assign \$874  = ~(\$416  | \$556 );

// X$2151 sky130_fd_sc_hd__a21o_2
assign \$423  = ((\$291  & \$490 ) | (\$489 ));

// X$2152 sky130_fd_sc_hd__o211a_2
assign \$534  = ((\$413  | \$30 ) & (\$147 ) & (\$386 ));

// X$2154 sky130_fd_sc_hd__xor2_2
assign \$486  = (\$347  ^ \$417 );

// X$2155 sky130_fd_sc_hd__xor2_2
assign \$49  = (\$423  ^ \$563 );

// X$2157 sky130_fd_sc_hd__xnor2_2
assign \$35  = ~(\$291  ^ \$504 );

// X$2158 sky130_fd_sc_hd__mux2_1
assign \$430  = (\$31  ? \$306  : \$58 );

// X$2160 sky130_fd_sc_hd__o21ba_2
assign \$443  = ((\$35  | \$80 ) & (~\$345 ));

// X$2161 sky130_fd_sc_hd__nand2_2
assign \$439  = ~(\$49  & \$430 );

// X$2162 sky130_fd_sc_hd__a211o_2
assign \$710  = ((\$35  & \$80 ) | (\$209 ) | (\$49 ));

// X$2218 sky130_fd_sc_hd__mux2_1
assign \$2108  = (\$933  ? \$2221  : \$2103 );

// X$2219 sky130_fd_sc_hd__clkbuf_4
// DROPPED: cell's .SUBCKT has no output pin (X/Y) - this instance's output is not wired to anything outside the cell in this netlist
// Physical pins: VPB, VGND, VPWR, A, sky130_gnd
// Connected as: A=\$2288 

// X$2220 sky130_fd_sc_hd__mux2_1
assign \$2266  = (\$933  ? \$2222  : \$2221 );

// X$2221 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$2216  or negedge rst_n) begin
    if (!rst_n)
        \$2263  <= 1'b0;
    else
        \$2263  <= \$2423 ;
end

// X$2222 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$1875  or negedge rst_n) begin
    if (!rst_n)
        \$2223  <= 1'b0;
    else
        \$2223  <= \$2137 ;
end

// X$2223 sky130_fd_sc_hd__mux2_1
assign \$2137  = (\$933  ? \$2185  : \$2223 );

// X$2224 sky130_fd_sc_hd__inv_2
assign \$2269  = ~\$2265 ;

// X$2227 sky130_fd_sc_hd__mux2_1
assign \$2352  = (\$933  ? \$2223  : \$2224 );

// X$2401 sky130_fd_sc_hd__a31o_2
assign \$1021  = ((\$609  & \$836  & \$969 ) | (\$782 ));

// X$2402 sky130_fd_sc_hd__nor2_2
assign \$1026  = ~(\$836  | \$1083 );

// X$2403 sky130_fd_sc_hd__and4bb_2
assign \$1039  = (~\$688  & ~\$980  & \$929  & \$837 );

// X$2404 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$785  or negedge rst_n) begin
    if (!rst_n)
        \$837  <= 1'b0;
    else
        \$837  <= \$919 ;
end

// X$2405 sky130_fd_sc_hd__and3_2
assign \$969  = (\$689  & \$688  & \$837 );

// X$2406 sky130_fd_sc_hd__a31o_2
assign \$1173  = ((\$880  & \$836  & \$969 ) | (\$929 ));

// X$2407 sky130_fd_sc_hd__and4_2
assign \$1037  = (\$929  & \$880  & \$836  & \$969 );

// X$2408 sky130_fd_sc_hd__xor2_2
assign \$1091  = (\$980  ^ \$1037 );

// X$2409 sky130_fd_sc_hd__and2b_2
assign \$1095  = (~\$689  & \$1126 );

// X$2413 sky130_fd_sc_hd__and3_2
assign \$1103  = (\$1039  & \$1095  & \$880 );

// X$2447 sky130_fd_sc_hd__nand2_2
assign \$1650  = ~(\$1730  & I);

// X$2448 sky130_fd_sc_hd__nand2_2
assign \$831  = ~(\$609  & \$782 );

// X$2450 sky130_fd_sc_hd__and4_2
assign \$692  = (\$689  & \$688  & \$609  & \$730 );

// X$2451 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$729  or negedge rst_n) begin
    if (!rst_n)
        \$689  <= 1'b0;
    else
        \$689  <= \$686 ;
end

// X$2452 sky130_fd_sc_hd__o21a_2
assign \$734  = ((\$831  | \$781 ) & (\$1021 ));

// X$2453 sky130_fd_sc_hd__dfrtp_2
always @(posedge \$785  or negedge rst_n) begin
    if (!rst_n)
        \$782  <= 1'b0;
    else
        \$782  <= \$734 ;
end

// X$2456 sky130_fd_sc_hd__nor4b_2
assign \$737  = ~(\$689  | \$688  | \$609  | ~\$730 );

// X$2459 sky130_fd_sc_hd__or2_2
assign \$2592  = (\$1363  | \$1362 );

// X$2460 sky130_fd_sc_hd__nand2_2
assign \$2697  = ~(\$1362  & \$2648 );

// X$2461 sky130_fd_sc_hd__nor2_2
assign \$2690  = ~(\$1362  | \$2601 );

// X$2462 sky130_fd_sc_hd__o32a_2
assign \$2681  = ((\$2654  | \$2600  | \$2690 ) & (\$2601  | \$2567 ));

// X$2463 sky130_fd_sc_hd__nor3b_2
assign \$2586  = ~(\$933  | \$2660  | ~\$2569 );

// X$2465 sky130_fd_sc_hd__o21ai_2
assign \$2568  = ~((I | \$2569 ) & (\$2588 ));

// X$2466 sky130_fd_sc_hd__a31o_2
assign \$2691  = ((\$1362  & \$2640  & \$2566 ) | (\$2646 ));

// X$2467 sky130_fd_sc_hd__nor2_2
assign \$2639  = ~(\$1414  | \$2640 );

// X$2469 sky130_fd_sc_hd__inv_2
assign \$2654  = ~\$2697 ;

// X$2470 sky130_fd_sc_hd__xnor2_2
assign \$2655  = ~(\$2815  ^ \$2691 );

// X$2471 sky130_fd_sc_hd__xor2_2
assign \$2736  = (\$2658  ^ \$2681 );

// X$2473 sky130_fd_sc_hd__o21ai_2
assign \$2754  = ~((\$2654  | \$2567 ) & (\$2662 ));

// X$2476 sky130_fd_sc_hd__nor2_2
assign \$1823  = ~(\$1363  | \$1527 );

// X$2477 sky130_fd_sc_hd__a21o_2
assign \$1826  = ((\$1414  & \$1823 ) | (\$1831 ));

// X$2481 sky130_fd_sc_hd__nor2_2
assign \$2583  = ~(\$933  | \$2569 );

// X$2482 sky130_fd_sc_hd__nand2_2
assign \$2567  = ~(\$2592  & \$2600 );

// X$2483 sky130_fd_sc_hd__nand2_2
assign \$2566  = ~(\$1414  & \$1363 );

// X$2484 sky130_fd_sc_hd__and2b_2
assign \$2601  = (~\$2593  & \$2566 );

// X$2485 sky130_fd_sc_hd__a21boi_2
assign \$2588  = ~((I & \$2569 ) | (~\$933 ));

// X$2489 sky130_fd_sc_hd__nor2_2
assign \$97  = ~(\$247  | \$288 );

// X$2490 sky130_fd_sc_hd__nand2_2
assign \$105  = ~(\$98  & \$56 );

// X$2491 sky130_fd_sc_hd__or3_2
assign \$58  = (\$56  | \$46  | \$14 );

// X$2492 sky130_fd_sc_hd__and2b_2
assign \$29  = (~\$143  & \$288 );

// X$2493 sky130_fd_sc_hd__a32o_2
assign \$291  = ((\$27  & \$78  & \$330 ) | (\$98  & \$143 ));

// X$2494 sky130_fd_sc_hd__xnor2_2
assign \$98  = ~(\$28  ^ \$330 );

// X$2495 sky130_fd_sc_hd__a22o_2
assign \$317  = ((\$15  & \$30 ) | (\$17  & \$35 ));

// X$2497 sky130_fd_sc_hd__o31ai_2
assign \$313  = ~((\$56  | \$31  | \$94 ) & (\$105 ));

// X$2498 sky130_fd_sc_hd__nand2b_2
assign \$51  = ~(~\$100  & \$61 );

// X$2499 sky130_fd_sc_hd__or3_2
assign \$306  = (\$56  | \$14  | \$151 );

// X$2502 sky130_fd_sc_hd__nor2_2
assign \$389  = ~(\$181  | \$57 );

// X$2503 sky130_fd_sc_hd__nor2_2
assign \$345  = ~(\$105  | \$31 );

// X$2504 sky130_fd_sc_hd__nor2_2
assign \$47  = ~(\$348  | \$247 );

// X$2505 sky130_fd_sc_hd__nand2_2
assign \$93  = ~(\$340  & \$347 );

// X$2506 sky130_fd_sc_hd__nor2_2
assign \$247  = ~(\$340  | \$347 );

// X$2507 sky130_fd_sc_hd__nor2_2
assign \$351  = ~(\$416  | \$417 );

// X$2508 sky130_fd_sc_hd__or3_2
assign \$386  = (\$49  | \$391  | \$115 );

// X$2510 sky130_fd_sc_hd__and2_2
assign \$348  = (\$340  & \$347 );

// X$2511 sky130_fd_sc_hd__xor2_2
assign \$330  = (\$425  ^ \$383 );

// X$2512 sky130_fd_sc_hd__xor2_2
assign \$31  = (\$291  ^ \$504 );

// X$2514 sky130_fd_sc_hd__o31ai_2
assign \$380  = ~((\$35  | \$151  | \$37 ) & (\$49 ));

// X$2515 sky130_fd_sc_hd__nand2_2
assign \$368  = ~(\$49  & \$313 );

// X$2519 sky130_fd_sc_hd__nor2_2
assign \$181  = ~(\$46  | \$14 );

// X$2520 sky130_fd_sc_hd__or2_2
assign \$17  = (\$94  | \$14 );

// X$2521 sky130_fd_sc_hd__nand2_2
assign \$28  = ~(\$27  & \$78 );

// X$2523 sky130_fd_sc_hd__a311o_2
assign \$82  = ((\$98  & \$49  & \$29 ) | (\$30 ) | (\$50 ));

// X$2524 sky130_fd_sc_hd__o22a_2
assign \$38  = ((\$31  | \$51 ) & (\$16  | \$47 ));

// X$2525 sky130_fd_sc_hd__inv_2
assign \$37  = ~\$17 ;

// X$2526 sky130_fd_sc_hd__nand2_2
assign \$15  = ~(\$46  & \$14 );

// X$2527 sky130_fd_sc_hd__nand2_2
assign \$23  = ~(\$126  & \$46 );

// X$2528 sky130_fd_sc_hd__nor2_2
assign \$14  = ~(\$47  | \$29 );

// X$2529 sky130_fd_sc_hd__nand2_2
assign \$288  = ~(\$139  & \$93 );

// X$2530 sky130_fd_sc_hd__nand2_2
assign \$80  = ~(\$98  & \$97 );

// X$2532 sky130_fd_sc_hd__mux2_1
assign \$83  = (\$49  ? \$120  : \$72 );

// X$2533 sky130_fd_sc_hd__and3_2
assign \$519  = (\$35  & \$46  & \$100 );

// X$2534 sky130_fd_sc_hd__o211a_2
assign \$131  = ((\$56  | \$94 ) & (\$35 ) & (\$105 ));

// X$2536 sky130_fd_sc_hd__a21oi_2
assign \$55  = ~((\$35  & \$100 ) | (\$58 ));

// X$2538 sky130_fd_sc_hd__o21a_2
assign \$72  = ((\$56  | \$57 ) & (\$54 ));

// X$2539 sky130_fd_sc_hd__nand2_2
assign \$57  = ~(\$35  & \$15 );

// X$2540 sky130_fd_sc_hd__or2_2
assign \$16  = (\$35  | \$61 );

// X$2541 sky130_fd_sc_hd__nor2_2
assign \$65  = ~(\$35  | \$58 );

// X$2542 sky130_fd_sc_hd__a31o_2
assign \$120  = ((\$31  & \$89  & \$23 ) | (\$100 ));

// X$2543 sky130_fd_sc_hd__or2_2
assign \$54  = (\$35  | \$14 );

// X$2544 sky130_fd_sc_hd__nor2_2
assign \$115  = ~(\$31  | \$61 );

// X$2549 sky130_fd_sc_hd__nor2_2
assign \$606  = ~(\$664  | \$665 );

// X$2551 sky130_fd_sc_hd__and3_2
assign \$703  = (\$664  & \$556  & \$665 );

// X$2552 sky130_fd_sc_hd__a21oi_2
assign \$702  = ~((\$418  & \$654 ) | (\$606 ));

// X$2553 sky130_fd_sc_hd__o22ai_2
assign \$653  = ~((\$416  | \$556 ) & (\$684  | \$601 ));

// X$2554 sky130_fd_sc_hd__xnor2_2
assign \$665  = ~(\$416  ^ \$418 );

// X$2555 sky130_fd_sc_hd__xnor2_2
assign \$504  = ~(\$668  ^ \$521 );

// X$2556 sky130_fd_sc_hd__nor2_2
assign \$489  = ~(\$668  | \$521 );

// X$2557 sky130_fd_sc_hd__a21oi_2
assign \$791  = ~((\$589  & \$653 ) | (\$427 ));

// X$2558 sky130_fd_sc_hd__a21o_2
assign \$792  = ((\$654  & \$606 ) | (\$702 ));

// X$2560 sky130_fd_sc_hd__xnor2_2
assign \$861  = ~(\$654  ^ \$645 );

// X$2561 sky130_fd_sc_hd__xor2_2
assign \$718  = (\$791  ^ \$792 );

// X$2563 sky130_fd_sc_hd__o32a_2
assign \$811  = ((\$49  | \$519  | \$65 ) & (\$389  | \$380 ));

// X$2565 sky130_fd_sc_hd__o211ai_2
assign \$717  = ~((\$572  | \$627 ) & (\$681 ) & (\$718 ));

// X$2566 sky130_fd_sc_hd__a21bo_2
assign \$711  = ((\$49  & \$345 ) | (~\$710 ));

// X$2567 sky130_fd_sc_hd__or2_2
assign \$631  = (\$115  | \$311 );

// X$2569 sky130_fd_sc_hd__o211a_2
assign \$760  = ((\$492  | \$954 ) & (\$797 ) & (\$997 ));

// X$2570 sky130_fd_sc_hd__a21o_2
assign \$805  = ((\$572  & \$711 ) | (\$804 ));

// X$2574 sky130_fd_sc_hd__nor2_2
assign \$3487  = ~(\$737  | \$4041 );

// X$2576 sky130_fd_sc_hd__nor2_2
assign \$179  = ~(\$31  | \$181 );

// X$2578 sky130_fd_sc_hd__or2_2
assign \$61  = (\$94  | \$29 );

// X$2579 sky130_fd_sc_hd__nor2_2
assign \$143  = ~(\$139  | \$93 );

// X$2580 sky130_fd_sc_hd__nor2_2
assign \$151  = ~(\$46  | \$97 );

// X$2581 sky130_fd_sc_hd__o21a_2
assign \$209  = ((\$56  | \$17 ) & (\$31 ));

// X$2582 sky130_fd_sc_hd__o221a_2
assign \$180  = ((\$151  | \$150 ) & (\$148  | \$49 ) & (\$147 ));

// X$2583 sky130_fd_sc_hd__xor2_2
assign \$94  = (\$98  ^ \$143 );

// X$2584 sky130_fd_sc_hd__or3_2
assign \$157  = (\$49  | \$30  | \$131 );

// X$2586 sky130_fd_sc_hd__a21bo_2
assign \$166  = ((\$46  & \$54 ) | (~\$169 ));

// X$2587 sky130_fd_sc_hd__or3_2
assign \$227  = (\$56  | \$31  | \$17 );

// X$2588 sky130_fd_sc_hd__nor2_2
assign \$56  = ~(\$139  | \$126 );

// X$2589 sky130_fd_sc_hd__or2_2
assign \$126  = (\$348  | \$247 );

// X$2590 sky130_fd_sc_hd__and2_2
assign \$100  = (\$126  & \$29 );

// X$2591 sky130_fd_sc_hd__or4_2
assign \$205  = (\$49  | \$147  | \$306  | \$209 );

// X$2593 sky130_fd_sc_hd__xnor2_2
assign \$139  = ~(\$27  ^ \$78 );

// X$2594 sky130_fd_sc_hd__xnor2_2
assign \$46  = ~(\$98  ^ \$143 );

// X$2596 sky130_fd_sc_hd__a32o_2
assign \$956  = ((\$49  & \$57  & \$16 ) | (\$38  & \$169 ));

// X$2597 sky130_fd_sc_hd__o21a_2
assign \$311  = ((\$31  | \$97 ) & (\$61 ));

// X$2598 sky130_fd_sc_hd__nor2_2
assign \$30  = ~(\$35  | \$181 );

endmodule