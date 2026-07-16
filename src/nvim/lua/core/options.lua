local opt = vim.opt
local g = vim.g

-- General
g.mapleader = " "
g.maplocalleader = " "

-- Fix for NixOS: point to the correct sqlite library path
g.sqlite_clib_path = "/nix/store/bn7m7qn8k7b27jy5lkq3bg4vcxnyjpq0-sqlite-3.51.2/lib/libsqlite3.so"

-- Editor
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.numberwidth = 1

opt.signcolumn = "yes"
opt.scrolloff = 8

opt.sidescrolloff = 0
opt.termguicolors = true

-- Optional: Customize the vertical line color
opt.wrap = true
opt.linebreak = true
opt.breakindent = true

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

vim.filetype.add({
	extension = {
		templ = "templ",
		http = "http",
		rest = "http",
	},
	pattern = {
		[".*%.templ"] = "templ",
	},
})

vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
