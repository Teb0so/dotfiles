return{
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd"}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})

            vim.keymap.set('n', 'H', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

            -- Disable semantic highlights
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
                        vim.api.nvim_set_hl(0, group, {})
                    end
                end
            })
        end
    }
}

