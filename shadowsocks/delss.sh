#!/bin/bash
# SL
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/shadowsocks-libev/akun.conf")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Pilih salah satu[1]: " CLIENT_NUMBER
		else
			read -rp "Pilih salah satu [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
# match the selected number to a client name
CLIENT_NAME=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2-3 | sed -n "${CLIENT_NUMBER}"p)
user=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/shadowsocks-libev/akun.conf" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# remove [Peer] block matching $CLIENT_NAME
sed -i "/^### $user $exp/,/^port_http/d" "/etc/shadowsocks-libev/akun.conf"
# remove generated client file
service cron restart
systemctl disable shadowsocks-libev-server@$user-tls.service
systemctl disable shadowsocks-libev-server@$user-http.service
systemctl stop shadowsocks-libev-server@$user-tls.service
systemctl stop shadowsocks-libev-server@$user-http.service
# disable
systemctl disable shadowsocks-libev-server@$user-tls.service
systemctl disable shadowsocks-libev-server@$user-http.service
systemctl disable shadowsocks-libev-server@$user-v2rayws.service
systemctl disable shadowsocks-libev-server@$user-v2raywss.service
systemctl disable shadowsocks-libev-server@$user-v2rayquic.service
systemctl disable shadowsocks-libev-server@$user-v2raygrpc.service
systemctl disable shadowsocks-libev-server@$user-xrayws.service
systemctl disable shadowsocks-libev-server@$user-xraywss.service
systemctl disable shadowsocks-libev-server@$user-xraygrpctls.service
systemctl disable shadowsocks-libev-server@$user-xraygrpchttp.service
systemctl disable shadowsocks-libev-server@$user-xrayquic.service
systemctl disable shadowsocks-libev-server@$user-gostls.service
systemctl disable shadowsocks-libev-server@$user-gostmtls.service
systemctl disable shadowsocks-libev-server@$user-gostxtls.service
systemctl disable shadowsocks-libev-server@$user-gostgrpc.service
systemctl disable shadowsocks-libev-server@$user-gostws.service
systemctl disable shadowsocks-libev-server@$user-gostwss.service
systemctl disable shadowsocks-libev-server@$user-gostmws.service
systemctl disable shadowsocks-libev-server@$user-gostmwss.service
systemctl disable shadowsocks-libev-server@$user-gostquic.service
systemctl disable shadowsocks-libev-server@$user-gosth2.service
# stop
systemctl stop shadowsocks-libev-server@$user-tls.service
systemctl stop shadowsocks-libev-server@$user-http.service
systemctl stop shadowsocks-libev-server@$user-v2rayws.service
systemctl stop shadowsocks-libev-server@$user-v2raywss.service
systemctl stop shadowsocks-libev-server@$user-v2rayquic.service
systemctl stop shadowsocks-libev-server@$user-v2raygrpc.service
systemctl stop shadowsocks-libev-server@$user-xrayws.service
systemctl stop shadowsocks-libev-server@$user-xraywss.service
systemctl stop shadowsocks-libev-server@$user-xraygrpctls.service
systemctl stop shadowsocks-libev-server@$user-xraygrpchttp.service
systemctl stop shadowsocks-libev-server@$user-xrayquic.service
systemctl stop shadowsocks-libev-server@$user-gostls.service
systemctl stop shadowsocks-libev-server@$user-gostmtls.service
systemctl stop shadowsocks-libev-server@$user-gostxtls.service
systemctl stop shadowsocks-libev-server@$user-gostgrpc.service
systemctl stop shadowsocks-libev-server@$user-gostws.service
systemctl stop shadowsocks-libev-server@$user-gostwss.service
systemctl stop shadowsocks-libev-server@$user-gostmws.service
systemctl stop shadowsocks-libev-server@$user-gostmwss.service
systemctl stop shadowsocks-libev-server@$user-gostquic.service
systemctl stop shadowsocks-libev-server@$user-gosth2.service
# hapus akun
rm -f "/etc/shadowsocks-libev/$user-tls.json"
rm -f "/etc/shadowsocks-libev/$user-http.json"
rm -f "/etc/shadowsocks-libev/$user-v2rayws.json"
rm -f "/etc/shadowsocks-libev/$user-v2raywss.json"
rm -f "/etc/shadowsocks-libev/$user-v2rayquic.json"
rm -f "/etc/shadowsocks-libev/$user-v2raygrpc.json"
rm -f "/etc/shadowsocks-libev/$user-xrayws.json"
rm -f "/etc/shadowsocks-libev/$user-xraywss.json"
rm -f "/etc/shadowsocks-libev/$user-xraygrpctls.json"
rm -f "/etc/shadowsocks-libev/$user-xraygrpchttp.json"
rm -f "/etc/shadowsocks-libev/$user-xrayquic.json"
rm -f "/etc/shadowsocks-libev/$user-gosttls.json"
rm -f "/etc/shadowsocks-libev/$user-gostmtls.json"
rm -f "/etc/shadowsocks-libev/$user-gostxtls.json"
rm -f "/etc/shadowsocks-libev/$user-gostgrpc.json"
rm -f "/etc/shadowsocks-libev/$user-gostws.json"
rm -f "/etc/shadowsocks-libev/$user-gostwss.json"
rm -f "/etc/shadowsocks-libev/$user-gostmws.json"
rm -f "/etc/shadowsocks-libev/$user-gostmwss.json"
rm -f "/etc/shadowsocks-libev/$user-gostquic.json"
rm -f "/etc/shadowsocks-libev/$user-gosth2.json"
rm -f "/home/vps/public_html/$user.json"
clear
echo ""
echo "==========================="
echo "  SS OBFS Account Deleted  "
echo "==========================="
echo "Username  : $user"
echo "Expired   : $exp"
echo "==========================="
echo "Script Mod By SL"
