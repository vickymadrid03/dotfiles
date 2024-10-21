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
  { 'nvimdev/oceanic-material', lazy = false, priority = 1000 },
  {
    'nvis-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-tree/nvim-web-devicons' },
  -- LSP
  { 'williamboman/mason.nvim'},
  { 'williamboman/mason-lspconfig.nvim' },
  { 'neovim/nvim-lspconfig' },
  --
  { 'lewis6991/gitsigns.nvim' }
}

require('lazy').setup(plugins, opts)

require('plugins.telescope')
require('plugins.treesitter')
require('plugins.mason')
require('plugins.gitsigns')
require('plugins.colortheme')
