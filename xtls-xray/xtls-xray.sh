#!/bin/bash
# XRay Installation
# SL Script
# ==================================
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

# 
uuid=$(cat /proc/sys/kernel/random/uuid)

# / / Make Main Directory
mkdir -p /usr/bin/xray
mkdir -p /etc/xray

# / / Unzip Xray Linux 64
cd `mktemp -d`
curl -sL "$xraycore_link" -o xray.zip
unzip -q xray.zip && rm -rf xray.zip
mv xray /usr/local/bin/xray
chmod +x /usr/local/bin/xray

mkdir -p /var/log/xtls && chown -R root:root /var/log/xtls
mkdir -p /usr/local/etc/xtls
mkdir -p /etc/xtls
# Make Folder XRay
mkdir -p /var/log/xray/
#
wget -q -O /usr/local/bin/geosite.dat "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/geosite.dat"
wget -q -O /usr/local/bin/geoip.dat "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/grpc/geoip.dat"

#
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

# Buat Config XTLS Xray
cat> /etc/xray/xtls.json << END
{
      "log": {
      "access": "/var/log/xtls/access.log",
      "error": "/var/log/xtls/error.log",
      "loglevel": "info"
    },
    "inbounds": [
      {
      "port": 4369,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "$(cat /proc/sys/kernel/random/uuid)",
	    "flow": "xtls-rprx-direct"
#xray-vless-grpc-xtls
          }
        ]
      },
      "streamSettings": {
        "network": "gun",
        "security": "xtls",
        "xtlsSettings": {
	"certificates": [
            {
              "certificateFile": "/etc/xray/xray.crt",
              "keyFile": "/etc/xray/xray.key"
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
            "id": "$(cat /proc/sys/kernel/random/uuid)",
	    "flow": "xtls-rprx-direct"
#xray-vmess-grpc-xtls
          }
        ]
      },
      "streamSettings": {
        "network": "gun",
        "security": "xtls",
        "xtlsSettings": {
	"certificates": [
            {
              "certificateFile": "/etc/xray/xray.crt",
              "keyFile": "/etc/xray/xray.key"
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
            "id": "(cat /proc/sys/kernel/random/uuid)",
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
              "certificateFile": "/etc/xray/xray.crt",
              "keyFile": "/etc/xray/xray.key"
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
            "id": "$(cat /proc/sys/kernel/random/uuid)",
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
              "certificateFile": "/etc/xray/xray.crt",
              "keyFile": "/etc/xray/xray.key"
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
            "password": "$(cat /proc/sys/kernel/random/uuid)",
	    "flow": "xtls-rprx-direct"
#xray-trojan-tcp-xtls
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "xtls",
        "xtlsSettings": {
          "certificates": [
            {
              "certificateFile": "/etc/xray/xray.crt",
              "keyFile": "/etc/xray/xray.key"
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
systemctl daemon-reload
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
ExecStart=/usr/local/bin/xray -config /etc/xray/xtls.json
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
systemctl enable xtls-xray
systemctl stop xtls-xray
systemctl start xtls-xray
systemctl enable xtls-xray
systemctl start xtls-xray
systemctl restart xtls-xray
