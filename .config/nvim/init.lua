require('plugins')
require('mappings')

vim.cmd 'colorscheme slate'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.completeopt = 'menu,menuone,noselect'

vim.opt.ttimeoutlen = 20
