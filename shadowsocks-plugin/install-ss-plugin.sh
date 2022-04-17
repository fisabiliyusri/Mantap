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

rm -rf /usr/bin/shadowhost
cd /usr/bin
wget -O shadowhost "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/shadowsocks-plugin/shadowhost.sh"
chmod +x shadowhost && shadowhost
cd
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /etc/shadowsocks/domain)
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

# / / Make Main Directory
mkdir -p /usr/local/bin/
mkdir -p /etc/shadowsocks

# / / Ambil V2ray-Plugin Core Version Terbaru
#teddysun/v2ray-plugin/releases
latest_versionv2ray="$(curl -s https://api.github.com/repos/teddysun/v2ray-plugin/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
latest_versionvxray="$(curl -s https://api.github.com/repos/teddysun/xray-plugin/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"
versi_v2ray-plugin=$latest_versionv2ray
versi_gost-plugin=$latest_versiongost
versi_xray-plugin=$latest_versionxray
# / / Installation V2rayPlugin_GostPlugin_XrayPlugin
v2rayplugin_link="https://github.com/teddysun/v2ray-plugin/releases/download/v$latest_versionv2ray/v2ray-plugin-linux-arm64-v$.tar.gz"
gostplugin_link="https://github.com/maskedeken/gost-plugin/releases/download/v1.6.1/gost-plugin_linux_arm64-1.6.1.zip"
xrayplugin_link="https://github.com/teddysun/xray-plugin/releases/download/v$latest_versionxray/xray-plugin-linux-arm64-v$.tar.gz"

# / / Unzip Shadowsocks plugin Linux arm64
cd `mktemp -d`
curl -sL "$v2rayplugin_link" -o v2ray-plugin.tar.gz
curl -sL "$gostplugin_link" -o gost-plugin.zip
curl -sL "$xrayplugin_link" -o xray-plugin.tar.gz
tar zxf xray-plugin.tar.gz && rm -rf xray-plugin.tar.gz
tar zxf v2ray-plugin.tar.gz && rm -rf v2ray-plugin.tar.gz
unzip -q gost-plugin.zip && rm -rf gost-plugin.zip
#unzip -q v2ray.zip && rm -rf v2ray.zip
#unzip -q xray.zip && rm -rf xray.zip
cp xray-plugin_linux_arm64 xray-plugin
cp v2ray-plugin_linux_arm64 v2ray-plugin
mv v2ray-plugin /usr/local/bin/
mv gost-plugin /usr/local/bin/
mv xray-plugin /usr/local/bin/
chmod +x /usr/local/bin/v2ray-plugin
chmod +x /usr/local/bin/gost-plugin
chmod +x /usr/local/bin/xray-plugin

# // download
cd /home/vps/public_html/
wget -O gost-plugin-arm.zip "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/gost-plugin-arm.zip"
wget -O gost-plugin-x86.zip "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/gost-plugin-x86.zip"
wget -O v2ray-plugin-universal.apk "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/v2ray-plugin-universal-v4.44.0.apk"
wget -O xray-plugin-universal.apk "https://raw.githubusercontent.com/fisabiliyusri/Shadowsocks-Plugin/xray-plugin-universal-v1.5.4.apk"

sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
# // Certificate File
path_crt="/etc/shadowsocks/xray.crt"
path_key="/etc/shadowsocks/xray.key"
cd /root/etc/shadowsocks/
rm -rf .acme.sh
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd /root/etc/shadowsocks/.acme.sh
domain=$(cat /etc/shadowsocks/domain)
bash acme.sh --register-account -m slinfinity69@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/shadowsocks/xray.crt --keypath /etc/shadowsocks/xray.key

