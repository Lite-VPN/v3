#!/bin/bash
DF='\e[39m'
RED='\033[0;31m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
putih="\e[1;97m"
BGX="\e[104m"
blue="\e[1;96m"
NC='\e[0m'
RED='\033[0;31m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lyellow='\e[93m'
Lgreen='\e[92m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
# Getting
#satusbot
bot_kyt=$(systemctl status adminbot | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
# STATUS SERVICE  BOT 
if [[ $bot_kyt == "running" ]]; then 
   status_bot="${GREEN}🟢Online $NC${c} $NC"
else
   status_bot="${RED}❌Offline${NC} "
fi
#####
KIRI="\033[1;32m>\033[1;33m>\033[1;31m>\033[1;31m$NC"
ipsaya=$(curl -sS ipv4.icanhazip.com)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Lite-VPN/izin/main/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/LITE_VERMILION"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6283867809137"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc

echo -e "\e[32mloading...\e[0m"
clear
MYIP=$(wget -qO- ipinfo.io/ip);
clear 
echo -e "${blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${putih} ${BGX}              Welcome To Menu Bot Panel             ${NC}"
echo -e "${blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e " ${KIRI} 🤖  ${putih}STATUS BOT${NC} ( ${status_bot} )"
echo -e ""
echo -e " [01]➣  ${putih}Add Admin Bot${NC}"
echo -e " [02]➣  ${putih}Add User Bot${NC}"
echo -e " [03]➣  ${putih}Delete Bot Panel${NC}"
echo -e " [04]➣  ${putih}Stop Bot Panel${NC}"
echo -e " [05]➣  ${putih}Restart Bot Panel${NC}"
echo -e "" 
echo -e " [00] 🔙  ${putih}Back To Menu${NC}"
echo -e "${blue}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p " Select menu :  "  opt
echo -e   ""
case $opt in
01 | 1) clear ; add-bot ;;
02 | 2) clear ; userbot ;;
03 | 3) clear ; hapus-bot ;;
04 | 4) clear ; stop-bot ;;
05 | 5) clear ; restart-bot ;;
*) clear ; menu ;;
esac
