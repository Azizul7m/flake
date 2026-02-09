return {

	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
		config = function()
			require("render-markdown").setup({
				completions = { lsp = { enabled = true } },
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_auto_start = 0 -- Don't auto-start preview
		end,
	},
	{
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown",
		config = function()
			require("markdown-plus").setup({
				-- Your custom configuration here
			})
		end,
	},
	{
		"jbuck95/nvim-sioyek-highlights",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = true,
	},
	{
		"alexxGmZ/Md2Pdf",
		cmd = "Md2Pdf",
		config = function()
			require("Md2Pdf").setup({
				pdf_engine = "xelatex",
				--		yaml_template_path = vim.fn.expand("~/.local/share/pandoc/templates/eisvogel.latex"),
			})
		end,
	},
}
