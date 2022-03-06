#!/bin/sh
set -e

# Use a sensible default for $HOME in case we are running through `lxc exec`
export HOME="${HOME:-/home/$(whoami)}"
# Consider moving dev_pkgs and langservers to txt files; update langservers.lua
# to load servers table from this file instead of maintaining lists in two
# places
dev_pkgs="neovim python3-venv direnv fzf ripgrep stow tmux cmake golang npm \
          fd-find bat curl wget bash-completion unzip"
packer_repo="https://github.com/wbthomason/packer.nvim"
packer_target="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
langservers="bashls clangd cmake cssls dockerls dotls fortls html intelephense \
             jsonls lemminx pyright rust_analyzer sqlls sumneko_lua texlab \
             tsserver vimls yamlls"

# shellcheck disable=SC2086 # Intended splitting of DEV_PKGS
sudo apt-get install --yes $dev_pkgs
[ ! -d "$packer_target" ] && \
git clone --depth 1 "$packer_repo" "$packer_target"
[ -f ~/.bashrc ] && [ ! -h ~/.bashrc ] && rm ~/.bashrc
stow -R .
sudo update-alternatives --set editor /usr/bin/nvim
sudo update-alternatives --set vim /usr/bin/nvim
sudo update-alternatives --set vi /usr/bin/nvim
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerInstall" >> nvim-packer.log 2>&1
echo >> nvim-packer.log
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" >> nvim-packer.log 2>&1
echo >> nvim-packer.log
nvim --headless -c "LspInstall --sync ${langservers}" -c q >> nvim-lsp.log 2>&1
echo >> nvim-lsp.log
