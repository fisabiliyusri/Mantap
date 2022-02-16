#!/bin/bash

echo Semua Port TCP UDP Yang Aktif:
echo $slporttcp
echo $slportudp
echo 

ipv6aku=$(ip addr show eth0 | grep "inet6\b" | awk '{print $2}' | cut -d/ -f1)
ipv4aku=$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)
ipaku=$(wget -qO- ipecho.net/plain)
hostall=$(hostname --all-ip-addresses | awk '{print $0}')
host1=$(hostname --all-ip-addresses | awk '{print $1}')
host2=$(hostname --all-ip-addresses | awk '{print $2}')
host3=$(hostname --all-ip-addresses | awk '{print $2}')
host4=$(hostname --all-ip-addresses | awk '{print $2}')
ipcidr=$(ip -4 -o addr show eth0 | awk '{print $4}')
slporttcp=sudo lsof -nP -iTCP -sTCP:LISTEN
slportudp=sudo lsof -iUDP -P -n | egrep -v '(127|::1)'

echo 
echo Alamat IPv6 internal anda adalah:
echo $ipv6aku
echo
echo Alamat IPv4 internal/ Private anda adalah:
echo $ipv4aku
echo
echo Alamat IPv4 eksternal/ Publik anda adalah:
echo $ipaku
echo
echo Semua Host adalah:
echo $host0
echo Host 1 adalah:
echo $host1
echo Host 2 adalah:
echo $host2
echo Host 3 adalah:
echo $host3
echo Host 4 adalah:
echo $host4
echo IP CIDR adalah:
echo $ipcidr
echo
