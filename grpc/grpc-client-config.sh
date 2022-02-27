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

fileaku=grpc-client-config.json
rm /etc/xray/grpc-client-config.json
touch /etc/xray/grpc-client-config.json
cat <<EOF >>/etc/xray/grpc-client-config.json
{
    "log": {
        "loglevel": "warning" //基别
    },
    "inbounds": [{
        "listen": "127.0.0.1", //监听
        "port": "1080", //端口
        "protocol": "socks", //socks
        "settings": {
            "auth": "noauth"
        }
    }],
    "outbounds": [{
        "protocol": "vless", //vlwss协议
        "settings": {
            "vnext": [{
                "address": "$MYIP", //域名
                "port": 55443, //端口
                "users": [{
                    "id": "", //uuid
                    "encryption": "none"
                }]
            }]
        },
        "streamSettings": {
            "network": "gun", //伪装类型
            "security": "tls", //加密tls传输
            "tlsSettings": {
                "serverName": "$domain", //域名
                "alpn": [
                    "h2"
                ]
            },
            "grpcSettings": {
                "serviceName": "grpcsl" //路径类似（path）
            }
        }
    }]
}
EOF
