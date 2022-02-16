-- It would be nice if this checks if I have only just opened neovim;
-- for example, do I only have a [No Name] buffer?
-- In that case, I don't want to use :tabnew, just :edit would be enough.
-- This prevents me from having to save my changes but then close anoher tab.
vim.api.nvim_set_keymap('n', '<Leader>ev', ':tabnew ~/.config/nvim<CR>:tcd ~/.config/nvim<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true })
