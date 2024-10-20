vim.g.mapleader= " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set colorcolumn=80,120")

-- Packages
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  { "nvimdev/oceanic-material", lazy = false, priority = 1000 },
  {
    "nvim-telescope/telescope.nvim", tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  -- LSP
  { "williamboman/mason.nvim"},
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  --
  { "lewis6991/gitsigns.nvim" }
}

require("lazy").setup(plugins, opts)

--set the colorscheme
vim.cmd[[colorscheme oceanic_material]]

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "vim", "ruby", "javascript", "typescript", "dockerfile", "elixir", "eex", "html", "json", "python", "yaml" },
  highlight = { enable = true },
  indent = { enable = true }
})

-- LSP config
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "ts_ls", "ruby_lsp", "rubocop", "tailwindcss", "pyright" }
})

local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.ruby_lsp.setup({})

-- Gitsigns for "Git gutter"
require('gitsigns').setup()

-- Function to update relative number based on mode
local function update_relative_number()
  local mode = vim.fn.mode()

  if mode:match("^[nvx]") then
    -- Normal, Visual, or Select mode
    vim.wo.relativenumber = true
  elseif mode:match("^i") then
    -- Insert mode
    vim.wo.relativenumber = false
  else
    -- Other modes (e.g., Command-line, Terminal)
    vim.wo.relativenumber = false
  end
end

-- Create an autocmd group to avoid duplicates
vim.api.nvim_create_augroup("RelativeNumberToggle", { clear = true })

-- Set always show absolute line number and start with relative numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Autocommand to update relative numbers on mode change
vim.api.nvim_create_autocmd("ModeChanged", {
  group = "RelativeNumberToggle",
  callback = function()
    update_relative_number()
  end,
})

-- Autocommand to update relative numbers on VimEnter and BufEnter
vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter" }, {
  group = "RelativeNumberToggle",
  callback = function()
    update_relative_number()
  end,
})

-- Highlight trailing spaces
vim.api.nvim_set_hl(0, 'TrailingSpace', {ctermbg = 238, bg = '#333333'})
vim.fn.matchadd('TrailingSpace', '\\s\\+$')

