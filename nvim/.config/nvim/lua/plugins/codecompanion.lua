return {
  "olimorris/codecompanion.nvim",
cmd = { "CodeCompanionChat", "CodeCompanionInline", "CodeCompanionCmd" },
  version = "^18.0.0",
  opts = {
    interactions = {
      chat = {
        adapter = "copilot",
      },
    },
    adapters = {
      acp = {
        copilot_cli = function()
          return require("codecompanion.adapters").extend("copilot_cli", {})
        end,
      },
    },
    prompt_library = {
    }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ttgrules/cc-adapter-copilot-cli-acp",
  },
    keys = {
    { "<leader>ct", ":CodeCompanionChat Toggle<cr>", mode = {"n"}, desc = "Code Companion Chat" },
  },
}
