vim.opt.background = 'light'
vim.opt.termguicolors = true

-- bootstrap packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_url = 'https://github.com/wbthomason/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
end

require('plugins')
require('mappings')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.opt.number = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
-- Backspace spaces as if they were a 4-length tabstop
vim.opt.softtabstop = 4
vim.opt.completeopt = 'menu,menuone,noselect'

vim.opt.ttimeoutlen = 20
vim.opt.updatetime = 250

-- Ignore case only when all-lowercase is used
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Allow mouse use in everything but `hit-enter` and `more-prompt`
vim.opt.mouse = 'a'
-- Default split behavior seems a bit disorienting with current placement of
-- text replaced with new split, so split below instead
vim.opt.splitbelow = true

-- Do not start with folds
vim.opt.foldenable = false
