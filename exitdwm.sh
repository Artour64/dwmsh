#/bin/bash
#i="poweroff,reboot,exit --user,suspend,hibernate,hybrid-sleep"
i="suspend,logout,restart-dwm,screen-off,poweroff,reboot"
i=$(echo -e $i | rofi -i -sep ',' -dmenu -p systemctl)
if [ "$i" == "logout" ]; then
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
