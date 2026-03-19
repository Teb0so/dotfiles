return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {},
    config = function ()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "md", "markdown" },
            callback = function()
                vim.cmd("setlocal spell spelllang=pt,en")
                vim.cmd("setlocal norelativenumber")
                vim.cmd("setlocal nonumber")
                vim.cmd("setlocal nolist")
            end,
        })
    end
}
