return {
    "stevearc/oil.nvim",
    config = function()
        -- Start oil and set keybind
        require("oil").setup({
            view_options = { show_hidden = true },
        })

        require("oil").set_columns({ "permissions", "size", "mtime" })
        vim.keymap.set("n", "<leader>,", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Open oil on a horizontal split
        vim.keymap.set("n", "<leader>s,", function()
            vim.cmd("split | wincmd j")
            require("oil").open()
        end)

        -- Open oil on a vertical split
        vim.keymap.set("n", "<leader>v,", function()
            vim.cmd("vsplit | wincmd l")
            require("oil").open()
        end)
    end
}
