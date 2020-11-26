#!/bin/sh
(sleep 0.5 && /home/artour/mysh/startup.sh && wmname LG3D && dwmblocks ) &
~/mysh/monitor-auto
while true; do
	(sleep 0.5 && wmname LG3D ) &
	dwm >> ~/.dwmlog
done
