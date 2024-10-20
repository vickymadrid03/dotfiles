-- Highlight trailing spaces
vim.api.nvim_set_hl(0, 'TrailingSpace', {ctermbg = 238, bg = '#e3c5c5'})
vim.fn.matchadd('TrailingSpace', '\\s\\+$')
