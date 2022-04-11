<h2 align="center">
Auto Script Install All VPN Service
Mod By SL
<img src="https://img.shields.io/badge/Version-1.0.0-blue.svg"></h2>

</p> 
<h2 align="center"> Supported Linux Distribution</h2>
<p align="center"><img src="https://d33wubrfki0l68.cloudfront.net/5911c43be3b1da526ed609e9c55783d9d0f6b066/9858b/assets/img/debian-ubuntu-hover.png"></p> 
<p align="center"><img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%209&message=Stretch&color=purple"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=debian&label=Debian%2010&message=Buster&color=purple">  <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2018&message=Lts&color=red"> <img src="https://img.shields.io/static/v1?style=for-the-badge&logo=ubuntu&label=Ubuntu%2020&message=Lts&color=red">
</p>

<p align="center"><img src="https://img.shields.io/badge/Service-SSH_Over_Websocket-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN_Over_Websocket-success.svg">  <img src="https://img.shields.io/badge/Service-SSH_Over_DNS-success.svg">  <img src="https://img.shields.io/badge/Service-SSLH-success.svg">  <img src="https://img.shields.io/badge/Service-Stunnel5-success.svg">  <img src= "https://img.shields.io/badge/Service-OHP_Open_Http_Puncher-success.svg">  <img src= "https://img.shields.io/badge/Service-SSTP_VPN-success.svg">  <img src= "https://img.shields.io/badge/Service-L2TP_VPN-success.svg">  <img src= "https://img.shields.io/badge/Service-PPTP_VPN-success.svg">
<p align="center"><img src="https://img.shields.io/badge/Service-SSH_OpenSSH-success.svg">  <img src="https://img.shields.io/badge/Service-SSH_Dropbear-success.svg">  <img src="https://img.shields.io/badge/Service-BadVPN-success.svg">  <img src="https://img.shields.io/badge/Service-OpenVPN-success.svg">  <img src="https://img.shields.io/badge/Service-Squid3-success.svg">  <img   src="https://img.shields.io/badge/Service-Webmin-success.svg">  <img src="https://img.shields.io/badge/Service-SlowDns-success.svg">  <p align="center"><img src="https://img.shields.io/badge/Service-XRAY-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_Websocket_TLS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_VLESS_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_gRPC_VLESS_VMESS-success.svg">  <img src="https://img.shields.io/badge/Service-XRAY_TROJAN-success.svg">  <p align="center"><img src="https://img.shields.io/badge/Service-SSR-success.svg">  <img src="https://img.shields.io/badge/Service-Trojan_Go-success.svg">  <img src="https://img.shields.io/badge/Service-WireGuard-success.svg">  <img src= "https://img.shields.io/badge/Service-Shadowsocks-success.svg">  

### Info:
* INI SCRIPT KHUSUS UNTUK MEMBUAT SERVER VPN
* HARAP DI BACA 
# SCRIPT UNTUK MEMBUAT SERVER VPN
Buat VPS Fresh atau VPS Baru dan Wajib Menggunakan User: root
* VPS AKUN ROOT
* Login VPS User menggunakan user root
* Cara langsung masuk ke akses root

```html
sudo su
```
Atau
```html
sudo -i
```
atau
```html
su
```

### Link Video Tutorial Cara Install
```html
https://www.facebook.com/100031931503057/posts/628374871570224/?app=fbl
```

## INFO TAMBAHAN , SILAHKAN DI BACA 
* MINIMAL RAM 1 GB UNTUK MENGGUNAKAN SCRIPT INI
* SILAHKAN HAPUS PROXY SQUID JIKA VPS TERASA BERAT

# Khusus Untuk OS
• Debian 10 & 9
atau
• Ubuntu 18.04 & 20.04
## Installation 
## 1.
Part 1: Update dan Upgrade
   <img src="https://img.shields.io/badge/Update%20Upgrade-green"> 
  ```html
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot
```
  
## 2.0
Login ke VPS dan Aktifkan Root Sementara
  ```html
sudo su
cd
cd

```

# 2.
Part 2: Buat Akses Root Di VPS /Root VPS
  <img src="https://img.shields.io/badge/Akses_Root%20VPS-green">
Untuk Mengizinkan Root Dan Ubah Password Login di VPS Google Cloud Platform, Aws, Dan Lain-lain
   ```html
  wget -qO- -O vpsroot.sh https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/vpsroot.sh && bash vpsroot.sh
  ```
  
### 3.
Part 3: Install Semua Layanan VPN /Install All VPN Service
  <img src="https://img.shields.io/badge/Install_Semua_Layanan_VPN%20Batch-green">
  ```html
rm -f setup.sh && apt update && apt upgrade -y && update-grub && sleep 2 && apt-get update -y && apt-get upgrade && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```

### 4. DONE / SELESAI
* • jika tidak bisa login di vps ,gunakan port ssh
* • 22, 2253

### Jangan Lupa Traktir Kopi
<a href="https://trakteer.id/sulaiman-l/tip" target="_blank"><img id="wse-buttons-preview" src="https://cdn.trakteer.id/images/embed/trbtn-red-6.png" height="40" style="border: 0px; height: 40px;" alt="Trakteer Saya"></a>
https://trakteer.id/sulaiman-l/tip

### 5. MENU, INFO ,UPDATE ,FIX
* untuk menampilkan menu
```html
menu
```
* untuk update menu dan update info
```html
updatemenu
```
* otomatis untuk memperbaiki error SSLH, WS-TLS
```html
sl-fix
```
```html
reboot
```
*
* otomatis untuk memperbaiki error Sertifikat SSL/TLS dan SUBDOMAIN
* perbaiki error di bagian acme domain
```html
slhost
```
* untuk update Sertifikat SSL/TLS
```html
certv2ray
```
```html
restart
```
*
*
*

