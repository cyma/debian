# debian
- Dotfiles, suckless-tools, other software.


Godot with vim:
1. editor settings / external
2. Exec Path: $PathToTerminalEmulator
3. Exec Flags: -- /usr/bin/vim "+call cursor({line}, {col})" {file}

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
| bold-is-not-bright  | st    | Makes bold text rendered simply as bold             |
| anysize             | st    | st on a DWM will always fill the entire space       |
| boxdraw             | st    | Custom rendering of lines/blocks/braille characters |
| disable-bold-italic | st    | Disable bold, italic fonts                          |
| hidecursor          | st    | Hide the X cursor whenever a key is pressed         |
| newterm             | st    | Spawn a new terminal in the same CWD                |
| scrollback          | st    | Scrollback support (3 patches)                      |
| vertcenter          | st    | Vertically center lines in the space available      |
| case-insensitive    | dmenu | Case-insensitive item matching                      |
| fuzzymatch          | dmenu | Support for fuzzy-matching                          |
| dwmlogo             | slock | Draws the dwm logo                                  |


# TODO-LIST
- Vim debug C++ configuration/maps.
- ssh, fail2ban config.
