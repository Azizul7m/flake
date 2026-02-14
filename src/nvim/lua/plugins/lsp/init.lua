-- LSP Support
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"rachartier/tiny-inline-diagnostic.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"folke/neodev.nvim",
		"nvimdev/lspsaga.nvim",
	},
	opts = { diagnostics = { virtual_text = false } },
	config = function()
		-- Setup neodev first (for Neovim Lua development)
		require("neodev").setup({
			library = {
				plugins = { "nvim-dap-ui" },
				types = true,
			},
		})

		-- Setup tiny-inline-diagnostic
		require("tiny-inline-diagnostic").setup({
			preset = "modern",
			transparent_bg = true,
			transparent_cursorline = true,
			options = {
				add_messages = {
					messages = true, -- Show full diagnostic messages
					display_count = true,
					show_multiple_glyphs = true,
				},
				multilines = {
					enabled = true,
				},
				show_source = {
					enabled = true,
				},
				use_icons_from_diagnostic = true,
			},
		})
		require("fidget").setup({})
		require("lspsaga").setup({
			lightbulb = {
				enable = false,
			},
		})
		-- Initialize mason and mason-lspconfig
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "bashls" },
			automatic_installation = true,
		})

		local handlers = require("plugins.lsp.handlers")
		local on_attach = handlers.on_attach
		local capabilities = handlers.capabilities
		local lsp = vim.lsp

		lsp.config["luals"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
		}
		lsp.enable("luals")
		lsp.config["harper-ls"] = {
			cmd = { "~/.nix-profile/bin/harper-ls" },
			filetypes = { "md" },
		}
		lsp.enable("harper_ls")
	end,
}
