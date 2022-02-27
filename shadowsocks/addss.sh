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
IP=$(wget -qO- ipinfo.io/ip);
lastport1=$(grep "port_tls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport2=$(grep "port_http" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
if [[ $lastport1 == '' ]]; then
tls=2443
else
tls="$((lastport1+1))"
fi
if [[ $lastport2 == '' ]]; then
http=3443
else
http="$((lastport2+1))"
fi
source /var/lib/crot/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP2
fi

#Default
cat > /etc/shadowsocks-libev/tls.json<<END
{   
    "server":"0.0.0.0",
    "server_port":$tls,
    "password":"tls",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls"
}
END
cat > /etc/shadowsocks-libev/http.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$http,
    "password":"http",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
END
chmod +x /etc/shadowsocks-libev/tls.json
chmod +x /etc/shadowsocks-libev/http.json

systemctl enable shadowsocks-libev-server@tls.service
systemctl start shadowsocks-libev-server@tls.service
systemctl enable shadowsocks-libev-server@http.service
systemctl start shadowsocks-libev-server@http.service
#
echo ""
echo "Masukkan Password"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Password : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/shadowsocks-libev/akun.conf | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
			exit 1
		fi
	done
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat > /etc/shadowsocks-libev/$user-tls.json<<END
{   
    "server":"0.0.0.0",
    "server_port":$tls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=tls"
}
END
cat > /etc/shadowsocks-libev/$user-http.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$http,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "fast_open":true,
    "no_delay":true,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"obfs-server",
    "plugin_opts":"obfs=http"
}
END
chmod +x /etc/shadowsocks-libev/$user-tls.json
chmod +x /etc/shadowsocks-libev/$user-http.json

systemctl enable shadowsocks-libev-server@$user-tls.service
systemctl start shadowsocks-libev-server@$user-tls.service
systemctl enable shadowsocks-libev-server@$user-http.service
systemctl start shadowsocks-libev-server@$user-http.service
tmp1=$(echo -n "aes-256-cfb:${user}@${MYIP}:$tls" | base64 -w0)
tmp2=$(echo -n "aes-256-cfb:${user}@${MYIP}:$http" | base64 -w0)
linkss1="ss://${tmp1}?plugin=obfs-local;obfs=tls;obfs-host=bing.com"
linkss2="ss://${tmp2}?plugin=obfs-local;obfs=http;obfs-host=bing.com"
echo -e "### $user $exp
port_tls $tls
port_http $http">>"/etc/shadowsocks-libev/akun.conf"
service cron restart
clear
echo -e ""
echo -e "======-SHADOWSOCKS-======"
echo -e "IP/Host     : $MYIP"
echo -e "Domain      : $domain"
echo -e "Port TLS    : $tls"
echo -e "Port No TLS : $http"
echo -e "Password    : $user"
echo -e "Method      : aes-256-cfb"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "========================="
echo -e "Link TLS    : $linkss1"
echo -e "========================="
echo -e "Link No TLS : $linkss2"
echo -e "========================="
echo -e "Script Mod By SL"
