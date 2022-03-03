<h2 align="center">
Auto Script Install All VPN Service
Mod By SL
<img src="https://img.shields.io/badge/Version-1.0.0-blue.svg"></h2>

</p> 
<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">  <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=Lts&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=Lts&color=red">
</p>

<p align="center"><img src="https://img.shields.io/badge/Service-SSH_Websocket-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN_Websocket-success.svg">  <img src="https://img.shields.io/badge/Service-SSLH-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel5-success.svg">  <img src= "https://img.shields.io/badge/Service-OHP_Open_Http_Puncher-success.svg">  <img src= "https://img.shields.io/badge/Service-SSTP_VPN-success.svg">  <img src= "https://img.shields.io/badge/Service-L2TP_VPN-success.svg">  <img src= "https://img.shields.io/badge/Service-PPTP_VPN-success.svg">
<p align="center"><img src="https://img.shields.io/badge/Service-SSH_OpenSSH-success.svg">  <img src="https://img.shields.io/badge/Service-SSH_Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-SlowDns-success.svg">  <p align="center"><img src="https://img.shields.io/badge/Service-XRAY-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_Websocket_TLS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_VLESS_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_gRPC_VLESS_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_TROJAN-success.svg">  <p align="center"><img src="https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan_Go-success.svg">  <img src="https://img.shields.io/badge/Service-WireGuard-success.svg">  <img src= "https://img.shields.io/badge/Service-Shadowsocks-success.svg">  

### Info:
Buat VPS Fresh atau VPS Baru

### Link Video Tutorial Cara Install
```html
https://www.facebook.com/100031931503057/posts/628374871570224/?app=fbl
```

## Installation 
## 1.
Part 1: Update dan Upgrade
   <img src="https://img.shields.io/badge/Update%20Upgrade-green"> 
  ```html
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```
  
## 2.0
Aktifkan Root Sementara
  ```html
sudo su && cd
```
# 2.
Part 2: Buat Akses Root Di VPS /Root VPS
  <img src="https://img.shields.io/badge/Akses_Root%20VPS-green">
Untuk Mengizinkan Root Dan Ubah Password Login di VPS Google Cloud Platform, Aws, Dan Lain-lain
   ```html
  wget -qO- -O vpsroot.sh https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/vpsroot.sh && bash vpsroot.sh
  ```
  
# 2.5
Di sini wajib pake user root atau bisa aktifkan root sementara
   ```html
sudo su && cd
  ```
### 3.
Part 3: Install Semua Layanan VPN /Install All VPN Service
  <img src="https://img.shields.io/badge/Install_Semua_Layanan_VPN%20Batch-green">
  ```html
rm -f setup.sh && apt update && apt upgrade -y && update-grub && sleep 2 && apt-get update -y && apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```


### 4.
# Auto Fix Error SSLH + WS-TLS 443
* 1 • Jika terjadi error di SSLH dan SSH WS-TLS nya,gunakan script ini untuk memperbaiki nya
```html
cd /usr/bin/ && rm -f sl-fix && wget -O sl-fix "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/sslh-fix/sl-fix" && chmod +x sl-fix && cd && updatemenu && menu
 ```
### 4.1
* 2 • di menu lalu pilih 17 (SL Menu )
```html
17
 ```
### 4.2
* 3 • jika sudah selesai lalu reboot/ hidupkan ulang vps nya
```html
reboot
 ```



### 99.

# Fix Stunnel5 Error
* buat domain baru(bash slhost.sh)
```html
cd /usr/bin && wget https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/ssh/slhost.sh && bash slhost.sh
 ```

### 99.1 edit manual ip domain
```html
nano /var/lib/crot/ipvps.conf
 ```
```html
IP=masukan host subdomain kamu
 ```

### 99.2 edit manual domain
```html
nano /etc/xray/domain
 ```
```html
isi dengan host subdomain kamu
 ```

* lalu update cert
```html
wget https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray/certv2ray.sh && chmod +x certv2ray.sh && bash certv2ray.sh
 ```
* atau
```html
certv2ray
 ```

### 99.3 Fix Error SSLH & Fix Error SSH WS-TLS

* Perbaiki sslh yang error di vps yang tidak support sslh
* khusus yang vps nya tidak support sslh
* matikan ws-tls
```html
systemctl stop ws-tls
```
* buat user sslh / edit passwd
```html
echo sslh:x:109:114::/nonexistent:/bin/false >> /etc/passwd
```
* note: edit passwd dan pindah sslh nya di atas vnstat

* start sslh dan jalankan
```html
systemctl start sslh 
&& 
/etc/init.d/sslh start 
&& 
/etc/init.d/sslh restart 
```
# lalu start ws-tls
```html
systemctl start ws-tls
```
*done

