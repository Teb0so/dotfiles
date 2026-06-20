vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text" },
    callback = function()
        vim.opt_local.linebreak=true
        vim.opt_local.list=false
        vim.opt_local.conceallevel=2
    end
})
