-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
---@diagnostic disable-next-line: undefined-field
vim.opt.clipboard:append("unnamedplus")
vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true })
vim.filetype.add({
  extension = {
    usertalk = "usertalk",
  },
})
vim.diagnostic.config({
  virtual_text = { source = true },
  float = { source = true },
})
