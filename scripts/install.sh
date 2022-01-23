#!/bin/bash
# This script install dependencies

# Check sudo privileges
if [[ "${UID}" -ne 0 ]]
then
  echo "Permission denied. Run again with sudo privileges" >&2
  exit 1
fi

# Basics
BASICS_LIST="build-essential manpages-dev cmake clangd python3-dev default-jdk mono-complete git curl net-tools rxvt-unicode nextcloud-desktop"
# firmware-misc-nonfree, firmware-linux-nonfree, mono-complete and desktop-base, install manually.

# Security
SECURITY_LIST="gnome-keyring seahorse debsecan apt-listchanges apt-listbugs resolvconf firewalld firewall-config macchanger fail2ban exim4 watchdog nmap openvpn mat2 debsums lynis
needrestart libpam-tmpdir auditd sysstat clamav arp-scan aircrack-ng hydra"
# Aide removed, install manually.

# Vim
VIM_LIST="vim-gtk ripgrep fzf universal-ctags nodejs npm"

# Suckless
SUCK_LIST="libxft2 libxft-dev x11-xserver-utils xorg xserver-xorg-dev \
            libxinerama-dev libxrandr-dev"

# Tmux
TMUX_LIST="tmux libevent-dev libncurses-dev"

# Utilities
UTIL_LIST="calcurse lm-sensors acpi acpid zathura libreoffice mutt firefox-esr feh pulseaudio alsa-utils vlc audacity figlet scrot"

# File manager
FM_LIST="vifm atool caca-utils mediainfo highlight poppler-utils w3m w3m-img imagemagick"

# Packages
PACK_LIST="dh-make devscripts fakeroot lintian dia qtcreator"

# LaTeX
TEX_LIST="texlive texlive-science texlive-pictures texlive-latex-extra \
          texlive-lang-english texlive-lang-spanish texlive-bibtex-extra \
          texlive-font-utils latexmk"

# Science
SCI_LIST="octave"
# openbabel-gui, xdrawchem and avogadro removed, install manually.

# Godot
GODOT_LIST="godot3"

update_upgrade()
{
  sudo apt-get update && sudo apt-get upgrade -y
}

install_packages()
{
    sudo apt-get install -y ${BASICS_LIST} \
        ${SECURITY_LIST} \
        ${VIM_LIST}      \
        ${SUCK_LIST}     \
        ${TMUX_LIST}     \
        ${UTIL_LIST}     \
        ${FM_LIST}       \
        ${PACK_LIST}     \
        ${TEX_LIST}      \
        ${SCI_LIST}      \
        ${GODOT_LIST}

}

# Firewall post-install
firewall_config()
{
    echo ''
    echo ''
    echo ''
    read -p "Configure firewalld [Y/n] " CONFIGURE_FIREWALLD
    echo "${CONFIGURE_FIREWALLD}"
    if [[ ( "${CONFIGURE_FIREWALLD}" == "y" )  ||  (( "${USER_CONFIRMATION}" == "Y" )) ]]
    then
        echo "Enable firewalld interface"
        # Show available interfaces
        ip a | grep ': <' | awk -F ':' '{print $1, $2}'
        echo ''
        # Ask for the user interface name
        read -p "Enter interface name: " INTERFACE_NAME
        # Confirm interface name
        read -p "Confirm enabling firewalld for interface ${INTERFACE_NAME} [Y/n] " USER_CONFIRMATION
        echo "${USER_CONFIRMATION}"
        if [[ ( "${USER_CONFIRMATION}" != "y" )  && (( "${USER_CONFIRMATION}" != "Y" )) ]]
        then
        echo "Operation canceled"
        else
        # Enable firewalld
        sudo firewall-cmd --permanent --zone=public --change-interface=${INTERFACE_NAME}
        fi
  else
      echo "Firewalld not configured"
  fi
}

# Run
update_upgrade
install_packages
firewall_config
