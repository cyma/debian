#!/bin/bash

# This script handles external repositories in order to get plugins working
# on vim and others.

# Vim post-install (Plugin Manager)
vim_post()
{
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

# Tmux post-install (Plugin Manager)
tmux_post()
{
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

# Vifm colors
vifm_colors()
{
  rm -rf ~/.config/vifm/colors
  git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors
}

# Vifm post-install (Colorschemes)
vifm_post()
{
  if [[ -d "${HOME}/.config/vifm/" ]]
  then
    vifm_colors
  else
    echo "Vifm directory not detected. Run vifm to create it"
  fi
}

# Run
echo "1. All"
echo "2. Vim"
echo "3. Tmux"
echo "4. Vifm"
echo "5. Exit"
echo "--------"

read -p "Enter option: " MENU_OPT

case ${MENU_OPT} in
  1)
    vim_post
    tmux_post
    vifm_post
    ;;
  2)
    vim_post
    ;;
  3)
    tmux_post
    ;;
  4)
    vifm_post
    ;;
  5)
    return 0
    ;;
  *)
    echo "Incorrect input" >&2
    return 1
    ;;
esac
