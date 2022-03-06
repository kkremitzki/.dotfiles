-- Setup lspconfig.

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_installer = require "nvim-lsp-installer"

lsp_installer.on_server_ready(function(server)
    local opts = {capabilities=capabilities}

    -- (optional) Customize the options passed to the server

    if server.name == "sumneko_lua" then
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = {'vim'}
          }
        }
      }
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)