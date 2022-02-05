#!/bin/bash
#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                   SYSTEM SETTING$wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 1$y.  Add Or Change Subdomain Host For VPS"
echo -e "$yy 2$y.  Change Port Of Some Service"
echo -e "$yy 3$y.  Autobackup Data VPS"
echo -e "$yy 4$y.  Backup Data VPS"
echo -e "$yy 5$y.  Restore Data VPS"
echo -e "$yy 6$y.  Webmin Menu"
echo -e "$yy 7$y.  Limit Bandwith Speed Server"
echo -e "$yy 8$y.  Check Usage of VPS Ram"
echo -e "$yy 9$y.  Reboot VPS"
echo -e "$yy 10$y. Speedtest VPS"
echo -e "$yy 11$y. Displaying System Information"
echo -e "$yy 12$y. Info Script Auto Install"
echo -e "$yy 13$y. Menu"
echo -e "$yy 14$y. Exit"
echo -e "$y-------------------------------------------------------------$wh"
echo -e ""
read -p "Select From Options [ 1 - 60 ] : " menu
echo -e ""
case $menu in
1)
addhost
;;
2)
changeport
;;
3)
autobackup
;;
4)
backup
;;
5)
restore
;;
6)
wbmn
;;
7)
limitspeed
;;
8)
ram
;;
9)
reboot
;;
10)
speedtest
;;
11)
info
;;
12)
about
;;
13)
clear
menu
;;
14)
clear
exit
;;
*)
clear
menu
;;
esac
