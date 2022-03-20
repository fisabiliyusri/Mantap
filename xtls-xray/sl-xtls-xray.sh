#!/bin/bash
# Script By SL
# XTLS XRAY SL
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

# / / Ambil Xray Core Version Terbaru
latest_version="$(curl -s https://api.github.com/repos/XTLS/Xray-core/releases | grep tag_name | sed -E 's/.*"v(.*)".*/\1/' | head -n 1)"

# / / Installation Xray Core
xraycore_link="https://github.com/XTLS/Xray-core/releases/download/v$latest_version/xray-linux-64.zip"

# / / Make Main Directory
mkdir -p /usr/bin/xray
mkdir -p /etc/xray

# / / Unzip Xray Linux 64
cd `mktemp -d`
curl -sL "$xraycore_link" -o xray.zip
unzip -q xray.zip && rm -rf xray.zip
mv xray /usr/local/bin/xray
chmod +x /usr/local/bin/xray

# Make Folder XRay
mkdir -p /var/log/xray/

sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill
cd /root/
wget https://raw.githubusercontent.com/acmesh-official/acme.sh/master/acme.sh
bash acme.sh --install
rm acme.sh
cd .acme.sh
bash acme.sh --register-account -m senowahyu62@gmail.com
bash acme.sh --issue --standalone -d $domain --force
bash acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key

service squid start
uuid7=$(cat /proc/sys/kernel/random/uuid)
uuid1=$(cat /proc/sys/kernel/random/uuid)
uuid2=$(cat /proc/sys/kernel/random/uuid)
uuid3=$(cat /proc/sys/kernel/random/uuid)
uuid4=$(cat /proc/sys/kernel/random/uuid)
uuid5=$(cat /proc/sys/kernel/random/uuid)
uuid6=$(cat /proc/sys/kernel/random/uuid)
uuid=$(cat /proc/sys/kernel/random/uuid)

# // Certificate File
path_crt="/etc/xray/xray.crt"
path_key="/etc/xray/xray.key"

# Buat Config Xray

cat > /etc/xray/sl-xtls-xray.json << END

{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "info"
  },
  "inbounds": [
    {
      "port": 4369,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
			"flow": "xtls-rprx-direct"
#xray-vless-grpc-xtls
          }
        ]
      },
      "streamSettings": {
        "network": "gun",
        "security": "xtls",
        "xtlsSettings": {
          "serverName": "${domain}",
		  "alpn": [
			"http/1.1",
			"h2"
		],
		  "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {},
        "quicSettings": {},
		"grpcSettings": {
            "serviceName": "GunService"
		}
      }
    },
    {
      "port": 4369,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 0",
			"flow": "xtls-rprx-direct"
#xray-vmess-grpc-xtls
          }
        ]
      },
      "streamSettings": {
        "network": "gun",
        "security": "xtls",
        "xtlsSettings": {
          "serverName": "${domain}",
		  "alpn": [
			"http/1.1",
			"h2"
		],
		  "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {},
        "quicSettings": {},
		"grpcSettings": {
            "serviceName": "GunService"
		}
      }
    },
    {
      "port": 7869,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "${uuid1}",
            "alterId": 0",
			"flow": "xtls-rprx-direct"
#xray-vmess-ws-xtls
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "xtls",
        "xtlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vmess/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      }
    },
    {
      "port": 7869,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${uuid3}",
			"flow": "xtls-rprx-direct"
#xray-vless-ws-xtls
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "security": "xtls",
        "xtlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "httpSettings": {},
        "wsSettings": {
          "path": "/vless/",
          "headers": {
            "Host": ""
          }
        },
        "quicSettings": {}
      },
      "domain": "$domain",
      "sniffing": {
        "enabled": true,
        "destOverride": [
          "http",
          "tls"
        ]
      }
    },
    {
      "port": 2069,
      "protocol": "trojan",
      "settings": {
        "clients": [
          {
            "password": "${uuid5}",
			"flow": "xtls-rprx-direct"
#xray-trojan-tcp-xtls
          }
        ],
        "fallbacks": [
          {
            "dest": 80
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
          "certificates": [
            {
              "certificateFile": "${path_crt}",
              "keyFile": "${path_key}"
            }
          ],
          "alpn": [
            "http/1.1"
          ]
        },
        "tcpSettings": {},
        "kcpSettings": {},
        "wsSettings": {},
        "httpSettings": {},
        "quicSettings": {},
        "grpcSettings": {}
      },
      "domain": "$domain"
     }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
  ],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "outboundTag": "blocked"
      },
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      }
    ]
  },
  "stats": {},
  "api": {
    "services": [
      "StatsService"
    ],
    "tag": "api"
  },
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundUplink": true,
      "statsInboundDownlink": true
    }
  }
}
END


# / / Installation XTLS Xray Service
cat > /etc/systemd/system/xtls-xray.service << END
[Unit]
Description=XTLS Xray Service Create By SL
Documentation=https://nekopoi.care
After=network.target nss-lookup.target

[Service]
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/xray -config /etc/xray/sl-xtls-xray.json
Restart=on-failure
RestartPreventExitStatus=23

[Install]
WantedBy=multi-user.target
END



# // Enable & Start Service
# Accept port XTLS Xray
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 4369 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 4369 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 7869 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 7869 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2069 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2069 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
systemctl daemon-reload
systemctl stop xtls-xray.service
systemctl start xtls-xray.service
systemctl enable xtls-xray.service
systemctl restart xtls-xray.service

#
cd /usr/bin

wget -O sl-addxtls "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xtls-xray/sl-addxtls.sh"
chmod +x sl-addxtls

cd
cp /root/domain /etc/xray
cd
cp /root/domain /etc/xray
cd