# perintah
```html
wget = download
cp = copy/salin
nano = edit
rm = hapus
rm -r = hapus
rm -f = hapus
rm -rf = hapus
git clone = digunakan untuk mengunduh code yang ada pada repository
 ```

# (hapus) uninstall script websocket
```html
rm -r /etc/systemd/system/ws-nontls.service 
&& 
rm -r /etc/systemd/system/ws-tls.service 
&& 
rm -r /usr/local/bin/ws-nontls 
&& 
rm -r /usr/local/bin/ws-tls 
&&
rm -r /etc/systemd/system/ws-ovpn.service 
&& 
rm -r /usr/local/bin/ws-ovpn 
 ```
# (hapus) uninstall ssl && stunnel
```html

rm -f /etc/default/sslh
rm -r -f stunnel
rm -f stunnel5.zip
rm -f /etc/stunnel5/stunnel5.conf
rm -r -f /usr/local/share/doc/stunnel/
rm -r -f /usr/local/etc/stunnel/
rm -f /usr/local/bin/stunnel
rm -f /usr/local/bin/stunnel3
rm -f /usr/local/bin/stunnel4
rm -f /usr/local/bin/stunnel5
```
# (hapus) uninstall all sslh && all stunnel
```html
sudo apt-get remove stunnel4
&&
sudo apt-get remove stunnel5
&&
sudo apt-get remove --auto-remove stunnel4
&&
sudo apt-get remove --auto-remove stunnel5
&&
sudo apt-get purge stunnel4
&&
sudo apt-get purge stunnel5
&&
sudo apt-get purge --auto-remove stunnel4
&&
sudo apt-get purge --auto-remove stunnel5
&&

sudo apt remove sslh
&&
sudo apt-get remove --auto-remove sslh
&&
sudo apt-get purge sslh
&&
sudo apt-get purge --auto-remove sslh
&&
sudo apt autoclean && sudo apt autoremove
&& 
```




### Fitur Script

• CEK SEMUA IP DAN PORT (Service ALL VPN)

• SSH & OpenVPN

• SSH Websocket SSH (Cloudflare)

• SSH Websocket OpenVPN (Cloudflare)

• SSLH

• SSH CloudFront Websocket (Aws CloudFront Only) [OFF]

• SLOWDNS Over SSH [OFF]

• OHP SSH & OHP Dropbear & OHP OpenVPN (OPEN HTTP PUNCHER)

• XRAY VMESS 

• XRAY VLESS

• XRAY TROJAN

• XRAY VMESS GRPC

• XRAY VLESS GRPC

• SHADOWSOCKS

• SSR

• PPTP VPN

• L2TP VPN

• SSTP VPN

• WIREGUARD

• TROJAN GO

• Backup Data ALL Service

• Restore Data ALL Service

### Os Supported

• Debian 10 & 9

• Ubuntu 18.04 & 20.04

# Service & Port

• OpenSSH                 : 22, 2253

• Dropbear                : 443, 109, 143, 1153

• Stunnel5                : 443, 445, 777

• OpenVPN                 : TCP 1194, UDP 2200, SSL 990

• Websocket SSH TLS       : 443

• Websocket SSH HTTP      : 8880

• Websocket OpenVPN       : 2086

• Squid Proxy             : 3128, 8080

• Badvpn                  : 7100, 7200, 7300

• Nginx                   : 89

• Wireguard               : 7070

• L2TP/IPSEC VPN          : 1701

• PPTP VPN                : 1732

• SSTP VPN                : 444

• Shadowsocks-R           : 1443-1543

• SS-OBFS TLS             : 2443-2543

• SS-OBFS HTTP            : 3443-3543

• XRAYS Vmess TLS         : 8443

• XRAYS Vmess None TLS    : 80

• XRAYS Vless TLS         : 8443

• XRAYS Vless None TLS    : 80

• XRAYS Trojan            : 2083

• XRAYS Vmess GRPC TLS    : 1180

• XRAYS Vless GRPC TLS    : 2280

• OHP SSH                 : 8181

• OHP Dropbear            : 8282

• OHP OpenVPN             : 8383

• Trojan Go               : 2087

• CloudFront Websocket    : [OFF]

• SLOWDNS OPENSSH         : (2253)[OFF]

• SLOWDNS DROPBEAR        : (1153)[OFF]

• SLOWDNS SSL/TLS         : (3353)[OFF]



 ### Server Information & Other Features

• Timezone                : Asia/Jakarta (GMT +7)

• Fail2Ban                : [ON]

• Dflate                  : [ON]

• IPtables                : [ON]

• Auto-Reboot             : [ON]

• IPv6                    : [OFF]

• Autoreboot On 05.00 GMT +7

• Auto Delete Expired Account

• Full Orders For Various Services

• White Label



