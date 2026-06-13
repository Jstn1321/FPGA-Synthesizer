// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Fri Jun 12 21:27:46 2026
// Host        : DESKTOP-LVTV4RD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Nerd
//               Projects/FPGA-Projects/Synth/Synth.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v}
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [6:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [6:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "7" *) 
  (* C_ADDRB_WIDTH = "7" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.375199 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "128" *) 
  (* C_READ_DEPTH_B = "128" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "128" *) 
  (* C_WRITE_DEPTH_B = "128" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[6:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[6:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2025.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
YqH9kwIC39+qbZg4PSfFsXuB9k9wnuxNryS/CfnEri6Ci9fSC6fsrQ/T/hnt3u/yolbJ8DJa1Qu6
Qnm24A9jLbA+fu3Nsmm6/rM6a4vU6OfVl/gTFd/CiWDutv6Dhn6Lim4uUNPahoOR/A2Yc4Zo2tdI
kMLO9gn9WlH2l3O2oXs=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XJYO2VHd/cnMxQd3i7/2qRhl57dl+doEKuhAunQyv3vpGRG/jlNxj8PqrgLoF0HMdqE3qJUVE/oq
kBSapqjVjLDMOrNGQ+Tc6VGsKMZH8FE/TXHQJ/IM5Iuiu2eozEwwVUomF+7cfqn+9OsVsqCONQ1M
g0oRlangiqasJDhhMfnlGGqwAwmgWRGQA6dmhTuua1s8zdvIv540zY6p5au8cAKVhqyyKK7wbxEE
SGuFqX+NYoyRV+rfWCcWM+hJEmnWS8LNAKkd13YE2+17sPYzUdZ23DmTxXK6KlAxKFW27CBySUfg
qdNXp2DSs2KAQYih27pBNMuHfGbM/ATFPWFvxg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
lYoEi/e8HsDTz6N11EDe/B/iitERmeYndlCklmCluwgb0N4W80JUGVlkd7NlRZHRNhxaNBJPkcjC
n61nO0tb17NwsMwjbY5TF8JWRYTNw1JXCFacvQYrdKv4/7QNQEtwVGiCLxFhOA8aHlWMZIrc2fri
VRMVWaEBcPwCGorlVIM=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QEw9fEsWFbdX0OQLvYs/gl+zyEOW3ak9TdQVaq+0AXXOT3LIqF7wDxJ6ZBnlf9mNbdsUVH5tAz1o
H8u7ihJl1L3THEvugW+TS8hkvVbEA9rKO2vV15KAj4Lla7UdFT/xDfe79RFarlLI7yGrubjgdoRi
QWy//UKsffG7IWNwmoSuppWiWB4ZHJtkunNyIkm70JPGyZF62VxJg1MTT+5LUbZG5vZjjuHZud9w
xJaKv1tFP/x8RVqLU5gPOqGqTW7/nKO2S+450Vo4D9vAmBVVcXpaL1EbSmCvQ+qJmcQKtf9qYFRV
Zko08hbpHjPxstqvTDro01jRzB8592m4xU2TWA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TC7q853CWBPPJgbRfgDV1lmjUwSAtliljShAyNFg8sfRfwDzchthzoSPH1UCHV++E2JXacEKq1lB
UWsNP92U4Xh0/Gu+6esOI0pJb8I+TRTxyBN1I4cRQEfQHcwfhbSdeH3yX9OV3opLEqYmT37hWU+J
zCawYnxVESI0FtRzEXve9gdEWlrKKckrT/hp4mvxxOjvOkOSQBvy0elgUOqh6mEOZl+JnUbsR+Wm
CoZLE1eefMZy3FnVmyDNPv3JPXi88aLXMyimal0MYFkTiS4XJiGT3eAIMIbksehXY+eYi/KFpZWQ
GHpX+lG3UmiWWLwyPakFwKEHbrBc70AlJ2eV9g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2025.1-2029.x", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
j9nmCKgjPWNChPbpSW6EWLrMA6oCG2JGPoum8px09v0PEAh0DRXZi0J8HPzXUsZgOEMcKpA7X54u
YFcDDCLAQ+urha/eSPbQYHQh4yGCursxAQ1C6LEyNQ2wJ0eLlO2bJeAl/gof06zqsYVM2lLJVNv5
wao1k2bmgPdfpfY3c9vPD0fSMuZPS41EoRS0cQhO5GTZnKdjxm6tEUL3GnTjB8ynSCIbCJUsMtAX
4FRHNa52gudx5B5fagR+lXgFhE7e++rWTJELr7SYB+r5Es8qZLTpCH8TrQxEkV0rY/+e4sAjNE2D
gHw8GD7VcUtc15B8y1BbVmh29qc8Nd3V2i/miA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UkCD6I/Vye4qNoNoa3hIexBXG3xyKUJPAHAjIo7UcNVCDXpMQiYEtPDqExZMfiPlJn2nswCYIfIJ
FYWqMCloKSQyyI/7yZ2EtbyWEklb/P5IyZyvGi6hhFUo/JFTb12b4bK0gZPr+bCDdlVQKTx5GVHz
wptdUJO2omSj8axVMPbLRRtVzlJIZ29dTJ2ATXVXAcBxPnFfHRAMnYYKLeeLExX61vQvpqrkLQHm
XG7hpVzJi56gYKAzxa2BLq072OCVpVS70bfWlhlSTVcSlCrUf+EcarEk4FD8+Ih2NCvrqremG6yn
TtcBn8Xr8M/6zhOYvLi6AD6eArDMKA8n+Ccv8A==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
A5y5QVZU8yjPexRVPioSiAGohCHD5DX5FVobuMyhcgQRExLUhPvnnS8HOtxTj/2IapEcz68gFMGG
Hpi+m725u85/om/Vze9pGIW9Mn328Kz2FIg3W5EvGstfGwY+48LiAGAmTR269JS4lJGVYWYOz7Xk
S8cEsFd2m7j8iyKtARJzD90+UdXq/cIIh725jC9i8nbgxB364zddvm1Z/DF3JRw1qFp6GGcuRai1
KNcJ1j8c9wtIgktpsteU3e5+bxHEw8NT3gWXUFYjm00NDq97Jals8Jjktmum2nQxoF7ivPacfEey
gnSF6jRMkTsZObzc30hAhs0CEtc33hZLhPLHSn8pQ0WyvKJLHdd5s2yckgTZtqxC1Sbwe7WEgNXe
ZMX3pIkz+aoXsAL7GBLyVBMVQcyMoF0w8QGAaTe8sqatABwPqXidYRqNROTf62IYcMpV89XYgaTv
EwIn/oni9KOFd2BFVxRZbFGGC4IjvigsTBUijI+Dk6kVnDh240clGcc4

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Omtp+lCaqUx7Z4qdFj2zrN8LpCkit2eX4hlMtig+ielGm/x4FSZkpjoFmiqdKFPi2eg0pg09MSai
XyGH68UzAR7Xrj8f1jlIoUmMKp4GcxfdqfTeuu7kWGOJEP6cvgTjSJFj2gawDv7f4yZcltnK2x0L
e4GW/rBTmGvZtKWb2ahjINLxPuh3dDaSaWdb+zVgbtyrI5FrjxBkq+aOxSjyNsqnCx1L0uWbxnkl
88NbXN3dTaECXHNm/fsleayM5hKis7kTv9BFajJMGy+BhQlmIYpE+F5zchnTTFUFJZCz1sX9Fc8e
HcY7irB8mR3ajdzjUZLBQEMktp096Nheq3U75A==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
hpeBLwN9x2ZFDwroYLlUe5GjjDepHik2l0c2s3/6S7JPCRkzQSyt2V1Ad/JewAs/QNp5SXSbYYB4
rQl0My1LDMF3xw43r0g2IbcyHVpPhGp0W5msuQdF67afnsRv90iJYWLMI3QkYGCTWAzl4HrLxFSg
3z8XZRK670IcxznOrlvgHmIKsvubZrBkuc1EynrVb9Nw16QnIx2rc4WgcEXeFf+4i1RoYLDd3gXK
NFCNMdtaRYUThunFP6Z4ViZ5UnDmKq+IMhd31jTaqIlWOBDxPI1+v5RJYxIyTbn4rxlKR2fNbl5/
z4OUjBTd+1GH3I2OXlqmAOvIhpe2Z2HH7nZu/A==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Mt2RhTSUwEIEWeNARbyL+EdfS1UF6nPaL/fKl/7oO2gina93egwCWDLl1fbBtkfaPco0cu4MJ9K3
OraAsyHRlY+MNShmJ1LzAIA1LjZx4y55lu9dlQqSUXR7AW7wVbkg1864mK+hM/1XygU0jvebKNW9
B7xSER+asLO6pxi0mt7uC2PHxLPAYEszFhmnap82TtbDGdQ2qtyekY+ngs+N2fAdsblxVwJruiMl
e6XJ127M8N1mYwhWU2HtRpBOSnnKoHgD9fG51XK/rhk8DxT66QnX9uLPB+H25eDupBJGi1Y5o6x8
hOwZiSUVlBLh7brfzevh7+eRn+7es6wBas0+3w==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19168)
`pragma protect data_block
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
14TU18Nsldl2xAFqWzAGyQ==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
