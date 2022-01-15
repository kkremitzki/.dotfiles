require('plugins')
require('langservers')
require('treesitter-config')
require('mappings')

-- TODO This is a suitable dark colorscheme; how can I use `morning`
-- automatically when my terminal is in light mode?
-- vim.cmd 'colorscheme pablo'
vim.cmd 'colorscheme modest'

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

-- nvim-treesitter
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
