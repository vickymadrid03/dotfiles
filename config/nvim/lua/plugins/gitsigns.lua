require('gitsigns').setup()

local gitsigns = require('gitsigns')

vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
