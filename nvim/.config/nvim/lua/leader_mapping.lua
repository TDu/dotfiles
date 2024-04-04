--
-- search command history
vim.keymap.set("n", "<leader>:", "<cmd>History:<cr>")
-- search on recent files (history)
vim.keymap.set("n", "<leader>m", vim.cmd.History)
vim.keymap.set("n", "<leader>M", vim.cmd.MRU)

-- search for content in git repo
vim.keymap.set("n", "<leader>r", vim.cmd.Rg)
-- search for file in git repo
vim.keymap.set("n", "<leader>g", vim.cmd.GFiles)
-- search for file from pwd
vim.keymap.set("n", "<leader>t", vim.cmd.Files)

-- search for marks set
vim.keymap.set("n", "<leader>'", vim.cmd.Marks)

-- search buffers
-- search for file name in opened buffers
vim.keymap.set("n", "<leader>b", vim.cmd.Buffers)
-- search for content in opened buffers
vim.keymap.set("n", "<leader>f", vim.cmd.Lines)

-- toggle the vista window
vim.keymap.set("n", "<leader>v", "<cmd>Vista!!<cr>")
