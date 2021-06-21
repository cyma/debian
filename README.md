# debian
- Dotfiles, suckless-tools, other software.


### Dependencies

###### Basics

```bash
sudo apt-get install build-essential cmake clangd python3-dev manpages-dev git curl net-tools rxvt-unicode
```

###### Security

```bash
sudo apt-get install firewalld fail2ban aide watchdog nmap macchanger openvpn mat2
```
```bash
sudo firewall-cmd --permanent --zone=public --change-interface="Interface"
```

###### Vim

```bash
sudo apt-get install vim-gtk ripgrep fzf universal-ctags nodejs npm
```
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

###### Suckless

```bash
sudo apt-get install libxft2 libxft-dev x11-xserver-utils xorg xserver-xorg-dev libxinerama-dev libxrandr-dev
```

###### Tmux

```bash
sudo apt-get install tmux libevent-dev libncurses-dev
```
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

#### Other

###### Utilities

```bash
sudo apt-get install lm-sensors acpi zathura mutt firefox-esr feh pulseaudio alsa-utils vlc
```

###### File manager

```bash
sudo apt-get install vifm atool caca-utils mediainfo highlight poppler-utils w3m
```
```bash
rm -rf ~/.config/vifm/colors
```
```bash
git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors
```

###### Packages

```bash
sudo apt-get install dh-make devscripts fakeroot lintian
```

###### LaTeX

```bash
sudo apt-get install texlive texlive-science texlive-pictures texlive-latex-extra \
  texlive-lang-english texlive-lang-spanish texlive-bibtex-extra texlive-publishers \
  texlive-font-utils latexmk
```

###### Science

```bash
sudo apt-get install wxmaxima octave openbabel-gui xdrawchem avogadro
```



### Suckless patches applied
| Patch               | Tool  | Description                                         |
| ------------------- | ----- | --------------------------------------------------- |
| always-center       | dwm   | All floating windows are centered                   |
| fakefullscreen      | dwm   | Fullscreen in client space                          |
| hide-vacant-tags    | dwm   | Prevents from drawing tags with no clients          |
| killunsel           | dwm   | Kills all visible clients that are unselected       |
| movestack           | dwm   | Move clients around in the stack and swap them      |
| noborder            | dwm   | Remove the border when there is only one window     |
| pertag              | dwm   | Keeps layout, mwfact, barpos and nmaster per tag    |
| anysize             | st    | Fill the entire space allocated to it               |
| bold-is-not-bright  | st    | Makes bold text rendered simply as bold             |
| boxdraw             | st    | Custom rendering of lines/blocks/braille characters |
| disable-bold-italic | st    | Disable bold, italic fonts                          |
| hidecursor          | st    | Hide the X cursor whenever a key is pressed         |
| newterm             | st    | Spawn a new terminal in the same CWD                |
| scrollback          | st    | Full scrollback support (4 patches)                 |
| vertcenter          | st    | Vertically center lines in the space available      |
| case-insensitive    | dmenu | Case-insensitive item matching                      |
| fuzzymatch          | dmenu | Support for fuzzy-matching                          |
| dwmlogo             | slock | Draws the dwm logo                                  |

# TODO-LIST
- Vimspector C++ .json script.
- ssh, fail2ban config.
