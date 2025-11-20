local opt = vim.opt
local g = vim.g

-- General
g.mapleader = " "
g.maplocalleader = " "

-- Editor
opt.number = true
opt.relativenumber = false
--opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 0
opt.termguicolors = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Split windows
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.cache/nvim"

-- Misc
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.isfname:append("@-@")
