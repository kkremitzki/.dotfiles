-- It would be nice if this checks if I have only just opened neovim;
-- for example, do I only have a [No Name] buffer?
-- In that case, I don't want to use :tabnew, just :edit would be enough.
-- This prevents me from having to save my changes but then close anoher tab.
vim.api.nvim_set_keymap('n', '<Leader>ev', ':tabnew ~/.config/nvim<CR>:tcd ~/.config/nvim<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>sv', ':source $MYVIMRC<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F12>', '<cmd>5split +term<CR>', { noremap = true })

local opts = { noremap=true, silent=true }
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
