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
map("n", "<leader>xn", function()
	vim.diagnostic.jump({ count = 1 })
end, { desc = "Go to next diagnostic" })
map("n", "<M-N>", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostic" })

-- Toggle
map({ "n", "v" }, "-", "<cmd>lua Snacks.explorer()<CR>", { desc = "Snacks file manager" })
map({ "n", "v" }, "_", "<cmd>lua MiniFiles.open()<CR>", { desc = "MiniFiles file manager" })
map({ "n", "t", "x" }, "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit" })
map("n", "<leader>tl", "<cmd>Lazy<CR>", { desc = "Lazy.nvim" })

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
map("n", "<leader>cf", function()
	require("conform").format({ lsp_format = "fallback" })
end, { desc = "Format buffer" })

-- LSP / Trouble with <leader>x
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover doc" })
map({ "n", "v" }, "<leader>xa", vim.lsp.buf.code_action, { desc = "Code action" })
map({ "n", "v" }, "<leader>xA", function()
	vim.lsp.buf.code_action({ apply = true })
end, { desc = "Apply code action" })
map("n", "<leader>xr", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
map("n", "<leader>xh", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover doc" })
map("n", "<leader>xo", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })
map("n", "<leader>xf", "<cmd>Lspsaga finder<CR>", { desc = "LSP finder" })
map("n", "<leader>xd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" })
map("n", "<leader>xD", vim.lsp.buf.declaration, { desc = "Declaration" })
map("n", "<leader>xg", vim.lsp.buf.definition, { desc = "Definition" })
map("n", "<leader>xi", vim.lsp.buf.implementation, { desc = "Implementation" })
map("n", "<leader>xR", vim.lsp.buf.references, { desc = "References" })
map("n", "<leader>xk", vim.lsp.buf.signature_help, { desc = "Signature help" })
map("n", "<leader>xt", "<cmd>Lspsaga peek_type_definition<CR>", { desc = "Peek type definition" })
map("n", "<leader>xl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line diagnostics" })
map("n", "<leader>xc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Cursor diagnostics" })
map("n", "<leader>xp", function()
	vim.diagnostic.jump({ count = -1 })
end, { desc = "Previous diagnostic" })
map("n", "<leader>xv", function()
	if vim.lsp.inlay_hint then
		local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
		vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
	end
end, { desc = "Toggle inlay hints" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix (Trouble)" })
