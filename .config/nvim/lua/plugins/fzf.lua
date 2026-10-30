vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

vim.keymap.set("n", "<leader>ff", "<CMD>FzfLua files<CR>", { desc = "fzf menu for files" })
vim.keymap.set("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", { desc = "fzf menu for buffers" })
vim.keymap.set("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", { desc = "fzf menu for grep" })
vim.keymap.set("v", "<leader>fg", "<CMD>FzfLua grep_visual<CR>", { desc = "fzf menu for visual grep" })
