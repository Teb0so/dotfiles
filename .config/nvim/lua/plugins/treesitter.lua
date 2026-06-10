vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter"},
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"},
})

require("nvim-treesitter").setup({
    auto_install = false,
    ensure_installed = {
        "bash",
        "c",
        "lua",
    },

    move = {
        enable = true,
        set_jumps = true,

        goto_next_start = {
            ["]f"] = "@function.outer",
        },

        goto_previous_start = {
            ["[f"] = "@function.outer",
        },
    },
})

require("nvim-treesitter-textobjects").setup {
  select = {
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
    },
    include_surrounding_whitespace = false,
  },
}

-- Functions
vim.keymap.set({ "x", "o" }, "af", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "if", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
end)

--Classes
vim.keymap.set({ "x", "o" }, "ac", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ic", function()
  require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
end)

-- Loops
vim.keymap.set({ "x", "o" }, "al", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "il", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
end)

-- Conditionals (if/switch/match)
vim.keymap.set({ "x", "o" }, "ai", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
end)

vim.keymap.set({ "x", "o" }, "ii", function()
  require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
end)

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
