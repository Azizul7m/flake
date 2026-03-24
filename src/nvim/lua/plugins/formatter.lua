return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			go = { "goimports-reviser", "gofumpt", "golines" },
			templ = { "templ" },
			json = { "prettier" },
			yaml = { "prettier" },
			nix = { "nixfmt" },
			sql = { "sqlfmt" },
			bash = { "shfmt" },
			bib = { "bibtex-tidy" },
			markdown = { "prettier" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = {
			-- I recommend these options. See :help conform.format for details.
			lsp_format = "fallback",
			timeout_ms = 500,
		},
		notify_on_error = true,
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
	end,
}
