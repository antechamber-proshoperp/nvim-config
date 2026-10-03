return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize this keybinding to whatever you prefer
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    -- This tells Neovim to use jq for json files
    formatters_by_ft = {
      json = { "jq" },
      jsonc = { "jq" }, -- jsonc is JSON with comments
    },
    -- Optional: Uncomment this if you want it to format every time you save
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
