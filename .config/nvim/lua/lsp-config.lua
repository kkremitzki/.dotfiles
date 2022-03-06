-- Check if I have this module
local lsp_installer = require "nvim-lsp-installer"

-- Include the servers you want to have installed by default below

local servers = {
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  "dockerls",
  "dotls",
  "fortls",
  "html",
  "intelephense",
  "jsonls",
  "lemminx",
  "pyright",
  "rust_analyzer",
  "sqlls",
  "sumneko_lua",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end
