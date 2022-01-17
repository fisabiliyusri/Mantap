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
echo "----------------------------------";
echo "----=[ SS - OBFS User Login ]=----";
echo "----------------------------------";
echo ""
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo "----------------------------------";
echo " User | TLS"
echo "----------------------------------";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_tls' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo "----------------------------------"
fi
x=$(( "$x" + 1 ))
done
data=( `cat /etc/shadowsocks-libev/akun.conf | grep '^###' | cut -d ' ' -f 2`);
x=1
echo ""
echo "----------------------------------";
echo " User |  No TLS"
echo "----------------------------------";
for akun in "${data[@]}"
do
port=$(cat /etc/shadowsocks-libev/akun.conf | grep '^port_http' | cut -d ' ' -f 2 | tr '\n' ' ' | awk '{print $'"$x"'}')
jum=$(netstat -anp | grep ESTABLISHED | grep obfs-server | cut -d ':' -f 2 | grep -w $port | awk '{print $2}' | sort | uniq | nl)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
echo " $akun - $port"
echo "$jum";
echo "----------------------------------"
fi
x=$(( "$x" + 1 ))
done
