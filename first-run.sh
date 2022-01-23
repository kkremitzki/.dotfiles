#!/bin/sh
dev_pkgs="neovim python3-venv direnv fzf ripgrep stow tmux cmake golang npm \
          fd-find bat wget bash-completion unzip"
packer_repo="https://github.com/wbthomason/packer.nvim"
packer_target="${HOME:-/home/$(whoami)}/.local/share/nvim/site/pack/packer/start/packer.nvim"
langservers="bashls clangd cmake html jsonls pyright rust_analyzer sqlls \
             sumneko_lua vimls yamlls"

# shellcheck disable=SC2086 # Intended splitting of DEV_PKGS
sudo apt-get install --yes $dev_pkgs
[ ! -d "$packer_target" ] && \
git clone --depth 1 "$packer_repo" "$packer_target"
[ -f ~/.bashrc ] && [ ! -h ~/.bashrc ] && rm ~/.bashrc
stow -R .
sudo update-alternatives --set editor /usr/bin/nvim
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --set vi /usr/bin/nvim
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" > nvim-packer.log 2>&1
nvim --headless -c "LspInstall --sync ${langservers}" -c q > nvim-lsp.log 2>&1
