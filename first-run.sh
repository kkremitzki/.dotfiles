#!/bin/sh
set -e

# Use a sensible default for $HOME in case we are running through `lxc exec`
export HOME="${HOME:-/home/$(whoami)}"

# Consider moving dev_pkgs and langservers to txt files; update langservers.lua
# to load servers table from this file instead of maintaining lists in two
# places
dpkgs=$(cat dpkgs.txt)
packer_repo="https://github.com/wbthomason/packer.nvim"
packer_target="${HOME}/.local/share/nvim/site/pack/packer/start/packer.nvim"
p10k_repo="https://github.com/romkatv/powerlevel10k"
p10k_target="${HOME}/.local/share/powerlevel10k"
langservers="bashls clangd cmake cssls dockerls dotls fortls html intelephense \
             jsonls lemminx pyright rust_analyzer sqlls sumneko_lua texlab \
             tsserver vimls yamlls"

# shellcheck disable=SC2086 # Intended splitting of dpkgs
sudo apt-get install --yes $dpkgs
[ ! -d "$packer_target" ] && \
git clone --depth 1 "$packer_repo" "$packer_target"
[ ! -d "$p10k_target" ] && \
git clone --depth 1 "$p10k_repo" "$p10k_target"
[ -f ~/.bashrc ] && [ ! -h ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.config/kxkbrc ] && [ ! -h ~/.config/kxkbrc ] && rm ~/.config/kxkbrc
stow -R .
# sudo update-alternatives --set editor /usr/bin/nvim
# sudo update-alternatives --set vim /usr/bin/nvim
# sudo update-alternatives --set vi /usr/bin/nvim
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerClean" >> nvim-packer.log 2>&1
echo >> nvim-packer.log
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" >> nvim-packer.log 2>&1
echo >> nvim-packer.log
nvim --headless -c "TSUpdate" +q >> nvim-packer.log 2>&1
echo >> nvim-packer.log
nvim --headless -c "LspInstall --sync ${langservers}" -c q >> nvim-lsp.log 2>&1
echo >> nvim-lsp.log
