-- LSP Support
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"rachartier/tiny-inline-diagnostic.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
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

		require("lspsaga").setup({
			lightbulb = {
				enable = false,
			},
		})
		-- Initialize mason and mason-lspconfig
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "bashls", "gopls", "templ", "html", "tailwindcss" },
			automatic_installation = false,
		})

		local handlers = require("plugins.lsp.handlers")
		local on_attach = handlers.on_attach
		local capabilities = handlers.get_capabilities()
		local lsp = vim.lsp

		local function with_defaults(config)
			return vim.tbl_deep_extend("force", {
				capabilities = capabilities,
			}, config or {})
		end

		lsp.config["ts_ls"] = with_defaults({
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = {
				"javascript",
				"javascriptreact",
				"javascript.jsx",
				"typescript",
				"typescriptreact",
				"typescript.tsx",
			},
		})
		lsp.enable("ts_ls")

		lsp.config["harper-ls"] = with_defaults({
			cmd = { "harper-ls", "--stdio" },
			filetypes = { "md", "org", "txt" },
		})
		lsp.enable("harper-ls")

		lsp.config["gopls"] = with_defaults({
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
		})
		lsp.enable("gopls")

		lsp.config["templ"] = with_defaults({
			cmd = { "templ", "lsp" },
			filetypes = { "templ" },
			root_markers = { "go.mod", ".git" },
		})
		lsp.enable("templ")

		lsp.config["html"] = with_defaults({
			cmd = { "vscode-html-language-server", "--stdio" },
			filetypes = { "html", "templ" },
		})
		lsp.enable("html")

		lsp.config["tailwindcss"] = with_defaults({
			cmd = { "tailwindcss-language-server", "--stdio" },
			filetypes = {
				"html",
				"css",
				"scss",
				"sass",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"templ",
			},
			root_markers = {
				"tailwind.config.js",
				"tailwind.config.cjs",
				"tailwind.config.mjs",
				"tailwind.config.ts",
				"tailwind.config.cts",
				"tailwind.config.mts",
				"postcss.config.js",
				"postcss.config.cjs",
				"postcss.config.mjs",
				"postcss.config.ts",
				"postcss.config.cts",
				"postcss.config.mts",
				"package.json",
				"node_modules",
				".git",
			},
			settings = {
				tailwindCSS = {
					includeLanguages = {
						templ = "html",
					},
				},
			},
		})
		lsp.enable("tailwindcss")

		lsp.config["lua_ls"] = with_defaults({
			cmd = { "lua-language-server" },
			settings = {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
		lsp.enable("lua_ls")

		lsp.config["ltex"] = with_defaults({
			cmd = { "ltex-ls" },
			filetypes = { "markdown", "tex", "bib", "plaintex", "rst", "context", "txt" },
		})
		lsp.enable("ltex")

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
