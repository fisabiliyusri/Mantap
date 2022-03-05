#!/bin/bash
domain=$(cat /etc/xray/domain)
clear

echo -e "Info Opok Tsel:"
echo -e "Methode SSL/TLS Websocket Bug Cloudflare"
echo -e "Payload SSL:"
echo -e "GET wss://covid19.go.id/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI/Server Spoof:"
echo -e "covid19.go.id"
echo -e "Server Remote:"
echo -e "covid19.go.id:443"
echo -e ""


