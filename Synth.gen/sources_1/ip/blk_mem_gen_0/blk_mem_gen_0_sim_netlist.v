// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Thu Jun 25 20:41:54 2026
// Host        : DESKTOP-LVTV4RD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [6:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [6:0]addra;
  wire clka;
  wire [31:0]douta;
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
  (* C_HAS_ENA = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_2.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_2.mif" *) 
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
        .ena(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18608)
`pragma protect data_block
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
/HGi84WXC3YHbHq8er7WWQx9iMZLKaIRxLw=
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
