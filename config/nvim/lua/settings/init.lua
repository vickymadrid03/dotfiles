vim.g.mapleader = ' '
vim.cmd('set expandtab')
vim.cmd('set tabstop=2')
vim.cmd('set softtabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set colorcolumn=80,120')
vim.opt.clipboard:append("unnamedplus") -- Yank to clipboard

-- Case-insensitive search unless using uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable list mode
vim.opt.list = true
-- Configure listchars: tab, end-of-line, and trailing spaces
vim.opt.listchars = {
  tab = "› ",
  trail = "⋅",
  space = "⋅"
}

-- Pane management
-- Move to the left pane
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
-- Move to the right pane
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })
-- Move to the top pane
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
-- Move to the bottom pane
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })

-- Indent with single < > key press
vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

-- Run LSP formatter
vim.api.nvim_set_keymap('n', '<leader>fr', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

require('settings.relative_numbers')
