#!/bin/bash
# SL
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$( curl ipinfo.io/ip | grep $MYIP )
if [ $MYIP = $MYIP ]; then
echo -e "${NC}${GREEN}Permission Accepted...${NC}"
else
echo -e "${NC}${RED}Permission Denied!${NC}";
echo -e "${NC}${LIGHT}Fuck You!!"
exit 0
fi
clear
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/var/lib/crot/data-user-pptp")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	echo ""
	echo " Select the existing client you want to remove"
	echo " Press CTRL+C to return"
	echo " ==============================="
	echo "     No  Expired   User"
	grep -E "^### " "/var/lib/crot/data-user-pptp" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select One Client[1]: " CLIENT_NUMBER
		else
			read -rp "Select One Client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
# match the selected number to a client name
VPN_USER=$(grep -E "^### " "/var/lib/crot/data-user-pptp" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/var/lib/crot/data-user-pptp" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
# Delete VPN user
sed -i '/^"'"$VPN_USER"'" pptpd/d' /etc/ppp/chap-secrets
sed -i "/^### $VPN_USER $exp/d" /var/lib/crot/data-user-pptp
# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
clear
echo ""
echo "=========================="
echo "   PPTP Account Deleted   "
echo "=========================="
echo "Username  : $VPN_USER"
echo "Expired   : $exp"
echo "=========================="
echo "Script Mod By SL"
