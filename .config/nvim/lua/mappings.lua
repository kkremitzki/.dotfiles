vim.api.nvim_set_keymap('n', '<Leader>ev', ':tabnew ~/.config/nvim<CR>:tcd ~/.config/nvim<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true })
