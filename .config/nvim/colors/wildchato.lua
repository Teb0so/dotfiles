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
    bg          = "#ffffff",
    whitespc    = "#eeeeee",
    light_grey  = "#cccccc",
    dark_grey   = "#5f5f5f",
    red         = "#750000",
    green       = "#008700",
    orange      = "#af5f00",
    blue        = "#004175",
    magenta     = "#870087",
    cyan        = "#008787",
    white       = "#ffffff",
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
set(0, "Cursor", { fg = c.bg, bg = c.orange })
set(0, "CurSearch", { fg = c.white, bg = c.orange })
set(0, "CursorLine", { fg = c.white, bg = c.dark_grey })
set(0, "CursorLineNr", { fg = c.orange, bold = true })
set(0, "LineNrAbove", { fg = c.dark_grey })
set(0, "LineNr", { fg = c.orange, bold = true })
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
set(0, "Special", { fg = c.blue })
set(0, "Keyword", { fg = c.orange, bold = true })
set(0, "Statement", { fg = c.orange, bold = true })
set(0, "Function", { fg = c.fg })
set(0, "Identifier", { fg = c.fg })
set(0, "Type", { fg = c.blue })
set(0, "Operator", { fg = c.fg })
set(0, "PreProc", { fg = c.blue })
set(0, "Constant", { fg = c.red })
set(0, "Delimiter", { fg = c.fg })
set(0, "Visual", { bg = c.light_grey })

-- LSP
set(0, "DiagnosticError", { fg = c.red })
set(0, "DiagnosticWarn", { fg = c.orange })
set(0, "DiagnosticInfo", { fg = c.black })
set(0, "DiagnosticHint", { fg = c.gray })

-- Oil
set(0, "Directory", { fg = c.cyan })
set(0, "OilDirHidden", { fg = c.dark_grey })
set(0, "OilFileHidden", { fg = c.dark_grey })
set(0, "OilLinkHidden", { fg = c.dark_grey })
set(0, "OilLinkTargetHidden", { fg = c.dark_grey })
