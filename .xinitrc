eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh) &
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg) &
dbus-update-activation-environment --systemd DISPLAY &
bash ~/.screenlayout/laptop_off.sh &
feh --bg-scale ~/Repo/debian11.png &
xrdb ~/.Xresources &
urxvtd &
slstatus &
xset b off &
xset r rate 200 50 &
exec dwm
