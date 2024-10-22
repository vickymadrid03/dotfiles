vim.g["test#strategy"] = "neovim_sticky"

vim.keymap.set("n", "<leader>tl", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>")
