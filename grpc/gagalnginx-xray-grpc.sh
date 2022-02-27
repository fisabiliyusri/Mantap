#!/bin/bash
# Mod By SL
# =====================================================
source /var/lib/crot/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
MYIP=$(wget -qO- ipinfo.io/ip);
clear
domain=$(cat /etc/xray/domain)

rm /etc/nginx/grpc.conf
touch /etc/nginx/grpc.conf
cat <<EOF >>/etc/nginx/grpc.conf
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

include /usr/share/nginx/modules/*.conf;


events {
	worker_connections 1024;
}

http {
	log_format main '$remote_addr - $remote_user [$time_local] "$request" '
	'$status $body_bytes_sent "$http_referer" '
	'"$http_user_agent" "$http_x_forwarded_for"';


	access_log /var/log/nginx/access.log main;

	sendfile on;
	tcp_nopush on;
	tcp_nodelay on;
	keepalive_timeout 65;
	types_hash_max_size 2048;

	include /etc/nginx/mime.types;
	default_type application/octet-stream;
	include /etc/nginx/conf.d/*.conf;

	server {
		listen 55443 ssl http2; #监听443
		server_name $domain; 

		index index.html;
		root /usr/share/nginx/html; #网站模板路径只建议用html 当然也可以配置其他的比如php等

		ssl_certificate /etc/xray/xray.crt; #证书注意后缀名，重要事情说三遍！重要事情说三遍！重要事情说三遍！
		ssl_certificate_key /etc/xray/xray.key; #密钥
		ssl_protocols TLSv1.2 TLSv1.3; #你懂得！
		ssl_ciphers EECDH+CHACHA20:EECDH+CHACHA20-draft:EECDH+ECDSA+AES128:EECDH+aRSA+AES128:RSA+AES128:EECDH+ECDSA+AES256:EECDH+aRSA+AES256:RSA+AES256:EECDH+ECDSA+3DES:EECDH+aRSA+3DES:RSA+3DES:!MD5; #可以自己修改，不懂勿动

		# 在 location 后填写 /你的 ServiceName和服务器json保持一致
		location /rootfwService {
			if ($content_type !~ "application/grpc") { 
				return 404;
			} #timeout这些后面数值也可以改，不懂别手贱
			client_max_body_size 0;
			keepalive_time 10719064m;
			keepalive_requests 42949672;
			client_body_timeout 10719064m;
			send_timeout 10719064m;
			lingering_close always;
			grpc_read_timeout 10719064m; 
			grpc_send_timeout 10719064m;
			grpc_pass grpc://127.0.0.1:16889;
		}
	}
}
EOF
