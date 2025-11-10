return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function ()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "md", "markdown" },
            callback = function()
                vim.cmd("setlocal spell spelllang=pt,en")
            end,
        })
    end
}
