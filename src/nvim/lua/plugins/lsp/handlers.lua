local M = {}

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
