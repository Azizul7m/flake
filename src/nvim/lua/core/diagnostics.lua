-- Modern diagnostic config
-- vim.diagnostic.config({
-- 	virtual_text = {
-- 		prefix = "→",
-- 		spacing = 4,
-- 		source = "if_many",
-- 		format = function(diagnostic)
-- 			return diagnostic.message
-- 		end,
-- 	},
--
-- 	underline = true,
-- 	update_in_insert = false, -- Avoid updating diagnostics while in insert mode
-- 	severity_sort = true,
-- 	float = {
-- 		source = "always",
-- 	},
-- 	signs = {
-- 		text = {
-- 			[vim.diagnostic.severity.ERROR] = "",
-- 			[vim.diagnostic.severity.WARN] = "",
-- 			[vim.diagnostic.severity.INFO] = "",
-- 			[vim.diagnostic.severity.HINT] = "󰌶",
-- 		},
-- 	},
-- })

-- Show diagnostic popup on hover
-- vim.api.nvim_create_autocmd("CursorHold", {
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end,
-- })

-- Enable inlay hints for supported languages
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		end
	end,
})
