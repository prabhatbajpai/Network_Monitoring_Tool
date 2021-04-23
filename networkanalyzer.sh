#network analyzer

##Capturing Packets.
tcpdump -e -nn -c 1000 -n>packetfiles/All_Packets

##Seperating IP UDP ARP Packets

grep IPv4 packetfiles/All_Packets >packetfiles/IP_Packets
grep ARP packetfiles/All_Packets>packetfiles/ARP_Packets
grep UDP packetfiles/All_Packets>packetfiles/UDP_Packets


##Extracting different fields and saving them in seperate files.


cut -f1 -d " " packetfiles/IP_Packets > packetfiles/IP_Packets_timestamps
cut -f1 -d " " packetfiles/ARP_Packets > packetfiles/ARP_Packets_timestamps
cut -f1 -d " " packetfiles/UDP_Packets > packetfiles/UDP_Packets_timestamps


cut -f2 -d " " packetfiles/IP_Packets > packetfiles/IP_Packets_sMac
cut -f2 -d " " packetfiles/ARP_Packets > packetfiles/ARP_Packets_sMac
cut -f2 -d " " packetfiles/UDP_Packets > packetfiles/UDP_Packets_sMac


cut -f4 -d " " packetfiles/IP_Packets > packetfiles/IP_Packets_dmacs
cut -f4 -d " " packetfiles/ARP_Packets > packetfiles/ARP_Packets_dmacs
cut -f4 -d " " packetfiles/UDP_Packets > packetfiles/UDP_Packets_dmacs


cut -f1 -d "," packetfiles/IP_Packets_dmacs> packetfiles/IP_Packets_dmac
cut -f1 -d "," packetfiles/ARP_Packets_dmacs> packetfiles/ARP_Packets_dmac
cut -f1 -d "," packetfiles/UDP_Packets_dmacs> packetfiles/UDP_Packets_dmac


rm packetfiles/IP_Packets_dmacs
rm packetfiles/ARP_Packets_dmacs
rm packetfiles/UDP_Packets_dmacs


cut -f9 -d " " packetfiles/IP_Packets > packetfiles/IP_Packets_packetlengthss
cut -f9 -d " " packetfiles/ARP_Packets > packetfiles/ARP_Packets_packetlengthss
cut -f9 -d " " packetfiles/UDP_Packets > packetfiles/UDP_Packets_packetlengthss


cut -f10 -d " " packetfiles/IP_Packets > packetfiles/IP_Packets_sipp
cut -f12 -d " " packetfiles/ARP_Packets > packetfiles/ARP_Packets_sipp
cut -f10 -d " " packetfiles/UDP_Packets > packetfiles/UDP_Packets_sipp


cut -f12 -d " " packetfiles/IP_Packets > packetfiles/IP_Packets_dipp
cut -f14 -d " " packetfiles/ARP_Packets > packetfiles/ARP_Packets_dipp
cut -f12 -d " " packetfiles/UDP_Packets > packetfiles/UDP_Packets_dipp


cut -f5 -d "." packetfiles/IP_Packets_sipp > packetfiles/IP_Packets_sp
cut -f5 -d "." packetfiles/ARP_Packets_sipp > packetfiles/ARP_Packets_sp
cut -f5 -d "." packetfiles/UDP_Packets_sipp > packetfiles/UDP_Packets_sp


cut -f1,2,3,4 -d "." packetfiles/IP_Packets_sipp > packetfiles/IP_Packets_sip
cut -f1,2,3,4 -d "." packetfiles/ARP_Packets_sipp > packetfiles/ARP_Packets_sip
cut -f1,2,3,4 -d "." packetfiles/UDP_Packets_sipp > packetfiles/UDP_Packets_sip


cut -f5 -d "." packetfiles/IP_Packets_dipp > packetfiles/IP_Packets_dps
cut -f5 -d "." packetfiles/ARP_Packets_dipp > packetfiles/ARP_Packets_dps
cut -f5 -d "." packetfiles/UDP_Packets_dipp > packetfiles/UDP_Packets_dps


cut -f1,2,3,4 -d "." packetfiles/IP_Packets_dipp > packetfiles/IP_Packets_dip
cut -f1,2,3,4 -d "." packetfiles/ARP_Packets_dipp | cut -f1 -d "," > packetfiles/ARP_Packets_dip
cut -f1,2,3,4 -d "." packetfiles/UDP_Packets_dipp > packetfiles/UDP_Packets_dip


rm packetfiles/IP_Packets_dipp
rm packetfiles/ARP_Packets_dipp
rm packetfiles/UDP_Packets_dipp


rm packetfiles/IP_Packets_sipp
rm packetfiles/ARP_Packets_sipp
rm packetfiles/UDP_Packets_sipp


