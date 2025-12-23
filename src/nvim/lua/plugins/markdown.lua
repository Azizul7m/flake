return {
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
