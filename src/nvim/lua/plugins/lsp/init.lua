-- LSP Support
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
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
			ensure_installed = { "bashls", "gopls", "templ", "html", "tailwindcss" },
			automatic_installation = true,
		})

		local handlers = require("plugins.lsp.handlers")
		local on_attach = handlers.on_attach
		local capabilities = handlers.get_capabilities()
		local lsp = vim.lsp

		lsp.config["lua_ls"] = {
			cmd = { "lua-language-server" },
			filetypes = { "lua" },
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		}
		lsp.enable("lua_ls")

		lsp.config["harper-ls"] = {
			cmd = { "harper-ls", "--stdio" },
			filetypes = { "md" },
		}
		lsp.enable("harper-ls")

		lsp.config["gopls"] = {
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_markers = { "go.work", "go.mod", ".git" },
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		}
		lsp.enable("gopls")

		lsp.config["templ"] = {
			cmd = { "templ", "lsp" },
			filetypes = { "templ" },
			root_markers = { "go.mod", ".git" },
		}
		lsp.enable("templ")

		lsp.config["html"] = {
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "templ" },
		}
		lsp.enable("html")

		lsp.config["htmx"] = {
			cmd = { "htmx-lsp" },
			filetypes = { "html", "templ" },
		}
		lsp.enable("htmx")

		lsp.config["tailwindcss"] = {
			cmd = { "tailwindcss-language-server", "--stdio" },
			filetypes = { "html", "templ", "javascript", "typescript", "react" },
			root_markers = {
				"tailwind.config.js",
				"tailwind.config.ts",
				"postcss.config.js",
				"postcss.config.ts",
				"package.json",
				"node_modules",
				".git",
			},
			init_options = {
				userLanguages = {
					templ = "html",
				},
			},
		}
		lsp.enable("tailwindcss")

		-- Global config for all servers
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client then
					on_attach(client, args.buf)
				end
			end,
		})
	end,
}
