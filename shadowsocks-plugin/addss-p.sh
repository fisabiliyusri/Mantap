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
# // Certificate File
path_crt="/etc/shadowsocks/xray.crt"
path_key="/etc/shadowsocks/xray.key"
IP=$(wget -qO- ipinfo.io/ip);
lastport1=$(grep "port_tls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport2=$(grep "port_http" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport3=$(grep "port_v2raywss" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport4=$(grep "port_v2rayws" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport5=$(grep "port_v2raygrpc" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport6=$(grep "port_v2rayquic" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport7=$(grep "port_xrayws" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport8=$(grep "port_xraywss" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport9=$(grep "port_xraygrpctls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport11=$(grep "port_xraygrpchttp" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport12=$(grep "port_xrayquic" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport13=$(grep "port_gosttls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport14=$(grep "port_gostmtls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport15=$(grep "port_gostxtls" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport16=$(grep "port_gostgrpc" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport17=$(grep "port_gostws" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport18=$(grep "port_gostwss" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport19=$(grep "port_gostmws" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport20=$(grep "port_gostmwss" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport21=$(grep "port_gostquic" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')
lastport22=$(grep "port_gosth2" /etc/shadowsocks-libev/akun.conf | tail -n1 | awk '{print $2}')


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
if [[ $lastport3 == '' ]]; then
v2raywss=521
else
v2raywss="$((lastport3+1))"
fi
if [[ $lastport4 == '' ]]; then
v2rayws=522
else
v2rayws="$((lastport4+1))"
fi
if [[ $lastport5 == '' ]]; then
v2raygrpc=523
else
v2raygrpc="$((lastport5+1))"
fi
if [[ $lastport6 == '' ]]; then
v2rayquic=526
else
v2rayquic="$((lastport6+1))"
fi
if [[ $lastport7 == '' ]]; then
xrayws=621
else
xrayws="$((lastport7+1))"
fi
if [[ $lastport8 == '' ]]; then
xraywss=622
else
xraywss="$((lastport8+1))"
fi
if [[ $lastport9 == '' ]]; then
xraygrpctls=623
else
xraygrpctls="$((lastport9+1))"
fi
if [[ $lastport11 == '' ]]; then
xraygrpchttp=624
else
xraygrpchttp="$((lastport11+1))"
fi
if [[ $lastport12 == '' ]]; then
xrayquic=625
else
xrayquic="$((lastport12+1))"
fi
if [[ $lastport13 == '' ]]; then
gosttls=751
else
gosttls="$((lastport13+1))"
fi
if [[ $lastport14 == '' ]]; then
gostmtls=752
else
gostmtls="$((lastport14+1))"
fi
if [[ $lastport15 == '' ]]; then
gostxtls=753
else
gostxtls="$((lastport15+1))"
fi
if [[ $lastport16 == '' ]]; then
gostgrpc=754
else
gostgrpc="$((lastport16+1))"
fi
if [[ $lastport17 == '' ]]; then
gostws=755
else
gostws="$((lastport17+1))"
fi
if [[ $lastport18 == '' ]]; then
gostwss=756
else
gostwss="$((lastport18+1))"
fi
if [[ $lastport19 == '' ]]; then
gostmws=757
else
gostmws="$((lastport19+1))"
fi
if [[ $lastport20 == '' ]]; then
gostmwss=758
else
gostmwss="$((lastport20+1))"
fi
if [[ $lastport21 == '' ]]; then
gostquic=759
else
gostquic="$((lastport21+1))"
fi
if [[ $lastport22 == '' ]]; then
gosth2=760
else
gosth2="$((lastport22+1))"
fi
source /var/lib/crot/ipvps.conf
if [[ "$IP2" = "" ]]; then
domain=$(cat /etc/shadowsocks/domain)
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
#obfs-tls
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
#obfs-http
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
#v2raywss
cat > /etc/shadowsocks-libev/$user-v2raywss.json<<END
{
    "server":"0.0.0.0",
    "server_port":$v2raywss,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"/usr/bin/v2ray-plugin",
    "plugin_opts":"mux=0;server;tls;path=/wss;cert=$path_crt;key=$path_key"
}
END
#v2rayws
cat > /etc/shadowsocks-libev/$user-v2rayws.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$v2rayws,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"v2ray-plugin",
    "plugin_opts":"mux=0;server;path=/ws"
}
END
#v2raygrpc
cat > /etc/shadowsocks-libev/$user-v2raygrpc.json<<END
{
    "server":"0.0.0.0",
    "server_port":$v2raygrpc,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"v2ray-plugin",
    "plugin_opts":"server;tls;mode=grpc;cert=$path_crt;key=$path_key"
}
END
#v2rayquic
cat > /etc/shadowsocks-libev/$user-v2rayquic.json<<END
{
    "server":"0.0.0.0",
    "server_port":$v2rayquic,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_only",
    "plugin":"v2ray-plugin",
    "plugin_opts":"server;tls;mode=quic;cert=$path_crt;key=$path_key"
}
END
#xraywss
cat > /etc/shadowsocks-libev/$user-xraywss.json<<END
{
    "server":"0.0.0.0",
    "server_port":$xraywss,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"xray-plugin",
    "plugin_opts":"mux=0;server;tls;path=/wss;cert=$path_crt;key=$path_key"
}
END
#xrayws
cat > /etc/shadowsocks-libev/$user-xrayws.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$xrayws,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",,
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"xray-plugin",
    "plugin_opts":"mux=0;server;path=/ws"
}
END
#xraygrpctls
cat > /etc/shadowsocks-libev/$user-xraygrpctls.json<<END
{
    "server":"0.0.0.0",
    "server_port":$xraygrpctls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"xray-plugin",
    "plugin_opts":"server;tls;mode=grpc;cert=$path_crt;key=$path_key"
}
END
#xraygrpchttp
cat > /etc/shadowsocks-libev/$user-xraygrpchttp.json <<-END
{
    "server":"0.0.0.0",
    "server_port":$xraygrpchttp,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"xray-plugin",
    "plugin_opts":"server;mode=grpc"
}
END
#xrayquic
cat > /etc/shadowsocks-libev/$user-xrayquic.json<<END
{
    "server":"0.0.0.0",
    "server_port":$xrayquic,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_only",
    "plugin":"xray-plugin",
    "plugin_opts":"server;tls;mode=quic;cert=$path_crt;key=$path_key"
}
END
#gosttls
cat > /etc/shadowsocks-libev/$user-gosttls.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gosttls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=tls;cert=$path_crt;key=$path_key"
}
END
#gostmtls
cat > /etc/shadowsocks-libev/$user-gostmtls.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gosmtls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=mtls;cert=$path_crt;key=$path_key"
}
END
#gostxtls
cat > /etc/shadowsocks-libev/$user-gostxtls.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostxtls,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=xtls;cert=$path_crt;key=$path_key"
}
END
#gostgrpc
cat > /etc/shadowsocks-libev/$user-gostgrpc.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostgrpc,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=grpc;cert=$path_crt;key=$path_key"
}
END
#gostws
cat > /etc/shadowsocks-libev/$user-gostws.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostws,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=ws;path=/ws"
}
END
#gostwss
cat > /etc/shadowsocks-libev/$user-gostwss.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostwss,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=wss;cert=$path_crt;key=$path_key;path=/wss"
}
END
#gostmws
cat > /etc/shadowsocks-libev/$user-gostmws.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostmws,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"/usr/bin/gost-plugin",
    "plugin_opts":"server;mode=mws;path=/ws"
}
END
#gostmwss
cat > /etc/shadowsocks-libev/$user-gostmwss.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostmwss,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=mwss;cert=$path_crt;key=$path_key;path=/wss"
}
END
#gostquic
cat > /etc/shadowsocks-libev/$user-gostquic.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gostquic,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_only",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=quic;cert=$path_crt;key=$path_key"
}
END
#gosth2
cat > /etc/shadowsocks-libev/$user-gosth2.json<<END
{
    "server":"0.0.0.0",
    "server_port":$gosth2,
    "password":"$user",
    "timeout":60,
    "method":"aes-256-cfb",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp",
    "plugin":"gost-plugin",
    "plugin_opts":"server;mode=h2;cert=$path_crt;key=$path_key"
}
END


