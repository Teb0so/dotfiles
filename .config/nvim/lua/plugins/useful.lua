return {
    "RRethy/nvim-align",
    "numToStr/Comment.nvim",

    {
        "catgoose/nvim-colorizer.lua",
        config = function()
            _G.colorizer_enabled = false

            require("colorizer").setup({
                enabled = false,
                user_default_options = {
                    names = false,
                },
                filetypes = { "*" },
            })

            vim.keymap.set("n", "<leader>cc", function()
                _G.colorizer_enabled = not _G.colorizer_enabled

                if _G.colorizer_enabled then
                    require("colorizer").attach_to_buffer(0)
                else
                    require("colorizer").detach_from_buffer(0)
                end
            end, { desc = "Toggle colorizer" })
        end,
    },
}
