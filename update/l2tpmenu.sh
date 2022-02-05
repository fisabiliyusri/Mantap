#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"
echo -e "$y                             L2TP $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 1$y. Create Account L2TP"
echo -e "$yy 2$y. Delete Account L2TP"
echo -e "$yy 3$y. Extending Account L2TP Active Life"
echo -e "$yy 4$y. Menu"
echo -e "$yy 5$y. Exit"
echo -e "$y-------------------------------------------------------------$wh"
read -p "Select From Options [ 1 - 7 ] : " menu
echo -e ""
case $menu in
1)
addl2tp
;;
2)
dell2tp
;;
3)
renewl2tp
;;
4)
clear
menu
;;
5)
clear
exit
;;
*)
clear
menu
;;
esac
