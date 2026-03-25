-- A very boring colorscheme by Teb0so
-- Inspired by: https://github.com/vim/colorschemes/blob/master/colors/wildcharm.vim
-- and: https://github.com/rexim/gruber-darker-theme

vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.o.background = "light"
vim.g.colors_name = "wildchato"

local set = vim.api.nvim_set_hl

-- Basic UI
set(0, "Normal", { fg = "#000000", bg = "#ffffdd" })
set(0, "CursorLine", { bg = "#ffffdd" })
set(0, "CursorLineNr", { fg = "#af5f00", bold = false})
set(0, "StatusLine", { fg = "#ffffff", bg = "#5f5f5f" , bold = false})
set(0, "LineNrAbove", { fg = "#5f5f5f" })
set(0, "LineNr", { fg = "#af5f00" })
set(0, "LineNrBelow", { fg = "#5f5f5f" })

-- Syntax
set(0, "Comment", { fg = "#870087", italic = false})
set(0, "String", { fg = "#008700" })
set(0, "Special", { fg = "#5f875f" })
set(0, "Keyword", { fg = "#af5f00", bold = false})
set(0, "Statement", { fg = "#af5f00", bold = false})
set(0, "Function", { fg = "#000000" })
set(0, "Identifier", { fg = "#000000" })
set(0, "Type", { fg = "#004175" })
set(0, "Constant", { fg = "#000000" })

-- Visual
set(0, "Visual", { bg = "#005faf" })
