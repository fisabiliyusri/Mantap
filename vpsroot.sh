#!/bin/bash
# Mod By SL
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/sshd_config;
systemctl restart sshd;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p `perl -e "print crypt("$pwe","Q4")"` root;
clear;
printf "Mohon Simpan Informasi Akun VPS Ini
============================================
Ip address = $(curl -Ls http://ipinfo.io/ip)
Username   = root
Password   = $pwe
============================================";
echo "";
exit;
