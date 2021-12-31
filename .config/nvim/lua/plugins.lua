local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_url = 'https://github.com/wbthomason/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use 'neovim/nvim-lspconfig'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
