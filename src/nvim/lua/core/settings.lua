--core settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.smarttab = true
vim.wo.number = true
vim.g.mapleader = " "
vim.opt.swapfile = false
vim.o.mouse= 'a'
vim.o.breakindent= true
vim.o.undofile= true
vim.o.ignorecase= true
vim.wo.signcolumn= 'yes' 
vim.wo.cursorline = true
vim.wo.scrolloff = 5
vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_set_option('clipboard', 'unnamedplus')

-- fetch keymap
local keymap = vim.api.nvim_set_keymap
-- Silent keymap option
local opts = { silent = true }
-- insert mode
keymap('i', 'jk', [[<esc>]], {})

-- Normal --
keymap('n', "<leader>qk", ":wqa<CR>", opts)
keymap('n', "<leader>qK", ":q!<CR>", opts)

-- Split window --
keymap("n", "<leader>wv", ":vsplit<CR>", opts)
keymap("n", "<leader>ws", ":split<CR>", opts)
keymap("n", "<leader>wc", ":exit<CR>", opts)
keymap("n", "<leader>wq", ":q<CR>", opts)

-- Better window navigation
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)

keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<leader>bn", ":tabnew<CR>", opts)
keymap("n", "<leader>bc", ":tabclose<CR>", opts)
keymap("n", "<leader>bq", ":q<CR>", opts)
keymap("n", "<leader>bi", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>bl", ":bnext<CR>", opts)
keymap("n", "<leader>bh", ":bprevious<CR>", opts)
keymap("n", "<leader>b[", ":bnext<CR>", opts)
keymap("n", "<leader>b]", ":bprevious<CR>", opts)
keymap("n", "<tab>", ":bnext<CR>", opts)
keymap("n", "S-<tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bh", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>th", ":nohlsearch<CR>", opts)


keymap("n", "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- Rename all occurrences of the hovered word for the entire file
keymap("n", "<leader>gr", "<cmd>Lspsaga rename<CR>", opts)
-- Rename all occurrences of the hovered word for the selected files
keymap("n", "<leader>gr", "<cmd>Lspsaga rename ++project<CR>", opts)


