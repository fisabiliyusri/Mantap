#!/bin/bash
# ==========================================


cd /usr/bin
rm -rf restart
rm -r restart
rm restart
rm -r sslh-fix-reboot
rm -rf sslh-fix-reboot
rm sslh-fix-reboot
rm -r updatemenu
rm -rf updatemenu
rm updatemenu
rm -r menu
rm -rf menu
rm updatemenu

cd /usr/bin
wget -O sslh-fix-reboot "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/sslh-fix/sslh-fix-reboot.sh"
wget -O restart "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/ssh/restart.sh"
wget -O updatemenu "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/update/updatemenu.sh"
wget -O menu "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/update/menu.sh"

cd /usr/bin
chmod +x sslh-fix-reboot
chmod +x restart
chmod +x updatemenu
chmod +x menu

cd /root/
# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.

sslh-fix-reboot
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
iptables -I INPUT -p udp --dport 5300 -j ACCEPT
iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

cd /root/
