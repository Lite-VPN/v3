#!/usr/bin/bash

function send_log(){
domen=`cat /etc/xray/domain`
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
DATE=$(date +'%Y-%m-%d') 
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>☉━━━━━━━━━━━━━━━☉</code>
⚠️ 𝗩𝗺𝗲𝘀𝘀 𝗡𝗼𝘁𝗶𝗳 ⚠️
<code>☉━━━━━━━━━━━━━━━☉</code>
<b>DOMAIN : ${domen} </b>
<b>ISP : ${ISP} $CITY</b>
<b>DATE LOGIN : $DATE</b>
<b>USERNAME : $user </b>
<b>TOTAL LOGIN IP : ${jum2} </b>
<code>☉━━━━━━━━━━━━━━━☉</code>
     <b>TIME LOGIN : IP LOGIN </b>
<code>$lastlogin</code>
<code>☉━━━━━━━━━━━━━━━☉</code>
<i>Multi Login Auto Lock Account...</i>
"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
}
function vmip(){
#LIMITVMESSIP
echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/kyt/limit/vmess/ip`);
#Decrypted By YADDY D PHREAKER
    for user in "${data[@]}"
    do
        iplimit=$(cat /etc/kyt/limit/vmess/ip/$user)
        lastlogin=$(cat /var/log/xray/access.log | grep -w "$user" | tail -n 500 | cut -d " " -f 2 | tail -1)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
        cekcek=$(echo -e "$ehh" | wc -l);
        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
             #     sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
              #    sed -i "/^### $user $exp/d" /etc/vmess/.vmess.db
                  systemctl restart xray >> /dev/null 2>&1
                  jum2=$(cat /tmp/ipvmess.txt | wc -l)
                  rm -rf /etc/kyt/limit/vmess/ip/$user
                  send_log
                else
            echo ""
        fi
        sleep 0.1
    done
}
function vlip(){
#LIMITVLESSIP
echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/kyt/limit/vless/ip`);
#Decrypted By YADDY D PHREAKER
    for user in "${data[@]}"
    do
        iplimit=$(cat /etc/kyt/limit/vless/ip/$user)
        lastlogin=$(cat /var/log/xray/access.log | grep -w "$user" | tail -n 500 | cut -d " " -f 2 | tail -1)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
        cekcek=$(echo -e "$ehh" | wc -l);
        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
            #      sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
             #     sed -i "/^### $user $exp/d" /etc/vless/.vless.db
                  systemctl restart xray >> /dev/null 2>&1
                  jum2=$(cat /tmp/ipvless.txt | wc -l)
                  rm -rf /etc/kyt/limit/vless/ip/$user
                  send_log
                else
            echo ""
        fi
        sleep 0.1
    done
}
function trip(){
#LIMITIPTROJAN
echo -n > /var/log/xray/access.log
sleep 4
data=( `ls /etc/kyt/limit/trojan/ip`);
#Decrypted By YADDY D PHREAKER
    for user in "${data[@]}"
    do
        iplimit=$(cat /etc/kyt/limit/trojan/ip/$user)
        lastlogin=$(cat /var/log/xray/access.log | grep -w "$user" | tail -n 500 | cut -d " " -f 2 | tail -1)
        ehh=$(cat /var/log/xray/access.log | grep "$user" | cut -d " " -f 3 | sed 's/tcp://g' | cut -d ":" -f 1 | sort | uniq);
        cekcek=$(echo -e "$ehh" | wc -l);
        if [[ $cekcek -gt $iplimit ]]; then
            exp=$(grep -w "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
                #  sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
                #  sed -i "/^### $user $exp/d" /etc/trojan/.trojan.db
                  systemctl restart xray >> /dev/null 2>&1
                  jum2=$(cat /tmp/iptrojan.txt | wc -l)
                  rm -rf /etc/kyt/limit/trojan/ip/$user
                  send_log
                else
            echo ""
        fi
        sleep 0.1
    done
}

if [[ ${1} == "vmip" ]]; then
vmip
elif [[ ${1} == "vlip" ]]; then
vlip
elif [[ ${1} == "trip" ]]; then
trip
fi




