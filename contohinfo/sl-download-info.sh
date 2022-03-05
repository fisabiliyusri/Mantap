#!/bin/bash

cd /usr/bin

rm info-cek-tersedia
rm info-contoh-payload
rm info-contohws
rm info-exra-unli
rm info-tsel-opok
rm info-status-respon

wget -O info-cek-tersedia "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/contohinfo/info-cek-tersedia.sh"

wget -O info-contoh-payload "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/contohinfo/info-contoh-payload.sh"

wget -O info-contohws "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/contohinfo/info-contohws.sh"

wget -O info-exra-unli "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/contohinfo/info-exra-unli.sh"

wget -O info-status-respon "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/contohinfo/info-status-respon.sh"

wget -O info-tsel-opok "https://raw.githubusercontent.com/fisabiliyusri/Mantap/main/contohinfo/info-tsel-opok.sh"

chmod +x info-cek-tersedia
chmod +x info-contoh-payload
chmod +x info-contohws
chmod +x info-exra-unli
chmod +x info-tsel-opok
chmod +x info-status-respon

