return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false, 
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "lua", "vim", "query", "markdown", "markdown_inline", "python", "java", "javascript", "typescript", "bash", "c" },
              highlight = { enable = true, disable = {"c"}},
              indent = { enable = true },
        })
    end
}
