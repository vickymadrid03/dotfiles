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
