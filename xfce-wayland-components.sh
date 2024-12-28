#!/bin/sh

PATH="${PATH}:/usr/local/bin:/usr/libexec"
export PATH

xfce4-session
xfsettingsd
xfce4-panel
Thunar --daemon
xfdesktop

if [ -e "/usr/libexec/notifyd/xfce4-notifyd" ]; then
    /usr/libexec/notifyd/xfce4-notifyd
else
  if [ -e "/usr/lib/xfce4/notifyd/xfce4-notifyd" ]; then
    /usr/lib64/xfce4/notifyd/xfce4-notifyd
  fi
  if [ -e "/usr/lib/xfce4/notifyd/xfce4-notifyd" ]; then
    /usr/lib/xfce4/notifyd/xfce4-notifyd
  fi
fi

/usr/libexec/xfce-polkit
xfce4-power-manager

# This one may be started from [autostart] in
# ~/.config/xfce4/wayfire/wayfire.ini
if [ -e "/usr/libexec/xdg-desktop-portal-gtk" ]; then
    /usr/libexec/xdg-desktop-portal-gtk
fi

