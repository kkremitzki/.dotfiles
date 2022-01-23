#!/bin/sh
DEV_PKGS="neovim python3-venv direnv fzf ripgrep stow tmux cmake golang npm \
          fd-find bat wget bash-completion"
PACKER_REPO="https://github.com/wbthomason/packer.nvim"
PACKER_TARGET="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# shellcheck disable=SC2046 # Intended splitting of DEV_PKGS
sudo apt-get install $DEV_PKGS
[ ! -d "$PACKER_TARGET" ] && \
git clone --depth 1 "$PACKER_REPO" "$PACKER_TARGET"
[ ! -h ~/.bashrc ] && rm ~/.bashrc
stow -R .
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
