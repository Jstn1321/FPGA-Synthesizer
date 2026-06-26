// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
// Date        : Thu Jun 25 21:20:14 2026
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
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [15:0]douta;
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
        .ena(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19648)
`pragma protect data_block
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
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