chmod +x /etc/shadowsocks-libev/$user-tls.json
chmod +x /etc/shadowsocks-libev/$user-http.json
chmod +x /etc/shadowsocks-libev/$user-v2rayws.json
chmod +x /etc/shadowsocks-libev/$user-v2raywss.json
chmod +x /etc/shadowsocks-libev/$user-v2rayquic.json
chmod +x /etc/shadowsocks-libev/$user-v2raygrpc.json
chmod +x /etc/shadowsocks-libev/$user-xrayws.json
chmod +x /etc/shadowsocks-libev/$user-xraywss.json
chmod +x /etc/shadowsocks-libev/$user-xrayquic.json
chmod +x /etc/shadowsocks-libev/$user-xraygrpctls.json
chmod +x /etc/shadowsocks-libev/$user-xraygrpchttp.json
chmod +x /etc/shadowsocks-libev/$user-gosttls.json
chmod +x /etc/shadowsocks-libev/$user-gostmtls.json
chmod +x /etc/shadowsocks-libev/$user-gostxtls.json
chmod +x /etc/shadowsocks-libev/$user-gostgrpc.json
chmod +x /etc/shadowsocks-libev/$user-gostws.json
chmod +x /etc/shadowsocks-libev/$user-gostwss.json
chmod +x /etc/shadowsocks-libev/$user-gostmws.json
chmod +x /etc/shadowsocks-libev/$user-gostmwss.json
chmod +x /etc/shadowsocks-libev/$user-gostquic.json
chmod +x /etc/shadowsocks-libev/$user-gosth2.json


