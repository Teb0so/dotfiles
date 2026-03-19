-- Set leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load Plugins
require("config.lazy")
require("lazy").setup("plugins")

-- Load theme
vim.cmd("colorscheme wildcharm")
vim.cmd("set background=light")
vim.cmd("highlight Identifier ctermfg=0 guifg=#000000")
vim.cmd("highlight Comment ctermfg=90 guifg=#870087")
vim.cmd("highlight Whitespace ctermfg=246 guifg=#949494")
vim.cmd("highlight NonText ctermfg=246 guifg=#949494")
vim.cmd("highlight SpecialKey ctermfg=246 guifg=#949494")
vim.cmd("highlight LineNr ctermfg=238 guifg=#444444")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Keep 10 lines above / bellow cursor
vim.opt.scrolloff = 10

-- Set dots
vim.cmd("set list")
vim.cmd("set listchars=tab:-->,space:·")

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
vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.autoread = true

-- Update file
vim.keymap.set("n", "<leader>uu", "<CMD>checktime<CR>", { desc = "Check for external updates to file" })

-- Diff
vim.keymap.set("n", "<leader>fd", "<CMD>diffthis<CR>")
vim.keymap.set("n", "<leader>fdf", ":vert diffsplit ")
vim.keymap.set("n", "<leader>fof", "<CMD>diffoff<CR>")

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

-- Move chunks of code
vim.keymap.set("n", "E", "ddp")
vim.keymap.set("n", "Y", "ddkP")

vim.keymap.set('v', 'E', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'Y', ":m '<-2<CR>gv=gv")

-- Open copen
vim.keymap.set("n", "<leader>co", "<CMD>copen<CR>")
vim.keymap.set("n", "<leader>ca", function()
  vim.diagnostic.setqflist({ open = true })
end, { desc = "Open diagnostics in quickfix" })

-- Open new empty buffer
vim.keymap.set("n", "<leader>e", "<CMD>enew<CR>", { desc = "Open new empty buffer" })

-- Quick search
vim.keymap.set("n", "<leader>ff", ":find ", { desc = "Find file" })
vim.opt.path:append("**")

-- List buffers
vim.keymap.set('n', '<leader>fb', ':buffers<CR>:b ', { desc = "List buffers" })

------------------------------ Status line ----------------------------------------

-- -- Show LSP status
-- _G.lsp_status = function()
--     local bufnr = vim.api.nvim_get_current_buf()
--     local clients = vim.lsp.get_clients({ buffer = bufnr })
--     if not clients or vim.tbl_isempty(clients) then
--         return "LSP: none"
--     end
--     local seen = {}
--     local names = {}
--     for _, client in pairs(clients) do
--         if not seen[client.name] then
--             table.insert(names, client.name)
--             seen[client.name] = true
--         end
--     end
--     return "LSP: " .. table.concat(names, ", ")
-- end
--
-- vim.o.statusline = "%f %m %r %= %l:%c    %p%%    %{%v:lua.lsp_status()%}"