cut -f1 -d ":" packetfiles/IP_Packets_dps > packetfiles/IP_Packets_dp
cut -f1 -d ":" packetfiles/ARP_Packets_dps > packetfiles/ARP_Packets_dp
cut -f1 -d ":" packetfiles/UDP_Packets_dps > packetfiles/UDP_Packets_dp


rm packetfiles/IP_Packets_dps
rm packetfiles/UDP_Packets_dps


cut -f1 -d ":" packetfiles/IP_Packets_packetlengthss > packetfiles/IP_Packets_packetlength
cut -f1 -d ":" packetfiles/ARP_Packets_packetlengthss > packetfiles/ARP_Packets_packetlength
cut -f1 -d ":" packetfiles/UDP_Packets_packetlengthss > packetfiles/UDP_Packets_packetlength


rm packetfiles/IP_Packets_packetlengthss
rm packetfiles/ARP_Packets_packetlengthss
rm packetfiles/UDP_Packets_packetlengthss


##combining all fields

paste packetfiles/ARP_Packets_sMac packetfiles/ARP_Packets_dmac packetfiles/ARP_Packets_sip packetfiles/ARP_Packets_dip packetfiles/ARP_Packets_sp packetfiles/ARP_Packets_dp packetfiles/ARP_Packets_timestamps packetfiles/ARP_Packets_packetlength | column -s $'\t' -t >packetfiles/ARP_finals
paste packetfiles/IP_Packets_sMac packetfiles/IP_Packets_dmac packetfiles/IP_Packets_sip packetfiles/IP_Packets_dip packetfiles/IP_Packets_sp packetfiles/IP_Packets_dp packetfiles/IP_Packets_timestamps packetfiles/IP_Packets_packetlength | column -s $'\t' -t >packetfiles/IP_final
paste packetfiles/ARP_Packets_sMac packetfiles/ARP_Packets_dmac packetfiles/ARP_Packets_sip packetfiles/ARP_Packets_dip packetfiles/ARP_Packets_timestamps packetfiles/ARP_Packets_packetlength | column -s $'\t' -t >packetfiles/ARP_final
paste packetfiles/UDP_Packets_sMac packetfiles/UDP_Packets_dmac packetfiles/UDP_Packets_sip packetfiles/UDP_Packets_dip packetfiles/UDP_Packets_sp packetfiles/UDP_Packets_dp packetfiles/UDP_Packets_timestamps packetfiles/UDP_Packets_packetlength | column -s $'\t' -t >packetfiles/UDP_final


cat packetfiles/IP_final packetfiles/ARP_finals packetfiles/UDP_final > packetfiles/All_final;


##Updating database
mysql  -e "
DROP database if exists PACKETS;
CREATE DATABASE PACKETS;
GRANT ALL PRIVILEGES ON PACKETS.* TO 'devansh'@'localhost';
DROP TABLE if exists PACKETS.IP ;
DROP TABLE if exists PACKETS.ARP ;
DROP TABLE if exists PACKETS.UDP ;
DROP TABLE if exists PACKETS.ALLP ;
create table PACKETS.IP(SourceMac varchar(500),DestMac varchar(500),SourceIP varchar(500),DestIP varchar(500), SourcePort varchar(500), DestPort varchar(500), TimeStamp varchar(500), PacketLength varchar(500));
create table PACKETS.ARP(SourceMac varchar(500),DestMac varchar(500),SourceIP varchar(500),DestIP varchar(500), TimeStamp varchar(500), PacketLength varchar(500));
create table PACKETS.UDP(SourceMac varchar(500),DestMac varchar(500),SourceIP varchar(500),DestIP varchar(500), SourcePort varchar(500), DestPort varchar(500), TimeStamp varchar(500), PacketLength varchar(500));
create table PACKETS.ALL(SourceMac varchar(500),DestMac varchar(500),SourceIP varchar(500),DestIP varchar(500), SourcePort varchar(500), DestPort varchar(500), TimeStamp varchar(500), PacketLength varchar(500));
LOAD DATA LOCAl INFILE '/var/www/html/networkanalyzer/packetfiles/IP_final' INTO TABLE PACKETS.IP;
LOAD DATA LOCAl INFILE '/var/www/html/networkanalyzer/packetfiles/ARP_final' INTO TABLE PACKETS.ARP;
LOAD DATA LOCAl INFILE '/var/www/html/networkanalyzer/packetfiles/UDP_final' INTO TABLE PACKETS.UDP;
LOAD DATA LOCAl INFILE '/var/www/html/networkanalyzer/packetfiles/All_final' INTO TABLE PACKETS.ALL;";


##the end
