#!/bin/bash

WALLPAPER=${1}

for i in $(xfconf-query -c xfce4-desktop -p /backdrop -l|egrep -e "screen.*/monitor.*image-path$" -e "screen.*/monitor.*/last-image$")
do
    xfconf-query -c xfce4-desktop -p $i -n -t string -s ${WALLPAPER}
    xfconf-query -c xfce4-desktop -p $i -s ${WALLPAPER}
done
xfdesktop --reload

