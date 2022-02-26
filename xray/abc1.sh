#!/bin/bash
RED='\e[1;31m'
GREEN='\e[0;32m'
BLUE='\e[0;34m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/Iansoftware/userip/main/bossip | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    echo -e "\e[31mRenew IP letak tempoh banyak kit okay? hehe syg ktk #\e[0m"
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/Iansoftware/userip/main/bossip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mDaftar IP dalam github lok sayang okay? mun dah daftar tapi masih juak permission denied refresh dolok website ya hehe. Love you #\e[0m"
exit 0
fi
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m     • CHANGE DOMAIN VPS •         \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""  
echo "Please Input Your Pointing Domain In Cloudflare "
read -rp "Domain/Host: " -e host
rm /etc/rare/xray/domain
echo "$host" >> /etc/rare/xray/domain
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
domain=$(cat /etc/rare/xray/domain)
#Update Sertificate SSL
echo Starting Update SSL Sertificate
sleep 3
sudo pkill -f nginx & wait $!
systemctl stop nginx
systemctl stop xray
systemctl stop xray.service
systemctl stop v2ray
systemctl stop v2ray.service
systemctl stop trojan
systemctl stop trojan.service
sleep 2
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256 --server letsencrypt >> /etc/rare/tls/$domain.log
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/rare/xray/xray.crt --keypath /etc/rare/xray/xray.key --ecc
cat /etc/rare/tls/$domain.log
systemctl daemon-reload
systemctl restart trojan
systemctl restart trojan.service
systemctl restart xray
systemctl restart xray.service
systemctl restart v2ray
systemctl restart v2ray.service
systemctl stop nginx
rm /etc/nginx/conf.d/alone.conf
touch /etc/nginx/conf.d/alone.conf
cat <<EOF >>/etc/nginx/conf.d/alone.conf
server {
	listen 81;
	listen [::]:81;
	server_name ${domain};
	# shellcheck disable=SC2154
	return 301 https://${domain};
}
server {
		listen 127.0.0.1:31300;
		server_name _;
		return 403;
}
server {
	listen 127.0.0.1:31302 http2;
	server_name ${domain};
	root /usr/share/nginx/html;
	location /s/ {
    		add_header Content-Type text/plain;
    		alias /etc/rare/config-url/;
    }

    location /xraygrpc {
		client_max_body_size 0;
#		keepalive_time 1071906480m;
		keepalive_requests 4294967296;
		client_body_timeout 1071906480m;
 		send_timeout 1071906480m;
 		lingering_close always;
 		grpc_read_timeout 1071906480m;
 		grpc_send_timeout 1071906480m;
		grpc_pass grpc://127.0.0.1:31301;
	}

	location /xraytrojangrpc {
		client_max_body_size 0;
		# keepalive_time 1071906480m;
		keepalive_requests 4294967296;
		client_body_timeout 1071906480m;
 		send_timeout 1071906480m;
 		lingering_close always;
 		grpc_read_timeout 1071906480m;
 		grpc_send_timeout 1071906480m;
		grpc_pass grpc://127.0.0.1:31304;
	}
}
server {
	listen 127.0.0.1:31300;
	server_name ${domain};
	root /usr/share/nginx/html;
	location /s/ {
		add_header Content-Type text/plain;
		alias /etc/rare/config-url/;
	}
	location / {
		add_header Strict-Transport-Security "max-age=15552000; preload" always;
	}
}
EOF
rm /etc/nginx/conf.d/alone2.conf
touch /etc/nginx/conf.d/alone2.conf
cat <<EOF >>/etc/nginx/conf.d/alone2.conf
server {
	listen 82;
	listen [::]:82;
	server_name ${domain};
	# shellcheck disable=SC2154
	return 301 https://${domain};
}
server {
		listen 127.0.0.1:32300;
		server_name _;
		return 403;
}
server {
	listen 127.0.0.1:31402 http2;
	server_name ${domain};
	root /usr/share/nginx/html;
	location /s/ {
    		add_header Content-Type text/plain;
    		alias /etc/rare/config-url/;
    }

    location /v2raygrpc {
		client_max_body_size 0;
#		keepalive_time 1071906480m;
		keepalive_requests 4294967296;
		client_body_timeout 1071906480m;
 		send_timeout 1071906480m;
 		lingering_close always;
 		grpc_read_timeout 1071906480m;
 		grpc_send_timeout 1071906480m;
		grpc_pass grpc://127.0.0.1:32301;
	}

	location /v2raytrojangrpc {
		client_max_body_size 0;
		# keepalive_time 1071906480m;
		keepalive_requests 4294967296;
		client_body_timeout 1071906480m;
 		send_timeout 1071906480m;
 		lingering_close always;
 		grpc_read_timeout 1071906480m;
 		grpc_send_timeout 1071906480m;
		grpc_pass grpc://127.0.0.1:32304;
	}
}
server {
	listen 127.0.0.1:32300;
	server_name ${domain};
	root /usr/share/nginx/html;
	location /s/ {
		add_header Content-Type text/plain;
		alias /etc/rare/config-url/;
	}
	location / {
		add_header Strict-Transport-Security "max-age=15552000; preload" always;
	}
}
EOF
systemctl daemon-reload
service nginx restart
echo -e "\033[32m[Info]\033[0m nginx Start Successfully !"
echo ""
echo "Location Your Domain : /var/lib/premium-script/ipvps.conf"
echo ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
m-domain