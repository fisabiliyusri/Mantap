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
NIC=$(ip -o $ANU -4 route show to default | awk '{print $5}');
clear
wg="$(cat ~/log-install.txt | grep -i Wireguard | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "Change Port $wg"
echo -e ""
echo -e "======================================"
read -p "New Port Wireguard : " wg2
if [ -z $wg2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $wg2)
if [[ -z $cek ]]; then
sed -i "s/$wg/$wg2/g" /etc/wireguard/wg0.conf
sed -i "s/$wg/$wg2/g" /etc/wireguard/params
sed -i "s/   - Wireguard               : $wg/   - Wireguard               : $wg2/g" /root/log-install.txt
iptables -D INPUT -i $NIC -p udp --dport $wg -j ACCEPT
iptables -I INPUT -i $NIC -p udp --dport $wg2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null
systemctl reload wg-quick@wg0 > /dev/null
echo -e "\e[032;1mPort $wg2 modified successfully\e[0m"
else
echo "Port $wg2 is used"
fi
