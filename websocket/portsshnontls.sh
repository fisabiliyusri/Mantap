#!/bin/bash
#warna
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

#cek port dan tampilkan

ws="$(cat ~/log-install.txt | grep -w "Websocket None TLS" | cut -d: -f2|sed 's/ //g')"

#input port untuk pengganti
echo -e "======================================"
echo -e ""
echo -e "Change Port $ws"
echo -e ""
echo -e "======================================"
read -p "New Port SSH WS : " ws2
if [ -z $ws2 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $ws2)
if [[ -z $cek ]]; then


#ganti port layanan
sed -i "s/$ws/$ws2/g" /etc/default/sslh
sed -i "s/   - Websocket None TLS      : $ws/   - Websocket None TLS      : $ws2/g" /root/log-install.txt

iptables -D INPUT -m state --state NEW -m tcp -p tcp --dport $ws -j ACCEPT
iptables -D INPUT -m state --state NEW -m udp -p udp --dport $ws -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $ws2 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport $ws2 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save > /dev/null
netfilter-persistent reload > /dev/null


sed -i "s/$ws/$ws2/g" /etc/systemd/system/ws-nontls.service
systemctl restart sslh
systemctl daemon-reload
systemctl restart ws-nontls > /dev/null

#ganti port info

echo -e "\e[032;1mPort $ws2 modified successfully\e[0m"
else
echo "Port $ws2 is used"
fi



#done 
