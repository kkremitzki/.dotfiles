return require('packer').startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    -- requires = {
    --   'nvim-lua/plenary.nvim'
    -- },
    config = function()
      require('gitsigns').setup()
    end
  }
  -- use 'neovim/nvim-lspconfig'
  use {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
      -- Load separate config file
      -- require('lsp-config')
    end
  }
  -- use {
  --   'hrsh7th/cmp-nvim-lsp',
  --   config = function()
  --     require('cmp-lsp-config')
  --   end
  -- }
  -- use 'hrsh7th/cmp-buffer'
  -- use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  -- use {
  --   'hrsh7th/nvim-cmp',
  --   config = function()
  --     -- Load separate config file
  --     require('cmp-config')
  --   end
  -- }
  -- use 'hrsh7th/cmp-nvim-lua'
  -- use 'L3MON4D3/LuaSnip'
  -- use 'saadparwaiz1/cmp_luasnip'
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   run = ':TSUpdate',
  --   config = function()
  --     require('treesitter-config')
  --     vim.opt.foldmethod = 'expr'
  --     vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  --   end
  -- }

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
    'folke/tokyonight.nvim',
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
      })
      vim.cmd[[colorscheme tokyonight]]
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
