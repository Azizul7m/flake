return {
	-- General Go development setup (optional, but recommended)
	"ray-x/go.nvim",
	-- ... other go.nvim configuration ...

	-- Proper syntax highlighting for Go templates
	{
		"ngynkvn/gotmpl.nvim",
		ft = { "gotmpl", "htmlgotmpl", "yamlgotmpl", "gomod" }, -- Add relevant filetypes
		config = function()
			require("gotmpl").setup({})
		end,
	},

	-- Go template Language Server Protocol
	{
		"yayolande/go-template-lsp",
		ft = { "gotmpl", "htmlgotmpl", "yamlgotmpl" },
		-- You might need to install the LSP server globally: `go install github.com/yayolande/go-template-lsp@latest`
		-- Then configure the LSP to start automatically:
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "htmlgotmpl", "gotmpl", "yamlgotmpl" }, -- Match your filetypes
				callback = function()
					vim.lsp.start({
						name = "go-template-lsp",
						cmd = { "go-template-lsp" },
						-- Adjust root_dir detection if needed
						root_dir = vim.fs.dirname(vim.fs.find({ "go.mod" }, { upward = true })[1]),
					})
				end,
			})
		end,
	},
}
