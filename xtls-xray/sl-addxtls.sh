#!/bin/bash
# Script By SL
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################


MYIP=$(curl -sS ipv4.icanhazip.com)
clear
domain=$(cat /etc/xray/domain)
tls=$(cat /etc/xray/sl-xtls-xray.json | grep port | awk '{print $2}' | sed 's/,//g')
vl=$(cat /etc/xray/sl-xtls-xray.json | grep port | awk '{print $2}' | sed 's/,//g')
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/sl-xtls-xray.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done
uuid=$(cat /proc/sys/kernel/random/uuid)
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
muncrat="xtls-rprx-direct
sed -i '/#xray-vless-grpc-xtls$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""$muncrat""'","email": "'""$user""'"' /etc/xray/sl-xtls-xray.json
sed -i '/##xray-vmess-grpc-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""$muncrat""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/sl-xtls-xray.json
sed -i '/##xray-vmess-ws-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""$muncrat""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/sl-xtls-xray.json
sed -i '/#xray-vless-ws-xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "'""$muncrat""'","email": "'""$user""'"' /etc/xray/sl-xtls-xray.json
sed -i '/#xray-trojan-tcp-xtls$/a\#&# '"$user $exp"'\
},{"password": "'""$user""'","flow": "'""$muncrat""'","email": "'""$user""'"' /etc/xray/sl-xtls-xray.json

##vmess_base641=$( base64 -w 0 <<< $vmess_json1)
##vmesslink#1="vmess://$(base64 -w 0 /etc/xray/$user-tls.json)"
sltrojantcptlslink="trojan://${user}@${domain}:2069/sni=${domain}&security=xtls&flow=${muncrat}"
slvmessgrpclink="vmess://${uuid}@${domain}:4369/?type=grpc&encryption=auto&serviceName=GunService&security=xtls&flow=${muncrat}&sni=${domain}#$user"
slvlessgrpclink="vless://${uuid}@${domain}:4369/?mode=gun&security=xtls&encryption=none&type=grpc&serviceName=GunService&flow=${muncrat}&sni=${domain}#$user"
slvlesswslink="vless://${uuid}@${domain}:7869/?path=/vless/&security=xtls&encryption=none&sni=${domain}&flow=${muncrat}&type=ws#${user}"
slvmesswslink="vmess://${uuid}@${domain}:7869/?path=/vmess/&security=xtls&encryption=none&sni=${domain}&flow=${muncrat}&type=ws#${user}"

systemctl restart xtls-xray.service
service xtls-xray restart
service cron restart
clear
echo -e "================================="
echo -e "           XRAY XTLS ONLY        " 
echo -e "Script Create Auto Account by SL "
echo -e "================================="
echo -e "Remarks              : ${user}"
echo -e "Key/Password Trojan  : ${user}"
echo -e "Domain               : ${domain}"
echo -e "IP                   : ${MYIP}"
echo -e "Port VMess gRPC XTLS : 4369"
echo -e "Port VLess gRPC XTLS : 4369"
echo -e "Port VMess WS XTLS   : 7869"
echo -e "Port VLess WS XTLS   : 7869"
echo -e "Port Trojan TCP XTLS : 2069"
echo -e "ID                   : ${uuid}"
echo -e "Alter ID             : 0"
echo -e "Encryption           : none"
echo -e "Security             : XTLS"
echo -e "SNI                  : ${domain}"
echo -e "Flow                 : ${muncrat}"
echo -e "================================="
echo -e "Path                 : /vless/"
echo -e "Type                 : Websocket"
echo -e "Jaringan/Network     : WS"
echo -e "================================="
echo -e "Path                 : /vmess/"
echo -e "Type                 : Websocket"
echo -e "Jaringan/Network     : WS"
echo -e "================================="
echo -e "Mode                 : Gun"
echo -e "Type                 : grpc"
echo -e "Jaringan/Network     : GRPC"
echo -e "Service Name gRPC    : GunService"
echo -e "================================="
echo -e "Link Trojan TCP XTLS : "
echo -e "${sltrojantcptlslink}"
echo -e "================================="
echo -e "Link VMess GRPC XTLS : "
echo -e "${slvmessgrpclink}"
echo -e "================================="
echo -e "Link VLess GRPC XTLS : "
echo -e "${slvlessgrpclink}"
echo -e "================================="
echo -e "Link VMess WS XTLS   : "
echo -e "${slvmesswslink}"
echo -e "================================="
echo -e "Link VLess WS XTLS   : "
echo -e "${slvlesswslink}"
echo -e "================================="
echo -e "Created              : $hariini"
echo -e "Expired On           : $exp"
echo -e "=================================" 
echo -e ""
