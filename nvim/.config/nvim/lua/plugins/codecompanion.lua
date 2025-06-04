return {
  "olimorris/codecompanion.nvim",
  opts = {},
  -- config = function()
  --   require("codecompanion").setup({
  --       strategies = {
  --           chat = {
  --               adapter = "copilot",
  --           },
  --           inline = {
  --               adapter = "copilot",
  --           },
  --           cmd = {
  --               adapter = "copilot",
  --           },
  --       }
  --   })
  -- end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
