return {

	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
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
