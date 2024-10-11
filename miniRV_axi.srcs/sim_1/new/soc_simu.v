`timescale 1ns / 1ps
`define TIME_OUT_THRESHOLD 160   // us

module soc_simu();

    reg         clock     = 1;
    reg         reset     = 1;
    reg  [23:0] switch    = 24'h123456;
    wire [31:0] led;
    reg  [31:0] led_r;
    reg  [31:0] iclk_cnt;
    reg  [31:0] rclk_cnt;
    reg  [31:0] wclk_cnt;
    reg  [37:1] test_mask = 37'h0;
    reg  [31:0] test_no   = 32'h25000001;
    real        time_label;
    reg  [31:0] ifetch_cnt;
    reg  [31:0] memRd_cnt;
    reg  [31:0] memWr_cnt;
    reg         ifetch_req_r;
    reg         ifetch_req_r1;
    real        ifetch_req_cnt = 0;
    real        icache_hit_cnt = 0;

`define MEM_INST DUT.U_mem.U_bram.inst.axi_mem_module.blk_mem_gen_v8_4_4_inst.memory

    initial begin
        #12 reset = 0;
    end
    
    always #5 clock = !clock;

    soc DUT (
        .clk_i  (clock),
        .rst_i  (reset),
        .sw_i   (switch),
        .led_o  (led)
    );

`ifdef ENABLE_ICACHE
    always @(posedge clock) begin
        if (led < 32'h25000018) begin
            if (DUT.U_cpu.U_icache.inst_rreq) begin
                iclk_cnt <= 32'h1;
                $display("取指地址：\t\t0x%8x", DUT.U_cpu.U_icache.inst_addr);
                $display("应取指令：\t\t0x%8x", `MEM_INST[DUT.U_cpu.U_icache.inst_addr[31:2]]);
            end else
                iclk_cnt <= iclk_cnt + 32'h1;

            if (DUT.U_cpu.U_icache.inst_valid) begin
                $display("实际取到的指令：0x%8x", DUT.U_cpu.U_icache.inst_out);
                $display("本次取指耗费的时钟数：%0d", iclk_cnt);
                if (`MEM_INST[DUT.U_cpu.U_icache.inst_addr[31:2]] != DUT.U_cpu.U_icache.inst_out) begin
                    $display("取指出错，请检查ICache逻辑");
                    $stop;
                end
                $display("--------- test_%02d ---------", led[5:0] + 1);
            end
        end
    end
`endif

`ifdef ENABLE_DCACHE
    wire        wmem_flag = DUT.U_cpu.U_dcache.data_wen & !DUT.U_cpu.U_dcache.uncached;
    wire        rmem_flag = DUT.U_cpu.U_dcache.data_ren & !DUT.U_cpu.U_dcache.uncached;
    reg         wmem_flag_r = 0;
    reg         rmem_flag_r = 0;
    reg  [31:0] wdata_r;
    reg  [31:0] waddr_r = 32'hFFFF_FFFF;
    always @(posedge clock) begin
        if (led < 32'h25000018) begin
            if (wmem_flag) begin
                wmem_flag_r <= 1;
                wdata_r     <= DUT.U_cpu.U_dcache.data_wdata;
                wclk_cnt    <= 32'h1;
                $display("写访存地址：\t0x%8x", DUT.U_cpu.U_dcache.data_addr);
                $display("写前内存数据：\t0x%8x", `MEM_INST[DUT.U_cpu.U_dcache.data_addr[31:2]]);
                $display("应写数据：\t\t0x%8x", DUT.U_cpu.U_dcache.data_wdata);
            end else
                wclk_cnt <= wclk_cnt + 32'h1;

            if (wmem_flag_r & DUT.U_cpu.U_dcache.data_wresp) begin
                wmem_flag_r <= 0;
                $display("写后内存数据：\t0x%8x", `MEM_INST[DUT.U_cpu.U_dcache.data_addr[31:2]]);
                $display("本次写访存耗费的时钟数：%0d", wclk_cnt);
                if (`MEM_INST[DUT.U_cpu.U_dcache.data_addr[31:2]] != wdata_r) begin
                    if ((DUT.U_cpu.U_dcache.U_dsram.douta[31:0] == wdata_r) ||
                        (DUT.U_cpu.U_dcache.U_dsram.douta[63:32] == wdata_r) ||
                        (DUT.U_cpu.U_dcache.U_dsram.douta[95:64] == wdata_r) ||
                        (DUT.U_cpu.U_dcache.U_dsram.douta[127:96] == wdata_r)) begin
                        waddr_r <= DUT.U_cpu.U_dcache.data_addr;
                        $display("检测到写操作已完成，且数据已写入DCache，但未写入内存");
                    end else
                        $display("写访存出错，请检查DCache的写逻辑");
                end
                $display("--------- test_%02d ---------", led[5:0] + 1);
            end
            
            if (DUT.U_mem.s_axi_bvalid) waddr_r <= 32'hFFFF_FFFF;

            if (rmem_flag) begin
                rmem_flag_r <= 1;
                rclk_cnt    <= 32'h1;
                $display("读访存地址：\t0x%8x", DUT.U_cpu.U_dcache.data_addr);
                if (DUT.U_cpu.U_dcache.data_addr == waddr_r) begin
                    $display("检测到该地址存在未完成的写操作");
                    $display("内存中的数据：\t0x%8x", `MEM_INST[DUT.U_cpu.U_dcache.data_addr[31:2]]);
                end else
                    $display("应读数据：\t\t0x%8x", `MEM_INST[DUT.U_cpu.U_dcache.data_addr[31:2]]);
            end else
                rclk_cnt <= rclk_cnt + 32'h1;

            if (rmem_flag_r & DUT.U_cpu.U_dcache.data_valid) begin
                rmem_flag_r <= 0;
                $display("实际读取的数据：0x%8x", DUT.U_cpu.U_dcache.data_rdata);
                $display("本次读访存耗费的时钟数：%0d", rclk_cnt);
                if (`MEM_INST[DUT.U_cpu.U_dcache.data_addr[31:2]] != DUT.U_cpu.U_dcache.data_rdata) begin                   
                    if ((DUT.U_cpu.U_dcache.data_addr == waddr_r) && (DUT.U_cpu.U_dcache.data_rdata == wdata_r)) begin
                        $display("数据已成功从DCache读取");
                    end else begin  
                        $display("读访存出错，请检查DCache的读逻辑");
                        $stop;
                    end
                    
                end
                $display("--------- test_%02d ---------", led[5:0] + 1);
            end
        end
    end
`endif

    always @(posedge clock) begin
        if (DUT.U_cpu.U_icache.inst_valid)
            ifetch_req_cnt <= ifetch_req_cnt + 1;
        
        ifetch_req_r  <= DUT.U_cpu.U_icache.inst_rreq;
        ifetch_req_r1 <= ifetch_req_r;
`ifdef ENABLE_ICACHE
        if ((ifetch_req_r & (ifetch_req_r == DUT.U_cpu.U_icache.hit)) ||
            (ifetch_req_r1 & (ifetch_req_r1 == DUT.U_cpu.U_icache.hit)))
            icache_hit_cnt <= icache_hit_cnt + 1;
`endif
    end

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            ifetch_cnt <= 32'h0;
            memRd_cnt <= 32'h0;
            memWr_cnt <= 32'h0;
        end else begin
            if (DUT.U_cpu.U_core.if_valid)
                ifetch_cnt <= ifetch_cnt + 32'h1;
            if (DUT.U_cpu.U_core.da_addr[31:16] != 16'hFFFF) begin
                if (|(DUT.U_cpu.U_core.da_ren))
                    memRd_cnt <= memRd_cnt + 32'h1;
                if (|(DUT.U_cpu.U_core.da_wen))
                    memWr_cnt <= memWr_cnt + 32'h1;
            end
        end
    end

    always @(posedge clock) begin
        if (led == test_no) begin
            if (!test_mask[led[5:0]]) begin
                test_mask[led[5:0]] <= 1'b1;
                test_no <= test_no + 32'h1;
                time_label <= $realtime/1000;
                
                $display("[%.03fus] test_%02d passed!", $realtime/1000, led[5:0]);
                if (led == 32'h25000018) begin
                    $display("*****************************************");
                    $display("* Congratulations! All tests passed!    *");
                    $display("*****************************************");
                    #1000
                    $display("Total: %0d instruction fetching, %0d memory access (%0d RDs and %0d WRs)", ifetch_cnt, memRd_cnt + memWr_cnt, memRd_cnt, memWr_cnt);
`ifdef ENABLE_ICACHE
                    $display("ICache hit rate: %.03f%%", icache_hit_cnt*100 / ifetch_req_cnt);
`endif
                    $finish;
                end
            end
        end

        // https://gitee.com/hitsz-cslab/cdp-tests/blob/miniRV/asm/start.dump
        // start.dump line_169 <fail>
        if (DUT.U_cpu.U_core.if_addr == 32'h270) begin
            $display("[err] test_%02d failed!", led[5:0] + 6'h1);
            $finish;
        end

        led_r <= led;
        if ((led_r == led) && ($realtime/1000 - time_label >= `TIME_OUT_THRESHOLD)) begin
            $display("[err] test_%02d timeout!", led[5:0] + 6'h1);
            $finish;
        end
    end

endmodule
