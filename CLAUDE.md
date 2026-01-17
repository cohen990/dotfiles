# CLAUDE.md

This is a personal dotfiles repository for managing development environment configurations across macOS and Fedora Linux.

## Repository Structure

```
dotfiles/
├── setup.sh              # Main installer - creates symlinks to home directory
├── postsetup.sh          # Sets zsh as default shell
├── brew-install.sh       # Homebrew package installer (macOS/Linux)
├── dnf-packages.sh       # Fedora DNF package installer
├── packages.brewfile     # Primary Homebrew packages
├── accurx.packages.brewfile  # Work-specific packages
├── zsh/                  # Zsh shell configuration
│   ├── zshrc             # Main shell config (symlinked to ~/.zshrc)
│   ├── zprofile          # PATH and environment setup
│   └── p10k.zsh          # Powerlevel10k prompt theme
├── nvim/                 # Neovim config (LazyVim framework)
│   ├── init.lua          # Entry point
│   └── lua/              # Lua configurations and plugins
├── kitty/                # Kitty terminal emulator config
├── mise/                 # Mise version manager config (Node.js, Lua, etc.)
├── .gitconfig            # Git settings and aliases
├── .git-commit-template  # Conventional commit template
├── .vimrc                # Vim configuration
├── i3.config             # i3 window manager config
├── tmux.conf             # Tmux configuration
└── claude/               # Claude Code configuration
    └── agents/           # Custom agents (symlinked to ~/.claude/agents)
```

## Setup

1. Clone to `~/git/dotfiles`
2. Run `./setup.sh` to create symlinks
3. Run `./postsetup.sh` to set zsh as default shell
4. Install packages:
   - macOS: `./brew-install.sh`
   - Fedora: `./dnf-packages.sh` (use `-p` flag for personal machine with Steam)

## Key Conventions

- **Symlinks**: `setup.sh` uses `ln -fs` to create force-symlinks from this repo to home directory
- **Multi-platform**: Separate package managers for macOS (Homebrew) and Fedora (DNF)
- **Conventional Commits**: Uses commit template enforcing semantic versioning format
- **LazyVim**: Neovim uses LazyVim framework - customize via `nvim/lua/plugins/`

## Common Tasks

### Adding a new dotfile
1. Add the file to this repository
2. Add symlink command to `setup.sh`
3. Re-run `./setup.sh`

### Adding packages
- Homebrew: Add to `packages.brewfile` then run `brew bundle --file=packages.brewfile`
- DNF: Add to `dnf-packages.sh`

### Modifying Neovim plugins
Edit `nvim/lua/plugins/fathom.lua` or create new files in `nvim/lua/plugins/`

### Modifying shell configuration
- Environment/PATH: Edit `zsh/zprofile`
- Aliases/functions: Edit `zsh/zshrc`
- Prompt appearance: Edit `zsh/p10k.zsh`

### Adding Claude Code agents
Add markdown files to `claude/agents/`. Agent format:
```markdown
---
name: agent-name
description: What this agent does
tools: Read, Grep, Glob, Bash
model: sonnet
---

System prompt for the agent...
```
These are symlinked to `~/.claude/agents/` and available across all projects.

## Dependencies

- **Zsh** with Powerlevel10k (installed to `~/.local/share/powerlevel10k/`)
- **Homebrew** zsh plugins: zsh-autosuggestions, zsh-syntax-highlighting, zsh-vi-mode, fzf
- **Mise** for runtime version management
- **Neovim** 0.8+ for Lua support

## Git Aliases

The `.gitconfig` includes 35+ aliases. Notable ones:
- `git co` - checkout
- `git st` - status
- `git lol` - pretty log graph
- `git mpr` - merge PR
- `git reset-to <branch>` - reset to remote branch
- `git cleanup-merged` - delete merged local branches
