local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
local plugins = {
  -- Themes
  { 'nvimdev/oceanic-material', lazy = false, priority = 1000 },
  { 'EdenEast/nightfox.nvim',   lazy = false, priority = 1000 },
  { 'mhartington/oceanic-next', lazy = false, priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-tree/nvim-web-devicons' },
  -- Filetree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window
    }
  },
  -- LSP
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  },
  { 'onsails/lspkind.nvim' },
  -- Git
  { 'lewis6991/gitsigns.nvim' },
  -- Tests
  { 'vim-test/vim-test' },
  -- Commands
  { 'tpope/vim-surround' },
  { 'github/copilot.vim' }
}

require('lazy').setup(plugins, opts)

require('plugins.colortheme')
require('plugins.gitsigns')
require('plugins.mason')
require('plugins.neotree')
require('plugins.telescope')
require('plugins.test')
require('plugins.treesitter')