systemctl enable shadowsocks-libev-server@$user-tls.service
systemctl enable shadowsocks-libev-server@$user-http.service
systemctl enable shadowsocks-libev-server@$user-v2rayws.service
systemctl enable shadowsocks-libev-server@$user-v2raywss.service
systemctl enable shadowsocks-libev-server@$user-v2rayquic.service
systemctl enable shadowsocks-libev-server@$user-v2raygrpc.service
systemctl enable shadowsocks-libev-server@$user-xrayws.service
systemctl enable shadowsocks-libev-server@$user-xraywss.service
systemctl enable shadowsocks-libev-server@$user-xraygrpctls.service
systemctl enable shadowsocks-libev-server@$user-xraygrpchttp.service
systemctl enable shadowsocks-libev-server@$user-xrayquic.service
systemctl enable shadowsocks-libev-server@$user-gostls.service
systemctl enable shadowsocks-libev-server@$user-gostmtls.service
systemctl enable shadowsocks-libev-server@$user-gostxtls.service
systemctl enable shadowsocks-libev-server@$user-gostgrpc.service
systemctl enable shadowsocks-libev-server@$user-gostws.service
systemctl enable shadowsocks-libev-server@$user-gostwss.service
systemctl enable shadowsocks-libev-server@$user-gostmws.service
systemctl enable shadowsocks-libev-server@$user-gostmwss.service
systemctl enable shadowsocks-libev-server@$user-gostquic.service
systemctl enable shadowsocks-libev-server@$user-gosth2.service



systemctl start shadowsocks-libev-server@$user-tls.service
systemctl start shadowsocks-libev-server@$user-http.service
systemctl start shadowsocks-libev-server@$user-v2rayws.service
systemctl start shadowsocks-libev-server@$user-v2raywss.service
systemctl start shadowsocks-libev-server@$user-v2rayquic.service
systemctl start shadowsocks-libev-server@$user-v2raygrpc.service
systemctl start shadowsocks-libev-server@$user-xrayws.service
systemctl start shadowsocks-libev-server@$user-xraywss.service
systemctl start shadowsocks-libev-server@$user-xraygrpctls.service
systemctl start shadowsocks-libev-server@$user-xraygrpchttp.service
systemctl start shadowsocks-libev-server@$user-xrayquic.service
systemctl start shadowsocks-libev-server@$user-gosttls.service
systemctl start shadowsocks-libev-server@$user-gostmtls.service
systemctl start shadowsocks-libev-server@$user-gostxtls.service
systemctl start shadowsocks-libev-server@$user-gostgrpc.service
systemctl start shadowsocks-libev-server@$user-gostws.service
systemctl start shadowsocks-libev-server@$user-gostwss.service
systemctl start shadowsocks-libev-server@$user-gostmws.service
systemctl start shadowsocks-libev-server@$user-gostmwss.service
systemctl start shadowsocks-libev-server@$user-gostquic.service
systemctl start shadowsocks-libev-server@$user-gosth2.service


