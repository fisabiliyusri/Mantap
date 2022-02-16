#!/bin/bash
# Getting
# Update Script GRPC

# Link Hosting Kalian Untuk Xray
akbarvpnn="raw.githubusercontent.com/fisabiliyusri/Mantap/main/xray"

cd /usr/bin

wget -O addgrpc "https://${akbarvpnn}/addgrpc.sh"
wget -O cekgrpc "https://${akbarvpnn}/cekgrpc.sh"
wget -O delgrpc "https://${akbarvpnn}/delgrpc.sh"
wget -O renewgrpc "https://${akbarvpnn}/renewgrpc.sh"

chmod +x addgrpc
chmod +x delgrpc
chmod +x cekgrpc
chmod +x renewgrpc
cd
