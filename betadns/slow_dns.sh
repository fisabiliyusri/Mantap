#!/bin/bash
clear

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
CORTITLE='\033[1;41m'
DIR='/etc/slcrot/dns'
SCOLOR='\033[0m'

echo -e "${CORTITLE}           VPS CROT SLOWDNS (Beta)            ${SCOLOR}"
installslowdns() {
    echo -e "\n${YELLOW}PERHATIKAN BAHWA METODE INI MASIH\nITU DALAM FASE BETA DAN SELAIN MENJADI\nSLOWDNS MUNGKIN TIDAK BEKERJA DENGAN SEMPURNA ! ${SCOLOR}\n"
    echo -ne "${GREEN}INGIN LANJUTKAN INSTALASI ? ${YELLOW}[s/n]:${SCOLOR} "
    read resp
    [[ "$resp" != @(s|sim|S|SIM) ]] && {
	    echo -e "\n${RED}Kembali...${SCOLOR}"
	    sleep 2
	    conexao
	}
    mkdir /etc/slcrot/dns >/dev/null 2>&1
    wget -P $DIR https://github.com/fisabiliyusri/Mantap/raw/main/betadns/dns-server >/dev/null 2>&1  
    chmod 777 $DIR/dns-server >/dev/null 2>&1
    $DIR/dns-server -gen-key -privkey-file $DIR/server.key -pubkey-file $DIR/server.pub >/dev/null 2>&1
    configdns() {
        interface=$(ip a |awk '/state UP/{print $2}'| cut -d: -f1)
        iptables -F >/dev/null 2>&1
        iptables -I INPUT -p udp --dport 5300 -j ACCEPT
        iptables -t nat -I PREROUTING -i $interface -p udp --dport 53 -j REDIRECT --to-ports 5300
        ip6tables -I INPUT -p udp --dport 5300 -j ACCEPT
        ip6tables -t nat -I PREROUTING -i $interface -p udp --dport 53 -j REDIRECT --to-ports 5300
        chmod +x /bin/slowdns
        [[ $(grep -wc 'DNSStubListener=no' /etc/systemd/resolved.conf) == '0' ]] && {
            echo 'DNSStubListener=no' > /etc/systemd/resolved.conf
            systemctl restart systemd-resolved
        }
    }
    configdns >/dev/null 2>&1
    cat /dev/null > ~/.bash_history && history -c
}
initslow() {
    if ps x | grep -w dns-server | grep -v grep 1>/dev/null 2>/dev/null; then 
        screen -r -S "slow_dns" -X quit >/dev/null 2>&1
        screen -wipe > /dev/null 2>&1
        sed -i '/slow_dns/d' /etc/autostart
        echo -e "\n${RED}SLOWDNS DINONAKTIFKAN !${SCOLOR}"
        sleep 2
        conexao
    else
        echo -ne "\n${GREEN}MASUKAN INFORMASI NS DOMAIN${SCOLOR}: "
        read ns
        [[ -z "$ns" ]] && {
            echo -e "\n${RED}NS DOMAIN TIDAK VALID${SCOLOR}"
            sleep 2
            conexao
        }
        echo -e "\n${RED}[${CYAN}1${RED}] ${YELLOW}MODE SSH 22${SCOLOR}"
        echo -e "${RED}[${CYAN}2${RED}] ${YELLOW}MODE SSL 443${SCOLOR}"
        echo -ne "\n${GREEN}INFORMASI PILIHAN${SCOLOR}: "
        read opcc
        if [[ "$opcc" == '1' ]]; then
            ptdns='22'
        elif [[ "$opcc" == '2' ]]; then
            ptdns='443'
        else
            echo -e "\n${RED}PILIHAN TIDAK VALID${SCOLOR}"
            sleep 2
            conexao
        fi
        [[ $opcc == '1' ]] 
        cd /etc/slcrot/dns
        screen -dmS slow_dns ./dns-server -udp :5300 -privkey-file server.key ${ns} 0.0.0.0:${ptdns} >/dev/null 2>&1
        keypub=$(cat $DIR/server.pub)
        cd $HOME
        echo "ps x | grep 'slow_dns' | grep -v 'grep' || screen -dmS slow_dns $DIR/dns-server -udp :5300 -privkey-file /etc/slcrot/dns/server.key ${ns} 0.0.0.0:${ptdns}" >> /etc/autostart
        tmx='curl -sO https://github.com/fisabiliyusri/Mantap/raw/main/betadns/slowdns && chmod +x slowdns && ./slowdns'
        echo -e "\n${GREEN}SLOWDNS DIAKTIFKAN!${SCOLOR}"
        echo -e "\n${YELLOW}PERINTAH TERMUX${SCOLOR}: ${tmx} ${ns} ${keypub}"
        echo -ne "\n${RED}ENTER${YELLOW}Kembali ke${GREEN} MENU!${SCOLOR}"; read
        conexao
    fi
}
[[ -d $DIR ]] && {
    initslow
} || {
    installslowdns
    sleep 1
    initslow
}
