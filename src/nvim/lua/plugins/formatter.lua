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
}

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = formatters_by_ft,
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = function(bufnr)
			local filetype = vim.bo[bufnr].filetype
			-- Markdown and Obsidian notes use wikilinks and custom frontmatter.
			if filetype == "markdown" or filetype == "obsidian" then
				return
			end
			-- Only format filetypes explicitly configured above. This prevents
			-- unrelated LSPs from formatting buffers on save via fallback.
			if not formatters_by_ft[filetype] then
				return
			end
			return {
				lsp_format = "fallback",
				timeout_ms = 500,
			}
		end,
		notify_on_error = true,
	},
	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)
	end,
}