### 6. FIX ERROR SSLH WS
# Auto Fix Error SSLH + WS-TLS 443
* 1 • Jika terjadi error di SSLH dan SSH WS-TLS nya,gunakan script ini untuk memperbaiki nya
```html
menu
 ```

* 2 • di menu lalu pilih 17 (SL-FIX Menu)
```html
17
 ```

* 3 • jika sudah selesai lalu reboot/ hidupkan ulang vps nya
```html
reboot
 ```


*
*
*


### 100 (Fix manual) Fix Error SSLH

* Perbaiki sslh yang error di vps yang tidak support sslh
* khusus yang vps nya tidak support sslh
* matikan ws-tls
```html
systemctl stop ws-tls
```
* buat user sslh / edit passwd
```html
echo sslh:x:109:114::/nonexistent:/usr/sbin/nologin >> /etc/passwd
```
* note: edit passwd dan pindah sslh nya di atas vnstat

* start sslh dan jalankan
```html
systemctl start sslh
/etc/init.d/sslh start
/etc/init.d/sslh restart
```
* lalu start ws-tls
```html
systemctl start ws-tls
```
```html
reboot
```
*done



# INFO Khusus SlowDNS
• SSH Over DNS (SlowDNS)
* untuk kecepatan nya di batasi
* speed download 2,2 Mbps (Max Speed)
* speed upload 100+ Mbps (Max Speed)
* Support semua port ssh

### Fitur Script

• CEK SEMUA IP DAN PORT (Service ALL VPN)

• SSH & OpenVPN

• SSH Over DNS (SlowDNS)

• SSH Over Websocket (Cloudflare)

• OpenVPN Over Websocket (Cloudflare)

• SSLH

• SSH CloudFront Over Websocket (Aws CloudFront Only) [OFF]

• OHP SSH & OHP Dropbear & OHP OpenVPN (OPEN HTTP PUNCHER)

• XRAY VMESS 

• XRAY VLESS

• XRAY TROJAN

• XRAY VMESS GRPC

• XRAY VLESS GRPC

• SHADOWSOCKS 

• SHADOWSOCKS OBFS

• SHADOWSOCKS xray-plugin

• SHADOWSOCKS v2ray-plugin

• SHADOWSOCKS gost-plugin

• SSR

• PPTP VPN

• L2TP VPN

• SSTP VPN

• WIREGUARD

• TROJAN GO

• Backup Data ALL Service

• Restore Data ALL Service

• Auto Fix

• Auto Update

### Os Supported

• Debian 10 & 9

• Ubuntu 18.04 & 20.04

# Service & Port

• SlowDNS                   : All Port SSH

• OpenSSH                   : 22, 2253

• Dropbear                  : 443, 109, 143, 1153

• Stunnel5                  : 443, 445, 777

• OpenVPN                   : TCP 1194, UDP 2200, SSL 990

• Websocket SSH TLS         : 443

• Websocket SSH HTTP        : 8880

• Websocket OpenVPN         : 2086

• Squid Proxy               : 3128, 8080 [OFF]

• Badvpn                    : 7100, 7200, 7300

• Nginx                     : 89

• Wireguard                 : 7070

• L2TP/IPSEC VPN            : 1701

• PPTP VPN                  : 1732

• SSTP VPN                  : 444

• Shadowsocks-R             : 1443-1543

• SS-OBFS TLS               : 2443-2543

• SS-OBFS HTTP              : 3443-3543

• XRAYS Vmess TLS           : 8443

• XRAYS Vmess None TLS      : 80

• XRAYS Vless TLS           : 8443

• XRAYS Vless None TLS      : 80

• XRAYS Trojan              : 2083

• XRAYS Vmess GRPC TLS      : 1180,3380

• XRAYS Vless GRPC TLS      : 2280,4480

• OHP SSH                   : 8181

• OHP Dropbear              : 8282

• OHP OpenVPN               : 8383

• Trojan Go                 : 2087

• CloudFront Over Websocket : [OFF]


 ### Server Information & Other Features

• Timezone                : Asia/Jakarta (GMT +7)

• Fail2Ban                : [ON]

• Dflate                  : [ON]

• IPtables                : [ON]

• Auto-Reboot             : [ON]

• IPv6                    : [OFF]

• Autoreboot On 05.00 GMT +7

• Autoreboot On 00.00 GMT +7

• Autoreboot On 12.00 GMT +7

• Autoreboot On 18.00 GMT +7

• Auto Delete Expired Account

• Full Orders For Various Services

• White Label

• Auto Fix

• Auto Update

<p align="center">
<img height=21 src="https://komarev.com/ghpvc/?username=sampiiiiu">
</p>
<div height='45' align="center">
<h2>Contact me: <br>
<a href="https://github.com/fisabiliyusri"> <img src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/github.svg" height='50'> </a>
<a href="https://facebook.com/sulaiman.xl"> <img src="https://cdn.jsdelivr.net/npm/simple-icons@3.0.1/icons/facebook.svg" height='50'> </a>
<a href="https://trakteer.id/sulaiman-l/tip"> <img src="https://cdn.trakteer.id/images/embed/trbtn-red-6.png" height='50'> </a>
</h2>
</div>
<h2 align="center">
<img height=150 src="https://github-readme-stats.vercel.app/api/top-langs/?username=fisabiliyusri&layout=compact&theme=dark">
<img height=150 src="https://github-readme-stats.vercel.app/api?username=fisabiliyusri&count_private=true&show_icons=true&theme=dark">
<h2 align="center">
