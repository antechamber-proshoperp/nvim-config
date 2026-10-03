return {
  {
    "MagicDuck/grug-far.nvim",
    opts = { headerMaxWidth = 80 }, -- Basic config
    keys = {
      {
        "<leader>sf",
        function()
          local grug = require("grug-far")
          grug.open({
            prefills = {
              paths = vim.fn.expand("%"),
            },
          })
        end,
        desc = "Grug-far: Search/Replace default to current file",
      },
    },
  },
}
