#!/bin/sh
dev_pkgs="neovim python3-venv direnv fzf ripgrep stow tmux cmake golang npm \
          fd-find bat wget bash-completion unzip"
packer_repo="https://github.com/wbthomason/packer.nvim"
packer_target="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

# shellcheck disable=SC2046 # Intended splitting of DEV_PKGS
sudo apt-get install --yes $dev_pkgs
[ ! -d "$packer_target" ] && \
git clone --depth 1 "$packer_repo" "$packer_target"
[ ! -h ~/.bashrc ] && rm ~/.bashrc
stow -R .
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'LspInstall --sync'
sudo update-alternatives --set editor /usr/bin/nvim
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --set vi /usr/bin/nvim
