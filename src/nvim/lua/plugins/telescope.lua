return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-bibtex.nvim",
	},
	config = function()
		local bibliography_candidates = {
			vim.fn.expand("~/references.bib"),
			vim.fn.expand("~/.notes/references.bib"),
		}
		local bibliography_files = vim.tbl_filter(function(path)
			return vim.fn.filereadable(path) == 1
		end, bibliography_candidates)

		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules" }, -- keep node_modules ignored
				hidden = true, -- show dotfiles like .env
				no_ignore = true,
			},
			extensions = {
				bibtex = {
					depth = 1,
					custom_formats = {
						{ id = "pandoc", cite_marker = "[@%s]" },
					},
					format = "pandoc",
					search_keys = { "author", "year", "title", "label" },
					citation_format = "{{author}} ({{year}}). {{title}}.",
					global_files = bibliography_files,
					context = true,
					context_fallback = true,
					quiet = true,
					abbreviation = false,
					wrap_brackets = false,
				},
			},
		})

		telescope.load_extension("bibtex")
	end,
}
