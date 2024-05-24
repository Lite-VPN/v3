#!/bin/bash
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
yellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'
grenbo="\e[92;1m"
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

duration=6
frames=("██10%" "█████35%" "█████████65%" "█████████████80%" "█████████████████████90%" "█████████████████████████100%")

# Menghitung jumlah frame
num_frames=${#frames[@]}

# Menghitung jumlah iterasi
num_iterations=$((duration))

# Fungsi untuk menampilkan animasi loading berwarna

Loading_Animasi() {
    for ((i = 0; i < num_iterations; i++)); do
        clear
        index=$((i % num_frames))
        color_code=$((31 + i % 7))
echo ""
echo ""
echo ""
echo -e "\e[1;${color_code}m ${frames[$index]}\e[0m"
sleep 0.5
    done
}

# Menjalankan animasi loading

# Menampilkan pesan setelah animasi selesai
function Loading_Succes() {
clear
echo -e  "\033[5;32mSucces\033[0m"
sleep 1
clear
}



REPO="https://github.com/Lite-VPN/v3/blob/main/config/haproxy.cfg"
# fixhap fix Haproxy
clear
echo -e "${BlueCyan} ------------------------- ${Xark} "
echo -e "${ungu}             FIXHAP            $ {Xark} "
echo -e "${BlueCyan} ------------------------- ${Xark} "
echo -e ""
read -p " Input Your Domain : " -e domain

Loading_Animasi
Loading_Succes

rm -fr /etc/xray/domain
echo "${domain}" > /etc/xray/domain
systemctl stop haproxy
systemctl stop nginx
wget -O /etc/haproxy/haproxy.cfg "${REPO}haproxy.cfg" >/dev/null 2>&1
wget -O /etc/nginx/conf.d/xray.conf "${REPO}xray.conf" >/dev/null 2>&1
sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
curl ${REPO}nginx.conf > /etc/nginx/nginx.conf

cat /etc/xray/xray.crt /etc/xray/xray.key | tee /etc/haproxy/hap.pem

systemctl restart nginx
systemctl restart haproxy
