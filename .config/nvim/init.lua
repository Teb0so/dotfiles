vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
require("lazy").setup("plugins")

-- Transparent background
vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight NormalNC guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight SignColumn guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight VertSplit guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight LineNr guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight CursorLineNr guibg=NONE ctermbg=NONE]]

-- Set dots
vim.cmd("set list")
vim.cmd("set listchars=tab:-->,space:·")

-- Set tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Set line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Cycle buffers
vim.keymap.set("n", "<leader>b", "<CMD>b#<CR>")
vim.keymap.set("n", "<leader>n", "<CMD>bn<CR>")
vim.keymap.set("n", "<leader>p", "<CMD>bp<CR>")

-- Kill pannel
vim.keymap.set("n", "<C-d>", "<C-w>q")

-- Open copen
vim.keymap.set("n", "<leader>co", "<CMD>copen<CR>")

_G.lsp_status = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ buffer = bufnr })
  if not clients or vim.tbl_isempty(clients) then
    return "LSP: none"
  end
  local names = {}
  for _, client in pairs(clients) do
    table.insert(names, client.name)
  end
  return "LSP: " .. table.concat(names, ", ")
end

vim.o.statusline = "%f %m %r %= %{%v:lua.lsp_status()%}"

