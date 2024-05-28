from adminbot import *

@bot.on(events.NewMessage(pattern=r"(?:.menu|/menu)$"))
@bot.on(events.CallbackQuery(data=b'menu'))
async def menu(event):
	inline = [
[Button.inline("✨ ssʜ ᴍᴇɴᴜ ✨","ssh")],
[Button.inline("✨ ᴠᴍᴇss ᴍᴇɴᴜ ✨","vmess"),
Button.inline("✨ ᴠʟᴇss ᴍᴇɴᴜ ✨","vless")],
[Button.inline("✨ ᴛʀᴏᴊᴀɴ ᴍᴇɴᴜ ✨","trojan"),
Button.inline("✨ sᴇᴛᴛɪɴɢ ᴍᴇɴᴜ ✨","setting")],
[Button.inline("✨ ᴠᴘs ɪɴғᴏ sᴇʀᴠɪᴄᴇ ✨","info")]]
	ox = requests.get(f"https://ipv4.icanhazip.com").text.strip()
	bz = f" curl -sS https://raw.githubusercontent.com/myridwan/izinvps/ipuk/ip | grep '{ox}'| cut -d ' ' -f4 "
	bo = subprocess.check_output(bz, shell=True).decode("ascii").strip()
	if not ox != bo:
		sender = await event.get_sender()
		val = valid(str(sender.id))
		if val == "false":
			try:
				await event.answer("Akses Ditolak", alert=True)
			except:
				await event.reply("Akses Ditolak")
		elif val == "true":
			sh = f' cat /etc/ssh/.ssh.db | grep "###" | wc -l'
			ssh = subprocess.check_output(sh, shell=True).decode("ascii")
			vm = f' cat /etc/vmess/.vmess.db | grep "###" | wc -l'
			vms = subprocess.check_output(vm, shell=True).decode("ascii")
			vl = f' cat /etc/vless/.vless.db | grep "###" | wc -l'
			vls = subprocess.check_output(vl, shell=True).decode("ascii")
			tr = f' cat /etc/trojan/.trojan.db | grep "###" | wc -l'
			trj = subprocess.check_output(tr, shell=True).decode("ascii")
			hap = subprocess.call(["systemctl", "is-active", "--quiet", "haproxy"])
			sdss = f" cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/PRETTY_NAME//g'"
			namaos = subprocess.check_output(sdss, shell=True).decode("ascii")
			ipvps = f" curl -s ipv4.icanhazip.com"
			ipsaya = subprocess.check_output(ipvps, shell=True).decode("ascii")
			citsy = f" cat /etc/xray/city"
			city = subprocess.check_output(citsy, shell=True).decode("ascii")
			if(hap == 0):
				hap1 = f'🟢'
			else:
				hap1 = f'🔴'
			ngx = subprocess.call(["systemctl", "is-active", "--quiet", "nginx"])
			if(ngx == 0):
				ngx1 = f'🟢'
			else:
				ngx1 = f'🔴'
			xr = subprocess.call(["systemctl", "is-active", "--quiet", "xray"])
			if(xr == 0):
				xr1 = f'🟢'
			else:
				xr1 - f'🔴'
			sh = subprocess.call(["systemctl", "is-active", "--quiet", "ws"])
			if(sh == 0):
				ws1 = f'🟢'
			else:
				ws1 = f'🔴'
			msg = f"""
━━━━━━━━━━━━━━━━━━━━━━━ 
**👑          ᴀᴅᴍɪɴ ᴘᴀɴᴇʟ ᴍᴇɴᴜ             👑**
━━━━━━━━━━━━━━━━━━━━━━━ 
**» ᴏs     :** `{namaos.strip().replace('"','')}`
**» ᴅᴏᴍᴀɪɴ :** `{DOMAIN}`
**» ɪᴘ ᴠᴘs :** `{ipsaya.strip()}`
**» Total Account Created:** 

**» 🚀ssʜ ᴏᴠᴘɴ    :** `{ssh.strip()}` __account__
**» 🎭xʀᴀʏ ᴠᴍᴇss  :** `{vms.strip()}` __account__
**» 🗼xʀᴀʏ ᴠʟᴇss  :** `{vls.strip()}` __account__
**» 🎯xʀᴀʏ ᴛʀᴏᴊᴀɴ :** `{trj.strip()}` __account__
━━━━━━━━━━━━━━━━━━━━━━━ 
"""
			x = await event.edit(msg,buttons=inline)
			if not x:
				await event.reply(msg,buttons=inline)
	else:
		await event.respond(f"** You Dont Have Access**")


