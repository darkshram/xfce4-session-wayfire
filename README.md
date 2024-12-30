This is the Wayfire support for Xfce4 >= 4.20. So, yes, this means Xfce 4.20 using Wayland.

# Install

Obviously, you need to have installed Xfce 4.20.0 and the most recent version of Wayfire. Will not work with Xfce < 4.20.

**You do not need to overwrite any files**. All required files do not conflict with existent files of current Xfce 4.20 installation.

```
git clone https://github.com/darkshram/xfce4-session-wayfire
cd xfce4-session-wayfire
sudo install -m 755 startxfce4-wayfire /usr/bin/startxfce4-wayfire
sudo install -m 644  xfce-wayfire.desktop.in /usr/share/wayland-sessions/xfce-wayfire.desktop
sudo mkdir -p /usr/share/xfce4/wayfire
sudo install -m 644 wayfire.ini /usr/share/xfce4/wayfire/wayfire.ini
sudo mkdir -p /usr/libexec/xfce4/wayfire
sudo install -m 755 xfce-wayland-components.sh /usr/libexec/xfce4/wayfire/xfce-wayland-components.sh
```

Optionally, to change desktop wallpaper:

```
sudo install -m 755 xfce4-change-wallpaper-all-displays.sh /usr/bin/xfce4-change-wallpaper-all-displays.sh
```

Usage:
```
xfce4-change-wallpaper-all-displays.sh /home/user/Images/any/image/you/want.png
```

After install, you should see a **Xfce4 session (Wayland Wayfire)** entry in the display manager. Log in. Configuration for Wayfire for Xfce may be customized editing `~/.config/xfce4/wayfire/wayfire.ini` file.

Until xfce4-screensaver gets support for wayland, I do recommend to use [gtklock](https://github.com/jovanlanik/gtklock).

# Known bugs

  - Until xfce4-panel gets support for Wayland workspaces, there is no support for workspaces in the workspaces plugin.
  - Do not try to hibernate or suspend system because xfsettingsd will exit on resume and xfce4-panel and xfdesktop will lose their elements, so you will have to either start again xfsettings, then restart panel, then kill and start again xfdesktop or simply logout and login
  - Xfce4 keyboard shortcuts will not work and you will need to add o modify whatever you need in `~/.config/xfce4/wayfire/wayfire.ini`
  - If you need to use themes for server side window decorations, you will need to install [firedecor](https://github.com/AhoyISki/Firedecor) plugin for Wayfire.
  - Until xfce4-screensaver gets support for Wayland, please use [gtklock](https://github.com/jovanlanik/gtklock) or [swaylock](https://github.com/swaywm/swaylock) instead editing `~/.config/xfce4/wayfire/wayfire.ini` (default is gtklock)
  - Because several issues in xfce4-settings and xfdesktop (they do identify monitors differently), you will not be able to change desktop wallpaper unless you do it from `xfce4-settings-editor` or using `xfce4-change-wallpaper-all-displays.sh`, provided in this repository
  - Drag and drop of window tabs does not work with xfce4-terminal and other Gtk applications, but works nice with mousepad
  - Celluloid (Gtk4) only works executing as `GDK_BACKEND=x11 celluloid`, but Gtk3 version works fine
  - Depending on your hardware and Mesa driver, try using mpv with `--vo=wlshm` or `--vo=sdl` for video output it it segfaults
  - Parole uses X11 specific code so you will see the video in a different window
  - Tested video players that actually do work with Wayland session: clapper, vlc and totem
  - Xfdashboard does not work with wayland (yet)
  - Birdtray tray icon does not start Thunderbird
  - Telegram desktop tray icon will behave weird
  - **There is a lot of protocols not yet supported by Wayland, so do not expect the same functionality as in X11**

[![sddefault](https://github.com/user-attachments/assets/e8cd9c63-8df0-4d45-819b-d3243a696a3d)](https://www.youtube.com/watch?v=laFQBWlVEKw)
