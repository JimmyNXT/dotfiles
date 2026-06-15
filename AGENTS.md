# AGENTS.md — JimmyNXT dotfiles

## Structure

GNU Stow-managed dotfiles. Each top-level directory is a stow package:
`git/`, `zsh/`, `nvim/`, `tmux/`, `i3/`, `kitty/`, `gtk/`, `fonts/`, `yakuake/`, `tmuxinator/`, `vale/`, `nixos/`, `opencode/`, `pi/`

## Setup

```bash
# Install stow (apt/pkg), then:
stow nvim tmux zsh git i3 kitty gtk fonts yakuake tmuxinator vale
```

Prerequisites documented in `README.md`: stow, neovim, zsh + oh-my-zsh, tmux + tpm (tmux-plugins/tpm) + tmuxifier.

No bootstrap/install script exists yet (README has a TODO for one).

## Key configs

- **neovim** (`nvim/`): Based on kickstart.nvim. Uses `lazy.nvim` plugin manager. Leader key = Space. Plugins configured in `lua/plugins/*.lua`. Stylua formatting config at `.stylua.toml` (4-space indent, single quotes, 160 col width).
- **zsh** (`zsh/`): oh-my-zsh with theme `jispwoso`. Plugins: git, sudo, colored-man-pages, virtualenv. SDKMAN, NVM, Android SDK sourced at bottom.
- **tmux** (`tmux/`): prefix = `C-a`. Catppuccin mocha theme. TPM plugins: vim-tmux-navigator, tmux-yank. Splits use `|` and `-` (horizontal/vertical).
- **i3** (`i3/`): `$mod = Mod4` (Super). Font: pango:Source Code Pro 8. Volume keys via pactl.
- **kitty** (`kitty/`): Tab bar on top, powerline style.
- **gtk** (`gtk/`): Catppuccin-style GTK theme configs for 2/3/4.

## NixOS config (`nixos/NixOS-Config/`)

Standalone flake-managed NixOS config. Separate git history within the repo.

```bash
sudo nixos-rebuild switch --flake .#HP-Laptop
```

Structure: `flake.nix` → `configuration.nix` (shared), `modules/` (shared modules), `hosts/<device>/` (per-device). See `NixOS-Config/README.md`.

```bash
nix develop .#python   # python dev shell (python3, pip, ruff, black, mypy)
nix flake update       # update flake inputs
sudo nix-collect-garbage -d
```

## Git aliases (from `git/.gitconfig`)

`st`, `co`, `br`, `ci`, `lg` (log --oneline --graph --all). Editor: nvim.

## OpenCode config (`opencode/`)

Custom OpenCode CLI setup with local Ollama providers (`opencode/.config/opencode/opencode.json`). Includes agents, skills, MCP servers (rfc-server, searxng).
