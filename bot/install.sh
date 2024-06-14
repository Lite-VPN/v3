#!/bin/sh
clear
apt update -y && apt upgrade -y
apt install python3 python3-pip git -y
apt-get install libjpeg-dev zlib1g-dev -y
cd /etc/
git clone https://github.com/Lite-VPN/v3.git
pip3 install -r /etc/adminbot/requirements.txt
### Magelang Phreaker Bash Decryptor 2027
clear
read -e -p "[*] Input Nama   : " nama
read -e -p "[*] Input Bot Token   : " bottoken
read -e -p "[*] Input Id Telegram : " admin
#Decrypted by Yaddy D Phreaker
sed -i "s/NAMA STORE/$nama/g" /etc/adminbot/config.json &> /dev/null
sed -i "s/BOT TOKEN/$bottoken/g" /etc/adminbot/config.json &> /dev/null
sed -i "s/ID TELEGRAM/$admin/g" /etc/adminbot/config.json &> /dev/null
 
cat > /etc/systemd/system/adminbot.service << END
[Unit]
Description=SGDO
After=network.target

[Service]
WorkingDirectory=/etc/bot
ExecStart=/usr/bin/python3 -m main
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl enable adminbot
systemctl start adminbot

cd
rm install.sh
echo -e "Sukses Create Panel BOT Digital Ocean /start di bot untuk mulai"
