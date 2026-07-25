local M = {}

-- Default on_attach function for LSP
M.on_attach = function(client, bufnr)
	-- Enable inlay hints if available
	if client.server_capabilities.inlayHintProvider then
		vim.schedule(function()
			if vim.api.nvim_buf_is_valid(bufnr) then
				if vim.lsp.inlay_hint and not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }) then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end
			end
		end)
	end

	-- Set keybindings
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
	vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))
	vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show hover information" }))
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Show diagnostics" }))
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
end

-- Default capabilities including blink.cmp LSP capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.get_capabilities = function()
	local ok, blink = pcall(require, "blink.cmp")
	if ok then
		return blink.get_lsp_capabilities(M.capabilities)
	end
	return M.capabilities
end

return M
