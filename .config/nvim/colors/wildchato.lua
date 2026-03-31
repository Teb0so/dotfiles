-- A very boring ccheme by Teb0so
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
    whitespc    = "#b0b0b0",
    selection   = "#a8a8a8",
    orange      = "#af5f00",
    white       = "#ffffff",
    light_grey  = "#aaaaaa",
    dark_grey   = "#5f5f5f",
    magenta     = "#870087",
    dark_green  = "#008700",
    light_green = "#5f875f",
    light_blue  = "#004175",
    dark_blue   = "#002747",
    cyan        = "#008787",
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
set(0, "MsgArea", { fg = c.fg, bg = c.bg })
set(0, "ModeMsg", { fg = c.fg, })
set(0, "MoreMsg", { fg = c.cyan, })

-- Syntax
set(0, "Comment", { fg = c.magenta })
set(0, "Todo", { fg = c.white, bg = c.magenta })
set(0, "String", { fg = c.dark_green })
set(0, "Special", { fg = c.light_green })
set(0, "Keyword", { fg = c.orange })
set(0, "Statement", { fg = c.orange })
set(0, "Function", { fg = c.fg })
set(0, "Identifier", { fg = c.fg })
set(0, "Type", { fg = c.light_blue })
set(0, "PreProc", { fg = c.dark_blue })
set(0, "Constant", { fg = c.fg })

-- Visual
set(0, "Visual", { bg = c.selection })

-- Oil
set(0, "Directory", { fg = c.cyan })
set(0, "OilDirHidden", { fg = c.dark_grey })
set(0, "OilFileHidden", { fg = c.dark_grey })
set(0, "OilLinkHidden", { fg = c.dark_grey })
set(0, "OilLinkTargetHidden", { fg = c.dark_grey })
