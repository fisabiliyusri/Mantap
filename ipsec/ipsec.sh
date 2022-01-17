#!/bin/bash
# Debian 9 & 10 64bit
# Ubuntu 18.04 & 20.04 bit
# Centos 7 & 8 64bit 
# By Akbar Maulana
# My Telegram : https://t.me/Akbar218
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
IZIN=$( curl https://raw.githubusercontent.com/senowahyu62/perizinan/main/ipvps.txt | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Please Contact Admin!!"
echo -e "${NC}${LIGHT}Facebook : https://m.facebook.com/lis.tio.718"
echo -e "${NC}${LIGHT}WhatsApp : 081545854516"
echo -e "${NC}${LIGHT}Telegram : https://t.me/Akbar218"
exit 0
fi
# ==================================================
# Link Hosting Kalian
akbarvpn="raw.githubusercontent.com/senowahyu62/scriptvps/main/ipsec"

VPN_IPSEC_PSK='myvpn'
NET_IFACE=$(ip -o $NET_IFACE -4 route show to default | awk '{print $5}');
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
source /etc/os-release
OS=$ID
ver=$VERSION_ID
bigecho() { echo; echo "## $1"; echo; }
bigecho "VPN setup in progress... Please be patient."

# Create and change to working dir
mkdir -p /opt/src
cd /opt/src

bigecho "Trying to auto discover IP of this server..."
PUBLIC_IP=$(wget -qO- ipinfo.io/ip);

bigecho "Installing packages required for the VPN..."
if [[ ${OS} == "centos" ]]; then
epel_url="https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm"
yum -y install epel-release || yum -y install "$epel_url" 

bigecho "Installing packages required for the VPN..."

REPO1='--enablerepo=epel'
REPO2='--enablerepo=*server-*optional*'
REPO3='--enablerepo=*releases-optional*'
REPO4='--enablerepo=PowerTools'

yum -y install nss-devel nspr-devel pkgconfig pam-devel \
  libcap-ng-devel libselinux-devel curl-devel nss-tools \
  flex bison gcc make ppp 

yum "$REPO1" -y install xl2tpd 


if [[ $ver == '7' ]]; then
  yum -y install systemd-devel iptables-services 
  yum "$REPO2" "$REPO3" -y install libevent-devel fipscheck-devel 
elif [[ $ver == '8' ]]; then
  yum "$REPO4" -y install systemd-devel libevent-devel fipscheck-devel 
fi
else
apt install openssl iptables iptables-persistent -y
apt-get -y install libnss3-dev libnspr4-dev pkg-config \
  libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev \
  libcurl4-nss-dev flex bison gcc make libnss3-tools \
  libevent-dev ppp xl2tpd pptpd
fi
bigecho "Compiling and installing Libreswan..."

SWAN_VER=3.32
swan_file="libreswan-$SWAN_VER.tar.gz"
swan_url1="https://github.com/libreswan/libreswan/archive/v$SWAN_VER.tar.gz"
swan_url2="https://download.libreswan.org/$swan_file"
if ! { wget -t 3 -T 30 -nv -O "$swan_file" "$swan_url1" || wget -t 3 -T 30 -nv -O "$swan_file" "$swan_url2"; }; then
  exit 1
fi
/bin/rm -rf "/opt/src/libreswan-$SWAN_VER"
tar xzf "$swan_file" && /bin/rm -f "$swan_file"
cd "libreswan-$SWAN_VER" || exit 1
cat > Makefile.inc.local <<'EOF'
WERROR_CFLAGS = -w
USE_DNSSEC = false
USE_DH2 = true
USE_DH31 = false
USE_NSS_AVA_COPY = true
USE_NSS_IPSEC_PROFILE = false
USE_GLIBC_KERN_FLIP_HEADERS = true
EOF
if ! grep -qs IFLA_XFRM_LINK /usr/include/linux/if_link.h; then
  echo "USE_XFRM_INTERFACE_IFLA_HEADER = true" >> Makefile.inc.local
fi
if [[ ${OS} == "debian" ]]; then
if [ "$(packaging/utils/lswan_detect.sh init)" = "systemd" ]; then
  apt-get -y install libsystemd-dev
  fi
elif [[ ${OS} == "ubuntu" ]]; then
if [ "$(packaging/utils/lswan_detect.sh init)" = "systemd" ]; then
  apt-get -y install libsystemd-dev
fi
fi
NPROCS=$(grep -c ^processor /proc/cpuinfo)
[ -z "$NPROCS" ] && NPROCS=1
make "-j$((NPROCS+1))" -s base && make -s install-base

cd /opt/src || exit 1
/bin/rm -rf "/opt/src/libreswan-$SWAN_VER"
if ! /usr/local/sbin/ipsec --version 2>/dev/null | grep -qF "$SWAN_VER"; then
  exiterr "Libreswan $SWAN_VER failed to build."
fi

bigecho "Creating VPN configuration..."

L2TP_NET=192.168.42.0/24
L2TP_LOCAL=192.168.42.1
L2TP_POOL=192.168.42.10-192.168.42.250
XAUTH_NET=192.168.43.0/24
XAUTH_POOL=192.168.43.10-192.168.43.250
DNS_SRV1=8.8.8.8
DNS_SRV2=8.8.4.4
DNS_SRVS="\"$DNS_SRV1 $DNS_SRV2\""
[ -n "$VPN_DNS_SRV1" ] && [ -z "$VPN_DNS_SRV2" ] && DNS_SRVS="$DNS_SRV1"

# Create IPsec config
cat > /etc/ipsec.conf <<EOF
version 2.0

config setup
  virtual-private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:!$L2TP_NET,%v4:!$XAUTH_NET
  protostack=netkey
  interfaces=%defaultroute
  uniqueids=no

conn shared
  left=%defaultroute
  leftid=$PUBLIC_IP
  right=%any
  encapsulation=yes
  authby=secret
  pfs=no
  rekey=no
  keyingtries=5
  dpddelay=30
  dpdtimeout=120
  dpdaction=clear
  ikev2=never
  ike=aes256-sha2,aes128-sha2,aes256-sha1,aes128-sha1,aes256-sha2;modp1024,aes128-sha1;modp1024
  phase2alg=aes_gcm-null,aes128-sha1,aes256-sha1,aes256-sha2_512,aes128-sha2,aes256-sha2
  sha2-truncbug=no

conn l2tp-psk
  auto=add
  leftprotoport=17/1701
  rightprotoport=17/%any
  type=transport
  phase2=esp
  also=shared

conn xauth-psk
  auto=add
  leftsubnet=0.0.0.0/0
  rightaddresspool=$XAUTH_POOL
  modecfgdns=$DNS_SRVS
  leftxauthserver=yes
  rightxauthclient=yes
  leftmodecfgserver=yes
  rightmodecfgclient=yes
  modecfgpull=yes
  xauthby=file
  ike-frag=yes
  cisco-unity=yes
  also=shared

include /etc/ipsec.d/*.conf
EOF

if uname -m | grep -qi '^arm'; then
  if ! modprobe -q sha512; then
    sed -i '/phase2alg/s/,aes256-sha2_512//' /etc/ipsec.conf
  fi
fi

# Specify IPsec PSK
cat > /etc/ipsec.secrets <<EOF
%any  %any  : PSK "$VPN_IPSEC_PSK"
EOF

# Create xl2tpd config
cat > /etc/xl2tpd/xl2tpd.conf <<EOF
[global]
port = 1701

[lns default]
ip range = $L2TP_POOL
local ip = $L2TP_LOCAL
require chap = yes
refuse pap = yes
require authentication = yes
name = l2tpd
pppoptfile = /etc/ppp/options.xl2tpd
length bit = yes
EOF

# Set xl2tpd options
cat > /etc/ppp/options.xl2tpd <<EOF
+mschap-v2
ipcp-accept-local
ipcp-accept-remote
noccp
auth
mtu 1280
mru 1280
proxyarp
lcp-echo-failure 4
lcp-echo-interval 30
connect-delay 5000
ms-dns $DNS_SRV1
EOF

if [ -z "$VPN_DNS_SRV1" ] || [ -n "$VPN_DNS_SRV2" ]; then
cat >> /etc/ppp/options.xl2tpd <<EOF
ms-dns $DNS_SRV2
EOF
fi

# Create VPN credentials
cat > /etc/ppp/chap-secrets <<EOF
"$VPN_USER" l2tpd "$VPN_PASSWORD" *
EOF

VPN_PASSWORD_ENC=$(openssl passwd -1 "$VPN_PASSWORD")
cat > /etc/ipsec.d/passwd <<EOF
$VPN_USER:$VPN_PASSWORD_ENC:xauth-psk
EOF

# Create PPTP config
cat >/etc/pptpd.conf <<END
option /etc/ppp/options.pptpd
logwtmp
localip 192.168.41.1
remoteip 192.168.41.10-100
END
cat >/etc/ppp/options.pptpd <<END
name pptpd
refuse-pap
refuse-chap
refuse-mschap
require-mschap-v2
require-mppe-128
ms-dns 8.8.8.8
ms-dns 8.8.4.4
proxyarp
lock
nobsdcomp 
novj
novjccomp
nologfd
END

bigecho "Updating IPTables rules..."
service fail2ban stop >/dev/null 2>&1
iptables -t nat -I POSTROUTING -s 192.168.43.0/24 -o $NET_IFACE -j MASQUERADE
iptables -t nat -I POSTROUTING -s 192.168.42.0/24 -o $NET_IFACE -j MASQUERADE
iptables -t nat -I POSTROUTING -s 192.168.41.0/24 -o $NET_IFACE -j MASQUERADE
if [[ ${OS} == "centos" ]]; then
service iptables save
iptables-restore < /etc/sysconfig/iptables 
else
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload
fi

bigecho "Enabling services on boot..."
systemctl enable xl2tpd
systemctl enable ipsec
systemctl enable pptpd

for svc in fail2ban ipsec xl2tpd; do
  update-rc.d "$svc" enable >/dev/null 2>&1
  systemctl enable "$svc" 2>/dev/null
done

bigecho "Starting services..."
sysctl -e -q -p
chmod 600 /etc/ipsec.secrets* /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*

mkdir -p /run/pluto
service fail2ban restart 2>/dev/null
service ipsec restart 2>/dev/null
service xl2tpd restart 2>/dev/null
wget -O /usr/bin/addl2tp https://${akbarvpn}/addl2tp.sh && chmod +x /usr/bin/addl2tp
wget -O /usr/bin/dell2tp https://${akbarvpn}/dell2tp.sh && chmod +x /usr/bin/dell2tp
wget -O /usr/bin/addpptp https://${akbarvpn}/addpptp.sh && chmod +x /usr/bin/addpptp
wget -O /usr/bin/delpptp https://${akbarvpn}/delpptp.sh && chmod +x /usr/bin/delpptp
wget -O /usr/bin/renewpptp https://${akbarvpn}/renewpptp.sh && chmod +x /usr/bin/renewpptp
wget -O /usr/bin/renewl2tp https://${akbarvpn}/renewl2tp.sh && chmod +x /usr/bin/renewl2tp
touch /var/lib/akbarstorevpn/data-user-l2tp
touch /var/lib/akbarstorevpn/data-user-pptp
rm -f /root/ipsec.sh
