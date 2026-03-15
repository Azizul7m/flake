return {
	-- General Go development setup
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				lsp_cfg = false, -- We handle LSP in lsp/init.lua
				lsp_gofumpt = false,
				lsp_on_attach = false,
				lsp_keymaps = false,
				lsp_diag_update_in_insert = false,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},

	-- Proper syntax highlighting for Go templates
	{
		"ngynkvn/gotmpl.nvim",
		ft = { "gotmpl", "htmlgotmpl", "yamlgotmpl", "gomod" },
		config = function()
			require("gotmpl").setup({})
		end,
	},

	-- Go template Language Server Protocol
	{
		"yayolande/go-template-lsp",
		ft = { "gotmpl", "htmlgotmpl", "yamlgotmpl" },
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "htmlgotmpl", "gotmpl", "yamlgotmpl" },
				callback = function()
					vim.lsp.start({
						name = "go-template-lsp",
						cmd = { "go-template-lsp" },
						root_dir = vim.fs.dirname(vim.fs.find({ "go.mod" }, { upward = true })[1]),
					})
				end,
			})
		end,
	},
}
