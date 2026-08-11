local formatters_by_ft = {
	python = { "ruff_format" },
	lua = { "stylua" },
	rust = { "rustfmt" },
	go = { "goimports-reviser", "gofumpt", "golines" },
	templ = { "templ" },
	json = { "prettier" },
	yaml = { "prettier" },
	nix = { "nixfmt" },
	bash = { "shfmt" },
	bib = { "bibtex-tidy" },
	javascript = { "prettierd", "prettier", stop_after_first = true },
	typescript = { "prettierd", "prettier", stop_after_first = true },
	javascriptreact = { "prettierd", "prettier", stop_after_first = true },
	typescriptreact = { "prettierd", "prettier", stop_after_first = true },
}

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts_extend = { "formatters_by_ft" },
	opts = {
		formatters_by_ft = formatters_by_ft,
		default_format_opts = {
			lsp_format = "fallback",
		},
		notify_on_error = true,
	},
}
