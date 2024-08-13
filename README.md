# dotfiles

## Required software
### Stow
- Linux 
    - `sudo apt install stow -y`
- FreeBSD
    - `cd /usr/ports/sysutils/stow/`
    - `sudo make`
    - `sudo make install`

### Nvim
- `git clone https://github.com/neovim/neovim.git`
- `cd neovim`
- Linux: `sudo apt install ninja-build gettext cmake unzip curl build-essential -y`
- FreeBSD:
- `make`
- `sudo make install`

### ZSH
- Linux
    - `sudo apt install zsh -y`
- FreeBSD
    - `cd /usr/ports/shells/zsh/`
    - `sudo make`
    - `sudo make install`

#### OhMyZsh

### Tmux
- Linux
    - `sudo apt install tmux -y`
- FreeBSD
    - `cd /usr/ports/sysutils/tmux/`
    - `sudo make`
    - `sudo make install`

#### Tmuxifier
- `git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier`

#### Clone Tmux Plugin manager
- `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Stow
https://www.gnu.org/software/stow/


## Installing dotfiles
- `stow nvim tmux zsh`

## Nerdfonts
- `wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip`
# TODO
 - [ ] Setup Script
