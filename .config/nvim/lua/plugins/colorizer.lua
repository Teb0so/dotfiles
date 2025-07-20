return {
    "catgoose/nvim-colorizer.lua",
    enabled = true,
    config = function()
        require("colorizer").setup({
            user_default_options = { names = false },
            filetypes = { "*" },
        })
    end,
}
