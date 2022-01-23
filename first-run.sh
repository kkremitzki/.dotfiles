#!/bin/sh
sudo apt-get install neovim python3-venv direnv fzf ripgrep stow tmux cmake golang npm fd-find bat wget bash-completion
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
