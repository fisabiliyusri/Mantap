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
source /var/lib/akbarstorevpn/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi
clear
IP=$(wget -qO- ipinfo.io/ip);
ssl="$(cat ~/log-install.txt | grep -w "Stunnel5" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
Login=Trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
systemctl restart ws-tls
systemctl restart ws-nontls
systemctl restart ssh-ohp
systemctl restart dropbear-ohp
systemctl restart openvpn-ohp
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
hariini=`date -d "0 days" +"%Y-%m-%d"`
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi Trial SSH & OpenVPN"
echo -e "================================"
echo -e "IP/Host       : $IP"
echo -e "Domain        : $domain"
echo -e "Username      : $Login"
echo -e "Password      : $Pass"
echo -e "OpenSSH       : 443, 22"
echo -e "Dropbear      : 443, 109, 143"
echo -e "SSL/TLS       :$ssl"
echo -e "Port Squid    :$sqd"
echo -e "OHP SSH       : 8181"
echo -e "OHP Dropbear  : 8282"
echo -e "OHP OpenVPN   : 8383"
echo -e "Ssh Ws SSL    : 443"
echo -e "Ssh Ws No SSL : 8880"
echo -e "Ovpn Ws       : 2086"
echo -e "Port TCP      : $ovpn"
echo -e "Port UDP      : $ovpn2"
echo -e "Port SSL      : 990"
echo -e "OVPN TCP      : http://$IP:89/tcp.ovpn"
echo -e "OVPN UDP      : http://$IP:89/udp.ovpn"
echo -e "OVPN SSL      : http://$IP:89/ssl.ovpn"
echo -e "BadVpn        : 7100-7200-7300"
echo -e "Created       : $hariini"
echo -e "Expired       : $expi"
echo -e "=============================="
echo -e "Payload Websocket TLS"
echo -e "=============================="
echo -e "GET wss://bug.com [protocol][crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=============================="
echo -e "Payload Websocket No TLS"
echo -e "=============================="
echo -e "GET / HTTP/1.1[crlf]Host: ${domain}[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "=============================="
echo -e "Script By Akbar Maulana"