#!/bin/bash
ipv6addr=$(ip addr show dev venet0 | sed -e's/^.*inet6 \([^ ]*\)\/.*$/\1/;t;d')
ipv4intr=$(ifconfig venet0:0 | grep 'inet addr' | cut -d ':' -f 2 | cut -d ' ' -f 1)
ipaku=$(wget -qO- ipecho.net/plain)
ports=${ipv4intr#*.*.*.}

echo Alamat IPv6 eksternal anda adalah:
echo $ipv6addr
echo
echo Alamat IPv4 internal anda adalah:
echo $ipv4intr
echo
echo Alamat IPv4 eksternal anda adalah:
echo $ipaku
echo
echo NAT VPS anda bisa diakses dari port berikut:
echo [$ipaku]:$ports\01 - $ports\20