tmp1=$(echo -n "aes-256-cfb:${user}@${MYIP}:$tls" | base64 -w0)
tmp2=$(echo -n "aes-256-cfb:${user}@${MYIP}:$http" | base64 -w0)
tmp3=$(echo -n "aes-256-cfb:${user}@${MYIP}:$v2rayws" | base64 -w0)
tmp4=$(echo -n "aes-256-cfb:${user}@${MYIP}:$v2raywss" | base64 -w0)
tmp5=$(echo -n "aes-256-cfb:${user}@${MYIP}:$v2rayquic" | base64 -w0)
tmp6=$(echo -n "aes-256-cfb:${user}@${MYIP}:$v2raygrpc" | base64 -w0)
tmp7=$(echo -n "aes-256-cfb:${user}@${MYIP}:$xrayws" | base64 -w0)
tmp8=$(echo -n "aes-256-cfb:${user}@${MYIP}:$xraywss" | base64 -w0)
tmp9=$(echo -n "aes-256-cfb:${user}@${MYIP}:$xraygrpctls" | base64 -w0)
tmp11=$(echo -n "aes-256-cfb:${user}@${MYIP}:$xraygrpchttp" | base64 -w0)
tmp12=$(echo -n "aes-256-cfb:${user}@${MYIP}:$xrayquic" | base64 -w0)
tmp13=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gosttls" | base64 -w0)
tmp14=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostmtls" | base64 -w0)
tmp15=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostxtls" | base64 -w0)
tmp16=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostgrpc" | base64 -w0)
tmp17=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostws" | base64 -w0)
tmp18=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostwss" | base64 -w0)
tmp19=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostmws" | base64 -w0)
tmp20=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostmwss" | base64 -w0)
tmp21=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gostquic" | base64 -w0)
tmp22=$(echo -n "aes-256-cfb:${user}@${MYIP}:$gosth2" | base64 -w0)


linkss1="ss://${tmp1}?plugin=obfs-local;obfs=tls;obfs-host=bing.com#obfs-tls"
linkss2="ss://${tmp2}?plugin=obfs-local;obfs=http;obfs-host=bing.com#obf-http"
#v2ray
linkss3="ss://${tmp3}?plugin=v2ray-plugin;mux=0;path=/#v2rayhttp"
linkss4="ss://${tmp4}?plugin=v2ray-plugin;mux=0;tls;path=/#v2raytls"
linkss5="ss://${tmp5}?plugin=v2ray-plugin;server;tls;mode=quic#v2rayquictls"
linkss6="ss://${tmp6}?plugin=v2ray-plugin;server;tls;mode=grpc#v2raygrpc"
#xray
linkss7="ss://${tmp7}?plugin=xray-plugin;path=/#xrayhttp"
linkss8="ss://${tmp8}?plugin=xray-plugin;path=/;tls#xraytls"
linkss9="ss://${tmp9}?plugin=xray-plugin;tls;mode=grpc#xraygrpctls"
linkss11="ss://${tmp11}?plugin=xray-plugin;mode=grpc#xraygrpchttp"
linkss12="ss://${tmp12}?plugin=xray-plugin;mode=quic#xrayquictls"
#gostlink
linkss13="ss://${tmp13}?plugin=gost-plugin;mode=tls#gost-tls"
linkss14="ss://${tmp14}?plugin=gost-plugin;mode=mtls#gost-mtls"
linkss15="ss://${tmp15}?plugin=gost-plugin;mode=xtls#gost-xtls"
linkss16="ss://${tmp16}?plugin=gost-plugin;mode=grpc#gost-grpc"
linkss17="ss://${tmp17}?plugin=gost-plugin;mode=ws;path=/#gostws"
linkss18="ss://${tmp18}?plugin=gost-plugin;mode=wss;path=/;insecure=1#gostwss"
linkss19="ss://${tmp19}?plugin=gost-plugin;mode=mws;path=/#gostmws"
linkss20="ss://${tmp20}?plugin=gost-plugin;mode=mwss;path=/;insecure=1#gostmwss"
linkss21="ss://${tmp21}?plugin=gost-plugin;mode=quic;insecure=1#gostquic"
linkss22="ss://${tmp22}?plugin=gost-plugin;mode=h2;path=/;insecure=1#gosth2"

