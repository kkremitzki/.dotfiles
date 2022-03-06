return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use {
    'nvim-lua/plenary.nvim',
    config = function()
      require 'plenary.async'
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup{
        on_attach = function(bufnr)
          local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
          end

          -- Navigation
          map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
          map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

          -- Actions
          map('n', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
          map('v', '<leader>hs', '<cmd>Gitsigns stage_hunk<CR>')
          map('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
          map('v', '<leader>hr', '<cmd>Gitsigns reset_hunk<CR>')
          map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
          map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
          map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
          map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
          map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
          map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
          map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
          map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
          map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

          -- Text object
          map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
          map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  }
  use 'neovim/nvim-lspconfig'
  -- use {
  --   'williamboman/nvim-lsp-installer',
  --   config = function()
  --     require('langservers')
  --   end
  -- }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('treesitter-config')
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end
  }

  use 'vimwiki/vimwiki'
  use 'romainl/vim-cool'
  use 'tpope/vim-vinegar'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'alcesleo/vim-uppercase-sql'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'ellisonleao/gruvbox.nvim',
    config = function()
      vim.cmd 'colorscheme gruvbox'
      vim.cmd 'highlight! Normal ctermbg=NONE guibg=NONE'
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
