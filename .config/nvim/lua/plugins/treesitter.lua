return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            -- lua is installed to stop errors from appearing every time I open a lua files
            -- markdown is installed for the markdown renderer
            ensure_installed = { 'lua', 'markdown' },
            highlight = { enable = false },

            -- Disable highlight for lua files
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "lua",
                callback = function()
                    vim.treesitter.stop(0)
                end,
})

        }
    end,
}

