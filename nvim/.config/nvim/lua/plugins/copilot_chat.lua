return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    prompts = {
      Rename = {
        prompt = "Rename variable correctly in given selection based on context.",
        selection = function(source)
            local select = require('CopitlotChat.select')
            return select.visual(source)
      },
    },
    },
    keys = {
      { "<leader>zc", ":CopilotChat<CR>", mode = {"n"}, desc = "Chat with Copilot" },
      { "<leader>ze", ":CopilotChatExplain<CR>", mode = {"v"}, desc = "Explain Code" },
      { "<leader>zr", ":CopilotChatReview<CR>", mode = {"v"}, desc = "Review Code" },
      { "<leader>zf", ":CopilotChatFix<CR>", mode = {"v"}, desc = "Fix Code Issue" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = {"v"}, desc = "Optimize Code" },
      { "<leader>zo", ":CopilotChatOptimize<CR>", mode = {"v"}, desc = "Optimize Code" },
      { "<leader>zd", ":CopilotChatDocs<CR>", mode = {"v"}, desc = "Generate Docs" },
      { "<leader>zt", ":CopilotChatTests<CR>", mode = {"v"}, desc = "Generate Tests" },
      { "<leader>zm", ":CopilotChatCommit<CR>", mode = {"v"}, desc = "Generate Tests" },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
