local opt = vim.opt
local g = vim.g


-- General
g.mapleader = " "
g.maplocalleader = " "

-- Editor
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.termguicolors = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Misc
opt.clipboard = "unnamedplus"
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect,noinsert"
opt.pumheight = 10
opt.swapfile = false
