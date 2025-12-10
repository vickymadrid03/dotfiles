local config = require("neo-tree")

config.setup({
  close_if_last_window = true, -- Automatically close NeoTree when it's the last window
  window = {
    position = "right",        -- Set NeoTree to open on the right side
  },
  filesystem = {
    filtered_items = {
      visible = true, -- Show hidden files
    },
  },
})

-- Open NeoTree with leader + e
vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Open NeoTree in the current file's directory with leader + e + .
vim.api.nvim_set_keymap('n', '<leader>e.', ':Neotree reveal<CR>', { noremap = true, silent = true })
