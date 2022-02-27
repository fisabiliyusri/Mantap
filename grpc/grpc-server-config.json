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

rm /etc/xray/grpc-server-config.json
touch /etc/xray/grpc-server-config.json
cat <<EOF >>/etc/xray/grpc-server-config.json
{
    "log": {
        "loglevel": "warning"
    },
    "inbounds": [{
        "port": 16889,
        "listen": "127.0.0.1",
        "protocol": "vless",
        "settings": {
            "clients": [{
                "id": "2332424556457234556" // 填写你的 UUID
            }],
            "decryption": "none"
        },
        "streamSettings": {
            "network": "grpc",
            "grpcSettings": {
                "serviceName": "" // 填写你的 ServiceName
            }
        }
    }],
    "outbounds": [{
            "tag": "direct",
            "protocol": "freedom",
            "settings": {}
        },
        {
            "tag": "blocked",
            "protocol": "blackhole",
            "settings": {}
        }
    ],
    "routing": {
        "domainStrategy": "AsIs",
        "rules": [{
            "type": "field",
            "ip": [
                "geoip:private"
            ],
            "outboundTag": "blocked"
        }]
    }
}
EOF

