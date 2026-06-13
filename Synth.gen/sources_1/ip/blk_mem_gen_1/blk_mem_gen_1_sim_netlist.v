// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Fri Jun 12 21:56:53 2026
// Host        : DESKTOP-LVTV4RD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Nerd
//               Projects/FPGA-Projects/Synth/Synth.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v}
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_12,Vivado 2025.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [15:0]douta;
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
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7096 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
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
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_12 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19920)
`pragma protect data_block
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
GuZYHzbxdyWUqkKQEHG2CpWShsTG6ASvmCwr
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
