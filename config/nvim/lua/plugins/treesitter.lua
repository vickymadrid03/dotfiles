local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "vim", "ruby", "javascript", "typescript", "dockerfile", "elixir", "eex", "html", "json", "python", "yaml" },
  highlight = { enable = true },
  indent = { enable = true }
})
