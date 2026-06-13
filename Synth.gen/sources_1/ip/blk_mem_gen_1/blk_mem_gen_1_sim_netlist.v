// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Fri Jun 12 18:44:41 2026
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
  blk_mem_gen_1blk_mem_gen_v8_4_12 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19904)
`pragma protect data_block
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
yCzVag7/Z/xM1gQ=
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
