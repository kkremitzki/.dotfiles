vim.keymap.set('n', '<F5>',
  '<cmd>5split +terminal\\ guile\\ --no-auto-compile\\ %<cr>',
  {noremap = true}
)
