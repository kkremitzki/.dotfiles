vim.opt.shiftwidth = 2
vim.keymap.set('n', '<F5>',
  '<cmd>5split +terminal\\ ./%<CR>',
  {noremap = true})
