#!/bin/bash
# This script will create symbolic links for dotfiles

repo_path=$HOME/Repo/dotfiles/

ln -s -f "$repo_path".vimrc $HOME/.vimrc
ln -s -f "$repo_path".Xresources $HOME/.Xresources
ln -s -f "$repo_path".xinitrc $HOME/.xinitrc
ln -s -f "$repo_path".inputrc $HOME/.inputrc
ln -s -f "$repo_path".tmux.conf $HOME/.tmux.conf
ln -s -f "$repo_path".bashrc $HOME/.bashrc

