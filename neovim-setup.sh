#!/usr/bin/env sh

set -e

langservers="bashls clangd cmake cssls dockerls dotls fortls html intelephense \
             jsonls lemminx pyright rust_analyzer sqlls sumneko_lua texlab \
             tsserver vimls yamlls"

nvim --headless -c q
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerClean"
nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync"
nvim --headless -c "TSUpdate" +q
nvim --headless -c "LspInstall --sync ${langservers}" -c q
