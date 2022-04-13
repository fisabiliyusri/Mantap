#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
echo "Checking VPS"
#EDIT IZIN
clear
echo -n > /tmp/other.txt
data=( `cat /etc/xray/sl-vmessgrpc.json | grep '^###' | cut -d ' ' -f 2`);
echo "-------------------------------";
echo "   XRAY GRPC VMess User Login";
echo "-------------------------------";
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then
akun="tidakada"
fi
echo -n > /tmp/ipvmess.txt
data2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${data2[@]}"
do
jum=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum" = "$ip" ]]; then
echo "$jum" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum2=$(cat /tmp/ipvmess.txt)
sed -i "/$jum2/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $akun";
echo "$jum2";
echo "-------------------------------"
fi
rm -rf /tmp/ipvmess.txt
done
oth=$(cat /tmp/other.txt | sort | uniq | nl)
echo "$oth";
echo "-------------------------------"
dt=( `cat /etc/xray/sl-vlessgrpc.json | grep '^###' | cut -d ' ' -f 2`);
echo "-------------------------------";
echo "   XRAY GRPC VLess User Login";
echo "-------------------------------";
for akun in "${dt[@]}"
do
if [[ -z "$akun" ]]; then
acc="No"
fi
echo -n > /tmp/ipvmess.txt
dt2=( `netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | awk '{print $5}' | cut -d: -f1 | sort | uniq`);
for ip in "${dt2[@]}"
do
jum1=$(cat /var/log/xray/access.log | grep -w $akun | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
if [[ "$jum1" = "$ip" ]]; then
echo "$jum1" >> /tmp/ipvmess.txt
else
echo "$ip" >> /tmp/other.txt
fi
jum3=$(cat /tmp/ipvmess.txt)
sed -i "/$jum3/d" /tmp/other.txt > /dev/null 2>&1
done
jum=$(cat /tmp/ipvmess.txt)
if [[ -z "$jum1" ]]; then
echo > /dev/null
else
jum2=$(cat /tmp/ipvmess.txt | nl)
echo "user : $acc";
echo "$jum3";
echo "-------------------------------"
fi
rm -rf /tmp/ipvmess.txt
done
ot=$(cat /tmp/other.txt | sort | uniq | nl)
echo "$ot";
echo "-------------------------------"
rm -rf /tmp/other.txt
