local map = vim.keymap.set

local function toggle_maximized_window()
	local tab = vim.t
	local current_win = vim.api.nvim_get_current_win()

	if tab.maximized_window_layout and tab.maximized_window == current_win then
		vim.cmd(tab.maximized_window_layout)
		tab.maximized_window_layout = nil
		tab.maximized_window = nil
		return
	end

	tab.maximized_window_layout = vim.fn.winrestcmd()
	tab.maximized_window = current_win
	vim.cmd("wincmd |")
	vim.cmd("wincmd _")
end

-- Quick escape from insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })
map("t", "jk", "<C-\\><C-n>", { desc = "Normal mode in Terminal" })
map({ "i", "n", "t", "v", "x" }, "<M-x>", ":", { desc = "cmdline" })

-- Terminal
map({ "t", "n", "v" }, "<M-t>", "<cmd>lua Snacks.terminal.toggle()<CR>", { desc = "Toggle Terminal" })
map("t", "<M-n>", "<cmd>lua Snacks.terminal.open()<CR>", { desc = "Open new Snacks Terminal" })

-- Window management
map({ "n", "x", "t" }, "<leader>w", "<C-w>", { desc = "Window management" })
map("n", "<leader>wm", toggle_maximized_window, { desc = "Toggle maximize window" })
map("n", "<leader>wq", "<cmd>qa<CR>", { desc = "Quit all" })
map({ "n", "x", "t" }, "<leader>b[", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map({ "n", "x", "t" }, "<leader>b]", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Diagnostic mappings
map("n", "<M-n>", vim.diagnostic.jump, { desc = "Go to next diagnostic" })
map("n", "<M-N>", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostic" })

-- Toggle
map({ "n", "v" }, "-", "<cmd>lua Snacks.explorer()<CR>", { desc = "Snacks file manager" })
map({ "n", "v" }, "_", "<cmd>lua MiniFiles.open()<CR>", { desc = "MiniFiles file manager" })
map({ "n", "t", "x" }, "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>tl", "<cmd>Lazy<CR>", { desc = "Lazy.nvim" })

-- Database client
map("n", "<leader>tdd", "<cmd>DBUIToggle<CR>", { desc = "DBUIToggle" })
map("n", "<leader>tdf", "<cmd>DBUIFindBuffer<CR>", { desc = "DBUIFindBuffer" })
map("n", "<leader>tda", "<cmd>DBUIAddConnection<CR>", { desc = "DBUIAddConnection" })
map("n", "<leader>tdc", "<cmd>DBUIClose<CR>", { desc = "DBUIClose" })

-- Database client
map("n", "<leader>od", "<cmd>Dockyard<CR>", { desc = "Docker" })
map("n", "<leader>odf", "<cmd>DockyardFloat<CR>", { desc = "Dockyard Float" })
map("n", "<leader>odb", "<cmd>DockyardBuild<CR>", { desc = "Dockyard Build" })
map("n", "<leader>odr", "<cmd>DockyardRun<CR>", { desc = "Dockyard Run" })

-- Addons

-- LSP
local lsp = vim.lsp
map("n", "<leader>ca", lsp.buf.code_action, { desc = "Lsp Code action" })
map("n", "<leader>cd", lsp.buf.definition, { desc = "Lsp Definition" })
map("n", "<leader>cD", lsp.buf.declaration, { desc = "Lsp Declaration" })
map("n", "<leader>ci", lsp.buf.implementation, { desc = "Lsp Implementation" })
map("n", "<leader>hs", lsp.buf.signature_help, { desc = "Lsp Signature help" })
map("n", "<leader>ch", lsp.buf.document_highlight, { desc = "Lsp Documente highlight" })
map("n", "<leader>rv", lsp.buf.rename, { desc = "Lsp Rename" })
map("n", "<leader>cf", lsp.buf.format, { desc = "Lsp Format" })
