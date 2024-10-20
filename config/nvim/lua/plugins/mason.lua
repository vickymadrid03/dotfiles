require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "ruby_lsp", "rubocop", "tailwindcss", "pyright" }
})

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.ruby_lsp.setup({})
