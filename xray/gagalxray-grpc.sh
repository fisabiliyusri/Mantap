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

#
wget http://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
apt update -y
apt install -y nginx
apt --fix-broken install -y
apt install -y curl tar socat wget
apt --fix-broken install -y
systemctl start nginx
#

cat > /etc/xray/xray-grpc.json <<END
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "port": 7777,
      "listen": "127.0.0.1",
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "5a5a3a75-d739-46d3-9773-c5139410a4a5" // 填写你的 UUID
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "grpc",
        "grpcSettings": {
          "serviceName": "$domain" // 填写你的 ServiceName
        }
      }
    }
  ],
  "outbounds": [
    {
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
    "rules": [
      {
        "type": "field",
        "ip": [
          "geoip:private"
        ],
        "outboundTag": "blocked"
      }
    ]
  }
}
END


# installl xray vless grpc
cat > /etc/systemd/system/xray@grpc.service << END
[Unit]
Description=Xray Vless GRPC Service
Documentation=https://nekopoi.care
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/xray-grpc.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
END
#done

#iptables
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 7777 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 7777 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8888 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8888 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

# restart
systemctl daemon-reload
service nginx restart
systemctl stop xray.service
systemctl start xray.service
systemctl enable xray.service
systemctl restart xray.service
systemctl stop xray@grpc.service
systemctl enable xray@grpc.service
systemctl restart xray@grpc.service
