#!/bin/bash
Green="\e[92;1m"
RED="\033[31m"
NC='\033[0m'
OR='\033[1;93m'
grenbo="\e[92;1m"

NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)
#color
rm -rf /usr/bin/adminbot/database.db
rm -rf /usr/bin/adminbot.session
uuid=$(tr </dev/urandom -dc a-z | head -c15)
#install
apt update && apt upgrade
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/LITE-VPN/v3/main/bot/adminbot.zip
unzip adminbot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf adminbot.zip
clear
wget https://raw.githubusercontent.com/LITE-VPN/v3/main/bot/adminbot.zip
unzip adminbot.zip
pip3 install -r adminbot/requirements.txt
#isi data
echo ""
echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
printf "\e[1;92m   .::.\e[0m\e[1;77mADD SIMPLE MYVPN TELEGRAM \e[1;92m.::.\e[0m\n"
echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
cat >/usr/bin/adminbot/var.txt <<EOF
BOT_TOKEN="$bottoken"
ADMIN="$admin"
DOMAIN="$domain"
PUB="$PUB"
HOST="$NS"
SESSIONS="$uuid"
USER1="557345429"
USER2="127484543"
USER3="657482434"
USER4="346482429"
USER5="345582323"
USER6="237482359"
USER7="447482429"
USER8="562487456"
USER9="234482429"
USER10="753743453"
EOF

systemctl daemon-reload
systemctl start adminbot 
systemctl enable adminbot
systemctl restart adminbot
cd /root
fun_bar() {
        CMD[0]="$1"
        CMD[1]="$2"
        (
            [[ -e $HOME/fim ]] && rm $HOME/fim
            ${CMD[0]} -y >/dev/null 2>&1
            ${CMD[1]} -y >/dev/null 2>&1
            touch $HOME/fim
        ) >/dev/null 2>&1 &
        tput civis
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
        while true; do
            for ((i = 0; i < 8; i++)); do
                echo -ne "ðŸš¥"
                sleep 0.1s
            done
            [[ -e $HOME/fim ]] && rm $HOME/fim && break
            echo -e "\033[0;33m]"
            sleep 1s
            tput cuu1
            tput dl1
            echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
        done
        echo -e "\033[0;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
        tput cnorm
    }
    sssssss() {
        sleep 5
    }
    sssssssss() {
        sleep 5
    }
    ssssssssssss() {
        sleep 2
    }

    echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
    printf "\e[1;92m   .::.\e[0m\e[1;77mBOT SIMPLE MYVPN TELEGRAM \e[1;92m.::.\e[0m\n"
    echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
    echo -e ""
    echo -e "Setting up Telegram BOT"
    fun_bar 'sssssss'
    echo -e "Input Data API TOKEN"
    fun_bar 'sssssssss'
    echo -e "Input your ID"
    fun_bar 'ssssssssssss'
    echo -e ""
    echo -e ""
    clear
    BOTTSSSTT=$(systemctl status adminbot | grep active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g')
    if [[ $BOTTSSSTT == "running" ]]; then
        BOTBOTTTTSUDADHTTT="${grenbo}ðŸŸ¢ Online${NC}"
    else
        BOTBOTTTTSUDADHTTT="${RED}ðŸ”´ Offline${NC}"
    fi
    echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
    echo -e "       YOUR ðŸ¤–BOT STATUS $BOTBOTTTTSUDADHTTT"
    echo -e "  ${OR}â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€${NC}"
    echo -e "  You can start the bot with the command"
    echo -e "     (/menu Atau .menu) On your BOT"
    echo -e "   then you can add several admins / id"
    echo -e "       in other settings no.15"
    echo -e ""
clear

cat > /etc/systemd/system/adminbot.service << END
[Unit]
Description=Simple adminbot - @adminbot
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m adminbot
Restart=always

[Install]
WantedBy=multi-user.target
END

echo " Installations complete, type /menu on your bot"
rm -rf adminbot.zip
rm -rf bot.zip

