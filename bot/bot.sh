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
wget https://raw.githubusercontent.com/Lite-VPN/v3/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/Lite-VPN/v3/main/bot/lite.zip
unzip lite.zip
pip3 install -r lite/requirements.txt

clear
echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[96;1m          ADD BOT PANEL          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e ""
read -e -p "[*] Input your Bot Token :  " bottoken
read -e -p "[*] Input Your Id Telegram :  " admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/lite/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/lite/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/lite/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/lite/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/lite/var.txt
clear

cat > /etc/systemd/system/lite.service << END
[Unit]
Description=Simple lite - @lite
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m lite
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start lite 
systemctl enable lite
systemctl restart lite
cd /root
rm -rf lite.sh
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot         : $bottoken"
echo "Admin          : $admin"
echo "Domain        : $domain"
echo "Pub            : $PUB"
echo "Host           : $NS"
echo -e "==============================="
echo "Setting done"
sleep 2
clear
echo -e ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[92mInstallations complete, type /menu on your bot\033[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p "Press !! [ ENTER ] Back To Menu"
menu
