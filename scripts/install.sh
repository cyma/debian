#!/bin/bash
# This script install dependencies

# Check sudo privileges
if [[ "${UID}" -ne 0 ]]
then
  echo "Permission denied. Run again with sudo privileges" >&2
  exit 1
fi

# Basics
BASICS_LIST="build-essential manpages-dev cmake python3-dev git curl net-tools rxvt-unicode"

# Security
SECURITY_LIST="firewalld macchanger fail2ban aide watchdog nmap openvpn mat2"

# Vim
VIM_LIST="vim-gtk ripgrep fzf universal-ctags"

# Suckless
SUCK_LIST="libxft2 libxft-dev x11-xserver-utils xorg xserver-xorg-dev \
            libxinerama-dev libxrandr-dev"

# Tmux
TMUX_LIST="tmux libevent-dev libncurses-dev"

# Utilities
UTIL_LIST="lm-sensors acpi zathura mutt firefox-esr feh pulseaudio alsa-utils vlc"

# File manager
FM_LIST="vifm atool caca-utils mediainfo highlight poppler-utils w3m"

# Packages
PACK_LIST="dh-make devscripts fakeroot lintian"

# LaTeX
TEX_LIST="texlive texlive-science texlive-pictures texlive-latex-extra \
          texlive-lang-english texlive-lang-spanish texlive-bibtex-extra \
          texlive-publishers texlive-font-utils latexmk"

# Science
SCI_LIST="wxmaxima octave openbabel-gui xdrawchem avogadro"

update_upgrade()
{
  sudo apt-get update && sudo apt-get upgrade -y
}

# Firewall post-install
firewall_config()
{
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
}

# Run
update_upgrade
sudo apt-get install -y ${BASICS_LIST} ${SECURITY_LIST} ${VIM_LIST} ${SUCK_LIST} \
  ${TMUX_LIST} ${UTIL_LIST} ${FM_LIST} ${PACK_LIST} ${TEX_LIST} ${SCI_LIST}
firewall_config
