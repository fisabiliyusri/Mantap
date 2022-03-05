#!/bin/bash
clear
echo -e "Contoh Payload Websocket Yang BENAR DAN SALAH"
echo -e "CONTOH YANG BENAR"
echo -e "GET wss://bugcdncom/ HTTP/1.1[crlf]"
echo -e "CONTOH YANG SALAH"
echo -e "GET wss://bugcdncom/HTTP/1.1[crlf]"
echo -e "CONTOH YANG BENAR"
echo -e "GET wss://bugcdncom/ HTTP/1.1[crlf]Host: domainsshcom[crlf]"
echo -e "CONTOH YANG SALAH"
echo -e "GET wss://bugcdncom/HTTP/1.1[crlf]Host:domainsshcom[crlf]"
echo -e "CONTOH YANG BENAR"
echo -e "GET wss://bugcdncom/ HTTP/1.1[crlf]Host: domainsshcom[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "CONTOH YANG SALAH"
echo -e "GET wss://bugcdncom/HTTP/1.1[crlf]Host:domainsshcom[crlf]Upgrade: websocket[crlf][crlf]"
echo -e ""

