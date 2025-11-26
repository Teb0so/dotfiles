return {
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            _G.cmp_enabled = false

            cmp.setup({
                enabled = function()
                    return _G.cmp_enabled
                end,

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-x>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                }, {
                        { name = "buffer" },
                    }),

                -- Toggle
                vim.keymap.set('n', '<leader>tc', function()
                    _G.cmp_enabled = not _G.cmp_enabled
                    print('Completion ' .. (_G.cmp_enabled and 'enabled' or 'disabled'))
                end, { desc = 'Toggle nvim-cmp completion' })
            })
        end,
    },
}
