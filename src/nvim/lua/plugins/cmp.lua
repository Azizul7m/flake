-- Completion
return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-emoji",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"echasnovski/mini.icons", -- for nice symbols
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local icons = require("mini.icons")

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<M-j>"] = cmp.mapping(
					cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					{ "i" }
				),
				["<M-k>"] = cmp.mapping(
					cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					{ "i" }
				),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = cmp.config.sources({
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "emoji", option = { insert = true } },
			}),

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local icon, _ = icons.get("lsp", vim_item.kind)
					if icon then
						vim_item.kind = icon .. " " .. vim_item.kind
					end

					vim_item.menu = ({
						copilot = "[Copilot]",
						nvim_lsp = "[LSP]",
						nvim_lua = "[Lua]",
						luasnip = "[Snip]",
						buffer = "[Buf]",
						path = "[Path]",
					})[entry.source.name]

					return vim_item
				end,
			},

			experimental = {
				ghost_text = false,
			},
		})

		cmp.setup.filetype({ "sql" }, {
			sources = {
				{ name = "nvim_lsp" },
				{ name = "vim-dadbod-completion" },
				{ name = "buffer" },
			},
		})

		cmp.setup.filetype({ "lua" }, {
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})

		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "cmdline" },
			},
		})
	end,
}
