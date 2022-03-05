#!/bin/bash
domain=$(cat /etc/xray/domain)

#Payload
echo -e "Info Opok Tsel:"
echo -e "Methode SSL/TLS Websocket Bug Cloudflare"
echo -e "Payload SSL:"
echo -e "GET wss://covid19.go.id/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI/Server Spoof:"
echo -e "covid19.go.id"
echo -e "Server Remote:"
echo -e "covid19.go.id:443"

echo -e "Exra Unli:"
echo -e "Methode SSL/TLS Websocket Bug Cloudflare"
echo -e "GET wss://v27.tiktokcdn.com/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI/Server Spoof:"
echo -e "v27.tiktokcdn.com"
echo -e "Server Remote:"
echo -e "v27.tiktokcdn.com:443"

echo -e "Contoh Payload SSH SSL WEBSOCKET CLOUDFLARE:"
echo -e "GET wss://ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE/ HTTP/1.1[crlf]Host: ISI-DENGAN-NAMA-SUBDOMAIN-SSH-JANGANPAKEIP[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI/Server Spoof:"
echo -e "ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE"
echo -e "Server Remote:"
echo -e "ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE:443"

STATUS RESPON WAKTU INJECK BUG,SSH,VPN
301/302 = berarti BUG/PAYLOAD/Port nya di BLOKIR sementara oleh ISP
400 – Bad Request = Berarti Ada yang salah di payload,subdomain,domain,bug,proxy
521 - Origin Error = Berarti masalah nya ada di subdomain/domain ,mungkin gagal saat install certifikat nya
cara atasi masalah nya buat subdomain lagi dengan cara ketik slhost lalu ketik certv2ray di vps,jika berhasil lalu reboot vps ,ketik reboot
