#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                          Menu Info $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 1$y. Info Telkomsel Opok$wh"
echo -e "$yy 2$y. Info Exra Unli $wh"
echo -e "$yy 3$y. Info Contoh Payload Websocket Cloudflare$wh"
echo -e "$yy 4$y. Info Contoh Payload BENAR/SALAH $wh"
echo -e "$yy 5$y. Cek Info Injeck Tersedia $wh"
echo -e "$yy 6$y. Info Status Respon Injeck $wh"
echo -e "$yy 7$y. Menu$wh"
echo -e "$yy 8$y. Exit$wh"
echo -e "$y-------------------------------------------------------------$wh"
read -p "Select From Options [ 1 - 8 ] : " menuinfo
echo -e ""
case $menuinfo in
1)
info-tsel-opok
;;
2)
info-exra-unli
;;
3)
info-contohws
;;
4)
info-contoh-payload
;;
5)
info-cek-tersedia
;;
6)
clear
info-status-respon
;;
7)
clear
menu
;;
8)
clear
exit
;;
*)
clear
menu
;;
esac
