# debian
- Dotfiles, suckless-tools, other software.



#### Suckless
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

#### Plugins
####### Vim
```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
####### Tmux
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

# TODO-LIST
- Volume keys integration.
- Dependencies package.
- Vimspector support in C++.
- ssh, fail2ban config.
- Macchanger boot service.
