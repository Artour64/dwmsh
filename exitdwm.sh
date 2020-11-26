#/bin/bash
#i="poweroff,reboot,exit --user,suspend,hibernate,hybrid-sleep"
i="screen-off,suspend,logout,poweroff,reboot,restart-dwm"

let "l=$(echo $i | tr ',' '\n' | wc -l)"
if [ $( expr $l % 2) = 1 ]; then
	let l++
fi
let l=l/2
let s=240/$l

i=$(echo -e $i | rofi -font "Red October $s" -lines $l -i -sep ',' -dmenu -p systemctl)
if [ -z "$i" ]; then
	exit
elif [ "$i" == "logout" ]; then
	i="exit --user"
elif [ "$i" == "restart-dwm" ]; then
	#kill $(pidof dwm)
	~/dwmsh/restartdwm.sh
	exit
elif [ "$i" == "screen-off" ]; then
	~/mysh/mon-off.sh
	exit
fi
systemctl -q $i
