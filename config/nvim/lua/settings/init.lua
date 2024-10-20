vim.g.mapleader=' '
vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set colorcolumn=80,120')
vim.opt.clipboard:append("unnamedplus") -- Yank to clipboard

require('settings.relative_numbers')
require('settings.trailing_spaces')
