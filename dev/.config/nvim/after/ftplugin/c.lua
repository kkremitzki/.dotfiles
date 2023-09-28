vim.keymap.set('n', '<F5>',
  '<cmd>5split +terminal\\ gcc\\ %\\ -o\\ %.out\\ &&\\ ./%.out<CR>',
  {noremap = true})
