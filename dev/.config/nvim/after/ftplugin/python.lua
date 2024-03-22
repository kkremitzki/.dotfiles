-- TODO: Find an analog to this for snippets highlighted in visual mode.
-- I want to be able to run chunks of code separate from file writes
vim.keymap.set('n', '<F5>',
  '<cmd>5split +terminal\\ python3\\ -i\\ %<CR>',
  {noremap = true})
