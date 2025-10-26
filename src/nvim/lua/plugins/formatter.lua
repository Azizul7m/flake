return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			nix = { "nixfmt" },
			bash = { "shfmt" },
			markdown = { "prettierd", "prettier" },
		},
		format_on_save = function(bufnr)
			local ft = vim.bo[bufnr].filetype
			local allow_auto = {
				lua = true,
				rust = true,
				javascript = true,
				typescript = true,
				json = true,
				nix = true,
				yaml = true,
				bash = true,
			}
			-- Only auto-format whitelisted filetypes
			if allow_auto[ft] then
				return { timeout_ms = 3000, lsp_fallback = true }
			end
		end,
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
	end,
}
