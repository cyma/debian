eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh) &
export &(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg) &
dbus-update-activation-environment --systemd DISPLAY &
feh --bg-scale ~/Repo/debian11.png &
xrdb ~/.Xresources &
urxvtd &
slstatus &
exec dwm
