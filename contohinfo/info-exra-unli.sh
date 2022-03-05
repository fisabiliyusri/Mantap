#!/bin/bash
domain=$(cat /etc/xray/domain)
clear
echo -e "Info Exra Unli:"
echo -e "Methode SSL/TLS Websocket Bug Cloudflare"
echo -e "GET wss://v27.tiktokcdn.com/ HTTP/1.1[crlf]Host: $domain[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI/Server Spoof:"
echo -e "v27.tiktokcdn.com"
echo -e "Server Remote:"
echo -e "v27.tiktokcdn.com:443"
echo -e ""


