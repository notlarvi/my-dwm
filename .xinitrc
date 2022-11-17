#!/bin/sh
while true; do
    DATE_TIME=$(date +'%H:%M %a %b %d %Y')
    RAM=$(free --mega | grep Mem | awk '{print $3}')
    CPU=$(top -bn1 | grep "Cpu(s)" | \
           sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
              awk '{print 100 - $1}')
    BAT=$(cat /sys/class/power_supply/BAT0/capacity)
    xsetroot -name " [ RAM $RAM M ] [ CPU $CPU% ] [ BAT $BAT% ] [ $DATE_TIME ] "
    sleep 4
done &
exec dwm
exec setxkbmap -option caps:swapescape
