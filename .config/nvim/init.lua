-- Neovim config by Teb0so

-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load plugins
require("plugins.utils")
require("plugins.oil")
require("plugins.tmux-navigation")
require("plugins.completion")
require("plugins.lsp")
require("plugins.treesitter")
require("plugins.colorscheme")

-- Load theme
-- vim.cmd("colorscheme wildchato")
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Set lists
vim.cmd("set list")
-- vim.cmd("set listchars=tab:-->,space:·")
vim.cmd("set listchars=tab:-->")

-- Set Identation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autoread = true

-- Update file
vim.keymap.set("n", "<leader>uu", "<CMD>checktime<CR>", { desc = "Check for external updates to file" })

-- Copy to clipboard
vim.keymap.set("v", "<leader>c", '"+y')

-- Set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Cycle buffers
vim.keymap.set("n", "<leader>b", "<CMD>b#<CR>")
vim.keymap.set("n", "<leader>n", "<CMD>bn<CR>")
vim.keymap.set("n", "<leader>p", "<CMD>bp<CR>")

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })

-- Keep selection after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- Help
vim.keymap.set("n", "K", "viwK")

-- Center cursor while scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move chunks of code
vim.keymap.set("n", "E", "ddp")
vim.keymap.set("n", "Y", "ddkP")

vim.keymap.set('v', 'E', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'Y', ":m '<-2<CR>gv=gv")

-- Open copen
vim.keymap.set("n", "<leader>co", "<CMD>copen<CR>")
-- vim.keymap.set("n", "<leader>ca", function()
--     vim.diagnostic.setqflist({ open = true })
-- end, { desc = "Open diagnostics in quickfix" })

-- Shell command
vim.keymap.set("n", "<leader>sh", ":! ", { desc = "Run shell command" })

-- Quick search
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })
vim.opt.path:append("**")

-- List buffers
vim.keymap.set('n', '<leader>fb', ':buffers<CR>:b ', { desc = "List buffers" })

-- Grep
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden --no-binary"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.keymap.set('n', '<leader>fg', ':grep ', { desc = "Vim grep" })
vim.keymap.set('v', '<leader>fg', '"zy:grep <C-r>z<CR>', { desc = "Vim visual grep" })

-- Align
vim.api.nvim_create_user_command("Align", function(opts)
    local delim = opts.args ~= "" and opts.args or " "
    vim.cmd("'<,'>!column -t -s '" .. delim .. "' -o '" .. delim .. " '")
end, { nargs = "?", range = true, })
