

#Payload

Opok Tsel:
Payload SSL:
GET wss://covid19.go.id/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
SNI/Server Spoof:
covid19.go.id
Server Remote:
covid19.go.id:443

Exra Unli:
GET wss://v27.tiktokcdn.com/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]
SNI/Server Spoof:
v27.tiktokcdn.com
Server Remote:
v27.tiktokcdn.com:443

Contoh Payload SSH SSL:
GET wss://ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE/ HTTP/1.1[crlf]Host: ISI-DENGAN-NAMA-SUBDOMAIN-SSH-JANGANPAKEIP[crlf]Upgrade: websocket[crlf][crlf]
SNI/Server Spoof:
ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE
Server Remote:
ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE:443

STATUS RESPON WAKTU INJECK BUG,SSH,VPN
301/302 = berarti BUG/PAYLOAD/Port nya di BLOKIR sementara oleh ISP
400 – Bad Request = Berarti Ada yang salah di payload,subdomain,domain,bug,proxy
521 - Origin Error = Berarti masalah nya ada di subdomain/domain ,mungkin gagal saat install certifikat nya
cara atasi masalah nya buat subdomain lagi dengan cara ketik slhost lalu ketik certv2ray di vps,jika berhasil lalu reboot vps ,ketik reboot
