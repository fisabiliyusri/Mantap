#!/bin/bash
# Mod By SL
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/sshd_config;
systemctl restart sshd;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p `perl -e "print crypt("$pwe","Q4")"` root;
echo -e "Masukan Nama User Akun Baru";
read -e crot;
sudo useradd -s /bin/bash -d /home/$crot/ -m -G sudo $crot;
clear;
printf "Mohon Simpan Informasi Akun VPS Ini
============================================
Akun Root (Akun Utama)
Ip address = $(curl -Ls http://ipinfo.io/ip)
Username   = root
Password   = $pwe
============================================
User Akun Baru Dengan Akses Root (Akun Baru)
Username   = $crot
Password   = $pwe
============================================";
echo "";
exit;
