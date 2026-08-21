return {
	"stevearc/conform.nvim",
	opts = function(_, opts)
		opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
			lua = { "stylua" },
			python = { "ruff_format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			go = { "gofumpt", "goimports-reviser", "golines" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			css = { "prettierd", "prettier", stop_after_first = true },
			sql = { "sql_formatter" },
		})
	end,
}
