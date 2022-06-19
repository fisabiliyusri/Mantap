#!/bin/bash
# Mod By SL
# =====================================================

# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'

# / / Make Main Directory
mkdir -p /usr/local/bin/
mkdir -p /etc/shadowsocks
rm -rf /usr/bin/shadowhost
cd /usr/bin
wget -O addss-p "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/shadowsocks-plugin/addss-p.sh"
chmod +x addss-p
#wget -O shadowhost "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/shadowsocks-plugin/shadowhost.sh"
#chmod +x shadowhost && shadowhost
wget -O delss "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/shadowsocks/delss.sh"
cd
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /etc/xray/domain)
apt install iptables iptables-persistent -y
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
timedatectl set-ntp true
systemctl enable chronyd && systemctl restart chronyd
systemctl enable chrony && systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
chronyc sourcestats -v
chronyc tracking -v
date

# / / Ambil V2ray-Plugin Core Version Terbaru
#teddysun/v2ray-plugin/releases
#latest_versionv2ray="$(curl -s https://api.github.com/repos/teddysun/v2ray-plugin/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
#latest_versionvxray="$(curl -s https://api.github.com/repos/teddysun/xray-plugin/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
#versi_v2ray-plugin=$latest_versionv2ray
#versi_xray-plugin=$latest_versionxray
# / / Installation V2rayPlugin_GostPlugin_XrayPlugin
#v2rayplugin_link="https://github.com/teddysun/v2ray-plugin/releases/download/v4.44.0/v2ray-plugin-linux-arm64-v4.44.0.tar.gz"
#gostplugin_link="https://github.com/maskedeken/gost-plugin/releases/download/v1.6.1/gost-plugin_linux_arm64-1.6.1.zip"
#xrayplugin_link="https://github.com/teddysun/xray-plugin/releases/download/v1.5.4/xray-plugin-linux-arm64-v1.5.4.tar.gz"

# / / Unzip Shadowsocks plugin Linux arm64
rm -rf /usr/local/bin/v2ray-plugin
rm -rf /usr/local/bin/gost-plugin
rm -rf /usr/local/bin/xray-plugin
cd /usr/bin/
rm -rf xray-plugin
rm -rf v2xray-plugin
rm -rf gost-plugin
cd /usr/bin/
wget -O gost-plugin "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/gost-plugin"
wget -O v2ray-plugin "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/v2ray-plugin"
wget -O xray-plugin "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/xray-plugin"
chmod +x gost-plugin
chmod +x v2ray-plugin
chmod +x xray-plugin
#curl -sL "$v2rayplugin_link" -o v2ray-plugin.tar.gz
#curl -sL "$gostplugin_link" -o gost-plugin.zip
#curl -sL "$xrayplugin_link" -o xray-plugin.tar.gz
#tar zxf xray-plugin.tar.gz && rm -rf xray-plugin.tar.gz
#tar zxf v2ray-plugin.tar.gz && rm -rf v2ray-plugin.tar.gz
#unzip -q gost-plugin.zip && rm -rf gost-plugin.zip
#unzip -q v2ray.zip && rm -rf v2ray.zip
#unzip -q xray.zip && rm -rf xray.zip
#cp -r xray-plugin_linux_arm64 xray-plugin
#cp -r v2ray-plugin_linux_arm64 v2ray-plugin
#cp -r v2ray-plugin /usr/local/bin/v2ray-plugin
#cp -r gost-plugin /usr/local/bin/gost-plugin
#cp -r xray-plugin /usr/local/bin/xray-plugin
#cp -r v2ray-plugin /usr/bin/v2ray-plugin
#cp -r gost-plugin /usr/bin/gost-plugin
#cp -r xray-plugin /usr/bin/xray-plugin
#rm -rf xray-plugin_linux_arm64
#rm -rf v2ray-plugin_linux_arm64
#chmod +x /usr/local/bin/v2ray-plugin
#chmod +x /usr/local/bin/gost-plugin
#chmod +x /usr/local/bin/xray-plugin

# // download
cd /home/vps/public_html/
wget -O gost-plugin-arm.zip "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/gost-plugin-arm.zip"
wget -O gost-plugin-x86.zip "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/gost-plugin-x86.zip"
wget -O v2ray-plugin-universal.apk "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/v2ray-plugin-universal-v4.44.0.apk"
wget -O xray-plugin-universal.apk "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/main/xray-plugin-universal-v1.5.4.apk"

sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
# // Certificate File
#cd /root/
#rm -rf acme.sh
#rm -rf .acme.sh
#wget -O acme.sh https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
#bash acme.sh --install
#rm acme.sh
#cd .acme.sh
#bash acme.sh --register-account -m slinfinity69@gmail.com
#bash acme.sh --issue --standalone -d $domain --force
#bash acme.sh --installcert -d $domain --fullchainpath /etc/shadowsocks/xray.crt --keypath /etc/shadowsocks/xray.key

