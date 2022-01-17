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
IP=$(wget -qO- ipinfo.io/ip);
date=$(date +"%Y-%m-%d")
clear
echo "Starting Backup"
sleep 1
echo "Membuat Directory"
mkdir /root/backup
sleep 1
echo "Start Backup"
sleep 2
clear
cp /etc/passwd backup/
cp /etc/group backup/
cp /etc/shadow backup/
cp /etc/gshadow backup/
cp -r /etc/wireguard backup/wireguard
cp /etc/ppp/chap-secrets backup/chap-secrets
cp /etc/ipsec.d/passwd backup/passwd1
cp /etc/shadowsocks-libev/akun.conf backup/ss.conf
cp -r /var/lib/akbarstorevpn/ backup/akbarstorevpn
cp -r /home/sstp backup/sstp
cp -r /etc/xray backup/xray
cp -r /etc/trojan-go backup/trojan-go
cp -r /usr/local/shadowsocksr/ backup/shadowsocksr
cp -r /home/vps/public_html backup/public_html
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
echo -e "The following is a link to your vps data backup file."
echo -e "=================================" 
echo -e "Detail Backup : "
echo -e "================================="
echo -e "IP VPS        : $IP"
echo -e "Link Backup   : $link"
echo -e "================================="
echo -e "Script By LamVpn"
echo ""
echo -e "If you want to restore data, please enter the link above"
echo ""
rm -rf /root/backup
rm -r /root/$IP-$date.zip
echo "Done"