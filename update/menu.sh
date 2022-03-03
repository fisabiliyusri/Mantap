#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                  MENU UTAMA $wh"
echo -e "$y-------------------------------------------------$wh"
echo -e "$yy 1$y.  SSH & OpenVPN MENU  $wh"
echo -e "$yy 2$y.  L2TP MENU$wh"
echo -e "$yy 3$y.  PPTP MENU$wh"
echo -e "$yy 4$y.  SSTP MENU$wh"
echo -e "$yy 5$y.  WIREGUARD MENU$wh"
echo -e "$yy 6$y.  SHADOWSOCKS MENU$wh"
echo -e "$yy 7$y.  SHADOWSOCKSR MENU$wh"
echo -e "$yy 8$y.  VMESS MENU$wh"
echo -e "$yy 9$y.  VLESS MENU$wh"
echo -e "$yy 10$y. TROJAN GFW MENU$wh"
echo -e "$yy 11$y. TROJAN GO MENU$wh"
echo -e "$yy 12$y. GRPC MENU$wh"
echo -e "$yy 13$y. SLOWDNS MENU$wh"
echo -e "$yy 14$y. CEK SEMUA IP PORT$wh"
echo -e "$yy 15$y. CEK SEMUA SERVICE VPN$wh"
echo -e "$yy 16$y. UPDATE MENU$wh"
echo -e "$yy 17$y. SL Menu(Perbaiki Error SSLH+WS)$wh"
echo -e "$yy 18$y. Settings$wh"
echo -e "$yy 19$y. Exit$wh"
echo -e "$y-------------------------------------------------$wh"
read -p "Select From Options [ 1 - 19 ] : " menu
case $menu in
1)
clear
sshovpnmenu
;;
2)
clear
l2tpmenu
;;
3)
clear
pptpmenu
;;
4)
clear
sstpmenu
;;
5)
clear
wgmenu
;;
6)
clear
ssmenu
;;
7)
clear
ssrmenu
;;
8)
clear
vmessmenu
;;
9)
clear
vlessmenu
;;
10)
clear
trmenu
;;
11)
clear
trgomenu
;;
12)
clear
grpcmenu
;;
13)
clear
slowdnsmenu
;;
14)
clear
ipsaya
;;
15)
clear
running
;;
16)
clear
updatemenu
;;
17)
clear
sl-fix
;;
18)
clear
setmenu
;;
19)
clear
exit
;;
*)
clear
menu
;;
esac
