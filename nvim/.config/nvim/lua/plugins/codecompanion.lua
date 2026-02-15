return {
  "olimorris/codecompanion.nvim",
cmd = { "CodeCompanionChat", "CodeCompanionInline", "CodeCompanionCmd" },
  version = "^18.0.0",
  opts = {
      prompt_library = {
      }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
    keys = {
    { "<leader>ct", ":CodeCompanionChat Toggle<cr>", mode = {"n"}, desc = "Code Companion Chat" },
  },
}
