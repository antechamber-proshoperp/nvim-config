return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          exclude = { "node_modules", ".git" },
        },
        files = {
          hidden = true,
        },
      },
    },
    explorer = {
      hidden = true,
    },
  },
}
