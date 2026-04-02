-- A more minimalist version of onenord scheme by Teb0so
-- Inspired by: https://github.com/rmehri01/onenord.nvim
-- and: https://github.com/rexim/gruber-darker-theme

vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.o.background = "dark"
vim.g.colors_name = "simple-onenord"

local set = vim.api.nvim_set_hl

local c  = {
    fg          = "#d8dee9",
    bg          = "#2e3440",
    whitespc    = "#3b4252",
    statusline  = "#4c566a",
    selection   = "#4c566a",
    orange      = "#ffdd33",
    white       = "#ffffff",
    light_grey  = "#aab2bf",
    dark_grey   = "#6B7994",
    magenta     = "#c678dd",
    light_green = "#a3be8c",
    dark_green  = "#98c379",
    light_blue  = "#8892A5",
    dark_blue   = "#aab2bf",
    cyan        = "#8fbcbb",
}

-- Basic UI
set(0, "Normal", { fg = c.fg, bg = c.bg })
set(0, "Whitespace", { fg = c.whitespc })
set(0, "NonText", { fg = c.whitespc })
set(0, "StatusLine", { fg = c.white, bg = c.statusline })
set(0, "StatusLineNc", { fg = c.fg, bg = c.statusline })
set(0, "NormalFloat", { fg = c.fg, bg = c.statusline })
set(0, "FloatBorder", { fg = c.dark_grey, bg = c.statusline })
set(0, "Pmenu", { fg = c.fg, bg = c.statusline })
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
