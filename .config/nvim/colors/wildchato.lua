-- A very boring scheme by Teb0so
-- Inspired by: https://github.com/vim/cchemes/blob/master/c/wildcharm.vim
-- and: https://github.com/rexim/gruber-darker-theme

vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.o.background = "light"
vim.g.colors_name = "wildchato"

local set = vim.api.nvim_set_hl

local c  = {
    fg          = "#000000",
    bg          = "#c0c0c0",
    whitespc    = "#9f9f9f",
    selection   = "#a8a8a8",
    red         = "#af0000",
    orange      = "#af5f00",
    green       = "#008700",
    light_blue  = "#004175",
    dark_blue   = "#002747",
    magenta     = "#870087",
    cyan        = "#008787",
    white       = "#ffffff",
    light_grey  = "#aaaaaa",
    dark_grey   = "#5f5f5f",
}

-- Basic UI
set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "Whitespace", { fg = c.whitespc })
set(0, "NonText", { fg = c.whitespc })
set(0, "StatusLine", { fg = c.white, bg = c.dark_grey })
set(0, "StatusLineNc", { fg = c.fg, bg = c.light_grey })
set(0, "NormalFloat", { fg = c.fg, bg = c.light_grey })
set(0, "FloatBorder", { fg = c.dark_grey, bg = c.light_grey })
set(0, "Pmenu", { fg = c.fg, bg = c.light_grey })
set(0, "PmenuSel", { fg = c.white, bg = c.dark_grey })
set(0, "PmenuSbar", { bg = c.light_grey })
set(0, "PmenuThumb", { bg = c.dark_grey })
set(0, "CurSearch", { fg = c.white, bg = c.orange })
set(0, "CursorLine", { fg = c.white, bg = c.dark_grey })
set(0, "CursorLineNr", { fg = c.orange })
set(0, "LineNrAbove", { fg = c.dark_grey })
set(0, "LineNr", { fg = c.orange })
set(0, "LineNrBelow", { fg = c.dark_grey })
set(0, "MsgArea", { fg = c.fg, })
set(0, "ModeMsg", { fg = c.fg, })
set(0, "MoreMsg", { fg = c.cyan, })
set(0, "ErrorMsg", { fg = c.red })
set(0, "Error", { fg = c.red })

-- Syntax
set(0, "Comment", { fg = c.magenta })
set(0, "Todo", { fg = c.white, bg = c.magenta })
set(0, "String", { fg = c.green })
set(0, "Special", { fg = c.cyan })
set(0, "Keyword", { fg = c.orange })
set(0, "Statement", { fg = c.orange })
set(0, "Function", { fg = "none" })
set(0, "Identifier", { fg = "none" })
set(0, "Type", { fg = c.light_blue })
set(0, "Operator", { fg = c.light_blue })
set(0, "PreProc", { fg = c.dark_blue })
set(0, "Constant", { fg = "none" })

-- Visual
set(0, "Visual", { bg = c.selection })

-- Oil
set(0, "Directory", { fg = c.cyan })
set(0, "OilDirHidden", { fg = c.dark_grey })
set(0, "OilFileHidden", { fg = c.dark_grey })
set(0, "OilLinkHidden", { fg = c.dark_grey })
set(0, "OilLinkTargetHidden", { fg = c.dark_grey })
