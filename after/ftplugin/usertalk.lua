vim.opt_local.expandtab = false -- Use tab characters instead of spaces
vim.opt_local.tabstop = 4 -- Number of spaces a tab counts for
vim.opt_local.shiftwidth = 4 -- Number of spaces for each step of (auto)indent
vim.opt_local.softtabstop = 4 -- Number of spaces a tab counts for while editing

-- Define how comments should work (useful for plugins like Comment.nvim)
vim.opt_local.commentstring = "// %s"

-- You can also create local keymaps
-- vim.keymap.set('n', '<leader>r', '<cmd>echo "Running custom script!"<CR>', { buffer = true })
print("HELLO FROM MY CUSTOM FILETYPE!")
