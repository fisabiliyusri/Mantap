#!/bin/bash
clear

echo -e "Contoh Payload SSH SSL WEBSOCKET CLOUDFLARE:"
echo -e "GET wss://ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE/ HTTP/1.1[crlf]Host: ISI-DENGAN-NAMA-SUBDOMAIN-SSH-JANGANPAKEIP[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "SNI/Server Spoof:"
echo -e "ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE"
echo -e "Server Remote:"
echo -e "ISI-DENGAN-BUG-WEBSOCKET-CLOUDFLARE:443"
echo -e ""
