return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      local disabled_filetypes = { "markdown", "lua" }
      return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
    end,
    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },
    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  },
}
