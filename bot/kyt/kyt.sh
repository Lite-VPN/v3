
#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
grenbo="\e[92;1m"
NC='\e[0m'
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/LITE-VPN/v3/main/bot/kyt.zip
unzip kyt.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf kyt.zip
clear
wget https://raw.githubusercontent.com/LITE-VPN/v3/main/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt
chmod +x kyt.sh
chmod +x /usr/bin/bot/kyt
