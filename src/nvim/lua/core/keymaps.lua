local map = vim.keymap.set

-- Quick escape from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Window management
map({ "n", "x", "t" }, "<leader>w", "<C-w>", { desc = "Window management" })
map({ "n", "x", "t" }, "<leader>b[", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map({ "n", "x", "t" }, "<leader>b]", "<cmd>bnext<CR>", { desc = "Next buffer" })
map({ "n", "v" }, "<M-j>", "<cmd>Telescope buffers<CR>", { desc = "List buffers" })

-- Telescope mappings
map({ "n", "v", "i", "t" }, "<M-<space>>", "<cmd>Telescope<CR>", { desc = "Telescope" })
map("n", "<leader><space>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
map("n", "<leader>.", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })

-- LSP mappings
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
map("n", "<M-Enter>", vim.lsp.buf.code_action, { desc = "Code actions" })

-- Diagnostic mappings
map("n", "<M-p>", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "<M-n>", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- File management
map({ "n", "v", "t" }, "_", "<cmd>Neotree toggle<CR>", { desc = "Neotree file manager" })
map({ "n", "v", "t" }, "-", "<cmd>Oil --float --preview<CR>", { desc = "Oil file manager" })

-- Find
map({ "n" }, "<leader>fc", "<cmd>Oil --float --preview ~/.config/nvim<CR>", { desc = "Edit Neovim config" })
map({ "n", "v" }, "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Live grep" })
map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find projects" })