echo -e "### $user $exp
port_tls $tls
port_http $http
port_v2rayws $v2rayws
port_v2raywss $v2raywss
port_v2rayquic $v2rayquic
port_v2raygrpc $v2raygrpc
port_xrayws $xrayws
port_xraywss $xraywss
port_xraygrpctls $xraygrpctls
port_xraygrpchttp $xraygrpchttp
port_xrayquic $xrayquic
port_gosttls $gosttls
port_gostmtls $gostmtls
port_gostxtls $gostxtls
port_gostgrpc $gostgrpc
port_gostws $gostws
port_gostwss $gostwss
port_gostmws $gostmws
port_gostmwss $gostmwss
port_gostquic $gostquic
port_gosth2 $gosth2">>"/etc/shadowsocks-libev/akun.conf"
cat > /home/vps/public_html/$user.json<<END
# Config Shadowsocks Plugin OBFS
Link obfs tls:
$linkss1
Link obfs http:
$linkss2

# Config Shadowsocks Plugin v2ray
Link v2rayws:
$linkss3
Link v2raywss:
$linkss4
Link v2rayquic:
$linkss5
Link v2raygrpc:
$linkss6

# Config Shadowsocks Plugin xray
Link xrayws:
$linkss7
Link xraywss:
$linkss8
Link xraygrpctls:
$linkss9
Link xraygrpchttp:
$linkss11
Link xrayquic:
$linkss12

# Config Shadowsocks Plugin gost
Link gosttls:
$linkss13
Link gostmtls:
$linkss14
Link gostxtls:
$linkss15
Link gostgrpc:
$linkss16
Link gostws:
$linkss17
Link gostwss:
$linkss18
Link gostmws:
$linkss19
Link gostmwss:
$linkss20
Link gostquic:
$linkss21
Link gosth2:
$linkss22

END

service cron restart
clear
echo -e ""
echo -e "========-SHADOWSOCKS libev-========"
echo -e "IP/Host        : $MYIP"
echo -e "Domain         : $domain"
echo -e "Password       : $user"
echo -e "Method         : aes-256-cfb"
echo -e "Created        : $hariini"
echo -e "Expired        : $exp"
echo -e "Service Name   : GunService"
echo -e "PATH WS HTTP   : /ws"
echo -e "PATH WSS TLS   : /wss"
echo -e "Info Websocket : Khusus Bug Cloudflare && wajib pake subdomain"
echo -e "========-obfs-plugin-========="
echo -e "OBFS TLS       : $tls"
echo -e "OBFS HTTP      : $http"
echo -e "========-v2ray-plugin-========"
echo -e "=Transport Mode-===-Port-====="
echo -e "Websocket TLS  : $v2raywss"
echo -e "Websocket HTTP : $v2rayws"
echo -e "Quic TLS       : $v2rayquic"
echo -e "gRPC TLS       : $v2raygrpc"
echo -e "========-xray-plugin-========="
echo -e "=Transport Mode-===-Port-====="
echo -e "Websocket TLS  : $xraywss"
echo -e "Websocket HTTP : $xrayws"
echo -e "gRPC HTTP      : $xraygrpchttp"
echo -e "gRPC TLS       : $xraygrpctls"
echo -e "Quic TLS       : $xrayquic"
echo -e "========-gost-plugin-========="
echo -e "=Transport Mode-===-Port-====="
echo -e "TLS            : $gosttls"
echo -e "MTLS           : $gostmtls"
echo -e "XTLS           : $gostxtls"
echo -e "gRPC TLS       : $gostgrpc"
echo -e "H2 TLS         : $gosth2"
echo -e "WSS TLS        : $gostwss"
echo -e "WS HTTP        : $gostws"
echo -e "MWS            : $gostmws"
echo -e "MWSS           : $gostmwss"
echo -e "Quic TLS       : [OFF]"
echo -e "========================="
echo -e "Link All Config: #://$MYIP:89/$user.json"
echo -e "Link Aplikasi v2ray-plugin: #://$MYIP:89/xray-plugin-universal.apk"
echo -e "Link Aplikasi gost-plugin: #://$MYIP:89/gost-plugin-x86.zip"
echo -e "Link Aplikasi gost-plugin: #://$MYIP:89/gost-plugin-arm.zip"
echo -e "Link Aplikasi xray-plugin: #://$MYIP:89/v2ray-plugin-universal.apk"
echo -e "ganti tanda # menjadi http"
echo -e "========================="
echo -e "Script Mod By SL"
