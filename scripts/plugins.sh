#!/bin/bash

# This script handles external repositories in order to get plugins working
# on vim and others.

repo_path=$HOME/Repo/dotfiles/

# Vim post-install (Plugin Manager)
vim_post()
{
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  if [[ -d '~/.vim/undodir' ]]
  then
      echo 'undodir directory already exists'
  else
      mkdir ~/.vim/undodir
  fi
}


# Tmux post-install (Plugin Manager)
tmux_post()
{
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

# Vifm colors
vifm_colors()
{
  rm -rf ~/.vifm/colors
  git clone https://github.com/vifm/vifm-colors ~/.vifm/colors
  ln -s -f "$repo_path"vifmrc $HOME/.vifm/vifmrc
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
    vifm_colors
    ;;
  2)
    vim_post
    ;;
  3)
    tmux_post
    ;;
  4)
    vifm_colors
    ;;
  5)
    return 0
    ;;
  *)
    echo "Incorrect input" >&2
    return 1
    ;;
esac
