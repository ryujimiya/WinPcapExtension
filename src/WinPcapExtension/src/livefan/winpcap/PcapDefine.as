package livefan.winpcap
{
    
    /**
     *
     * @author Owner
     */
    public class PcapDefine
    {
        // pcap.h
        public static const PCAP_IF_LOOPBACK:uint = 0x00000001;
        public static const MODE_CAPT:int = 0;
        public static const MODE_STAT:int = 1;
        public static const MODE_MON:int = 2;
        // remote-ext.h
        public static const PCAP_SRC_FILE:int = 2;
        public static const PCAP_SRC_IFLOCAL:int = 3;
        public static const PCAP_SRC_IFREMOTE:int = 4;
        public static const PCAP_SRC_FILE_STRING:String = "file://";
        public static const PCAP_SRC_IF_STRING:String = "rpcap://";
        public static const PCAP_OPENFLAG_PROMISCUOUS:int = 1;
        public static const PCAP_OPENFLAG_DATATX_UDP:int = 2;
        public static const PCAP_OPENFLAG_NOCAPTURE_RPCAP:int = 4;
        public static const PCAP_OPENFLAG_NOCAPTURE_LOCAL:int = 8;
        public static const PCAP_OPENFLAG_MAX_RESPONSIVENESS:int = 16;
        // bpf.h
        public static const DLT_NULL:int = 0; // BSD loopback encapsulation
        public static const DLT_EN10MB:int = 1; // Ethernet (10Mb)
        public static const DLT_EN3MB:int = 2; // Experimental Ethernet (3Mb)
        public static const DLT_AX25:int = 3; // Amateur Radio AX.25
        public static const DLT_PRONET:int = 4; // Proteon ProNET Token Ring
        public static const DLT_CHAOS:int = 5; // Chaos
        public static const DLT_IEEE802:int = 6; // 802.5 Token Ring
        public static const DLT_ARCNET:int = 7; // ARCNET, with BSD-style header
        public static const DLT_SLIP:int = 8; // Serial Line IP
        public static const DLT_PPP:int = 9; // Point-to-point Protocol
        public static const DLT_FDDI:int = 10; // FDDI
        public static const DLT_ATM_RFC1483:int = 11; // LLC-encapsulated ATM
        public static const DLT_RAW:int = 12; // raw IP
        public static const DLT_SLIP_BSDOS:int = 15; // BSD/OS Serial Line IP
        public static const DLT_PPP_BSDOS:int = 16; // BSD / OS Point - to - point Protocol
        public static const DLT_ATM_CLIP:int = 19; // Linux Classical-IP over ATM
        public static const DLT_REDBACK_SMARTEDGE:int = 32;
        public static const DLT_PPP_SERIAL:int = 50; // PPP over serial with HDLC encapsulation
        public static const DLT_PPP_ETHER:int = 51; // PPP over Ethernet
        public static const DLT_SYMANTEC_FIREWALL:int = 99;
        public static const DLT_C_HDLC:int = 104; // Cisco HDLC
        public static const DLT_IEEE802_11:int = 105; // IEEE 802.11 wireless
        public static const DLT_FRELAY:int = 107;
        public static const DLT_LOOP:int = 108;
        public static const DLT_ENC:int = 109;
        public static const DLT_LINUX_SLL:int = 113;
        public static const DLT_LTALK:int = 114;
        public static const DLT_ECONET:int = 115;
        public static const DLT_IPFILTER:int = 116;
        public static const DLT_PFLOG:int = 117;
        public static const DLT_CISCO_IOS:int = 118;
        public static const DLT_PRISM_HEADER:int = 119;
        public static const DLT_AIRONET_HEADER:int = 120;
        public static const DLT_HHDLC:int = 121;
        public static const DLT_IP_OVER_FC:int = 122;
        public static const DLT_SUNATM:int = 123; // Solaris+SunATM
        public static const DLT_RIO:int = 124; // RapidIO
        public static const DLT_PCI_EXP:int = 125; // PCI Express
        public static const DLT_AURORA:int = 126; // Xilinx Aurora link layer
        public static const DLT_IEEE802_11_RADIO:int = 127; // 802.11 plus radiotap radio header
        public static const DLT_TZSP:int = 128; // Tazmen Sniffer Protocol
        public static const DLT_ARCNET_LINUX:int = 129; // ARCNET
        public static const DLT_JUNIPER_MLPPP:int = 130;
        public static const DLT_JUNIPER_MLFR:int = 131;
        public static const DLT_JUNIPER_ES:int = 132;
        public static const DLT_JUNIPER_GGSN:int = 133;
        public static const DLT_JUNIPER_MFR:int = 134;
        public static const DLT_JUNIPER_ATM2:int = 135;
        public static const DLT_JUNIPER_SERVICES:int = 136;
        public static const DLT_JUNIPER_ATM1:int = 137;
        public static const DLT_APPLE_IP_OVER_IEEE1394:int = 138;
        public static const DLT_MTP2_WITH_PHDR:int = 139; // pseudo-header with various info, followed by MTP2
        public static const DLT_MTP2:int = 140; // MTP2, without pseudo-header
        public static const DLT_MTP3:int = 141; // MTP3, without pseudo-header or MTP2
        public static const DLT_SCCP:int = 142; // SCCP, without pseudo-header or MTP2 or MTP3
        public static const DLT_DOCSIS:int = 143;
        public static const DLT_LINUX_IRDA:int = 144;
        public static const DLT_IBM_SP:int = 145;
        public static const DLT_IBM_SN:int = 146;
        public static const DLT_USER0:int = 147;
        public static const DLT_USER1:int = 148;
        public static const DLT_USER2:int = 149;
        public static const DLT_USER3:int = 150;
        public static const DLT_USER4:int = 151;
        public static const DLT_USER5:int = 152;
        public static const DLT_USER6:int = 153;
        public static const DLT_USER7:int = 154;
        public static const DLT_USER8:int = 155;
        public static const DLT_USER9:int = 156;
        public static const DLT_USER10:int = 157;
        public static const DLT_USER11:int = 158;
        public static const DLT_USER12:int = 159;
        public static const DLT_USER13:int = 160;
        public static const DLT_USER14:int = 161;
        public static const DLT_USER15:int = 162;
        public static const DLT_IEEE802_11_RADIO_AVS:int = 163; // 802.11 plus AVS radio header
        public static const DLT_JUNIPER_MONITOR:int = 164;
        public static const DLT_BACNET_MS_TP:int = 165;
        public static const DLT_PPP_PPPD:int = 166;
        public static const DLT_JUNIPER_PPPOE:int = 167;
        public static const DLT_JUNIPER_PPPOE_ATM:int = 168;
        public static const DLT_GPRS_LLC:int = 169; // GPRS LLC
        public static const DLT_GPF_T:int = 170; // GPF-T (ITU-T G.7041/Y.1303)
        public static const DLT_GPF_F:int = 171; // GPF-F (ITU-T G.7041/Y.1303)
        public static const DLT_GCOM_T1E1:int = 172;
        public static const DLT_GCOM_SERIAL:int = 173;
        public static const DLT_JUNIPER_PIC_PEER:int = 174;
        public static const DLT_ERF_ETH:int = 175; // Ethernet
        public static const DLT_ERF_POS:int = 176; // Packet-over-SONET
        public static const DLT_LINUX_LAPD:int = 177;
        public static const DLT_JUNIPER_ETHER:int = 178;
        public static const DLT_JUNIPER_PPP:int = 179;
        public static const DLT_JUNIPER_FRELAY:int = 180;
        public static const DLT_JUNIPER_CHDLC:int = 181;
        public static const DLT_MFR:int = 182;
        public static const DLT_JUNIPER_VP:int = 183;
        public static const DLT_A429:int = 184;
        public static const DLT_A653_ICM:int = 185;
        public static const DLT_USB:int = 186;
        public static const DLT_BLUETOOTH_HCI_H4:int = 187;
        public static const DLT_IEEE802_16_MAC_CPS:int = 188;
        public static const DLT_USB_LINUX:int = 189;
        public static const DLT_CAN20B:int = 190;
        public static const DLT_IEEE802_15_4_LINUX:int = 191;
        public static const DLT_PPI:int = 192;
        public static const DLT_IEEE802_16_MAC_CPS_RADIO:int = 193;
        public static const DLT_JUNIPER_ISM:int = 194;
        public static const DLT_IEEE802_15_4:int = 195;
        public static const DLT_SITA:int = 196;
        public static const DLT_ERF:int = 197;
        public static const DLT_RAIF1:int = 198;
        public static const DLT_IPMB:int = 199;
        public static const DLT_JUNIPER_ST:int = 200;
        public static const DLT_BLUETOOTH_HCI_H4_WITH_PHDR:int = 201;
        public static const DLT_AX25_KISS:int = 202;
        public static const DLT_LAPD:int = 203;
        public static const DLT_PPP_WITH_DIR:int = 204; // PPP - don't confuse with DLT_PPP_WITH_DIRECTION
        public static const DLT_C_HDLC_WITH_DIR:int = 205; // Cisco HDLC
        public static const DLT_FRELAY_WITH_DIR:int = 206; // Frame Relay
        public static const DLT_LAPB_WITH_DIR:int = 207; // LAPB
        public static const DLT_IPMB_LINUX:int = 209;
        public static const DLT_FLEXRAY:int = 210;
        public static const DLT_MOST:int = 211;
        public static const DLT_LIN:int = 212;
        public static const DLT_X2E_SERIAL:int = 213;
        public static const DLT_X2E_XORAYA:int = 214;
        public static const DLT_IEEE802_15_4_NONASK_PHY:int = 215;    
    }

}