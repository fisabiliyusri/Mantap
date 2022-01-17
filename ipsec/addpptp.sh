#!/bin/bash
# My Telegram : https://t.me/Akbar218
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
IZIN=$( curl https://raw.githubusercontent.com/senowahyu62/perizinan/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/lis.tio.718"
echo -e "${NC}${LIGHT}WhatsApp : 081545854516"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Akbar218"
exit 0
fi
clear
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(wget -qO- ipinfo.io/ip);
else
PUBLIC_IP=$IP
fi
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username : " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/akbarstorevpn/data-user-pptp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${VPN_USER}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Password : " VPN_PASSWORD
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear

# Add or update VPN user
cat >> /etc/ppp/chap-secrets <<EOF
"$VPN_USER" pptpd "$VPN_PASSWORD" *
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets*
echo -e "### $VPN_USER $exp">>"/var/lib/akbarstorevpn/data-user-pptp"
cat <<EOF

============================
PPTP VPN
============================
IP/Host   : $PUBLIC_IP
Domain    : $domain
Username  : $VPN_USER
Password  : $VPN_PASSWORD
Created   : $hariini
Expired   : $exp
============================
Script By Akbar Maulana
EOF