local bibliography_candidates = {
	vim.fn.expand("~/references.bib"),
	vim.fn.expand("~/.notes/references.bib"),
}
local bibliography_files = vim.tbl_filter(function(path)
	return vim.fn.filereadable(path) == 1
end, bibliography_candidates)

local default_sources = { "lsp", "path", "snippets", "buffer", "copilot", "dadbod" }
if #bibliography_files > 0 then
	table.insert(default_sources, "bibtex")
end

local dependencies = {
	"rafamadriz/friendly-snippets",
	"giuxtaposition/blink-cmp-copilot",
	{ "saghen/blink.compat", opts = { impersonate_nvim_cmp = true } },
}

if #bibliography_files > 0 then
	table.insert(dependencies, 3, {
		"liamvdvyver/cmp-bibtex",
		opts = {
			files = bibliography_files,
			filetypes = { "markdown", "pandoc", "quarto", "rmd", "tex", "plaintex", "bib" },
		},
	})
end

local providers = {
	task_metadata = {
		name = "Task metadata",
		module = "core.agenda",
	},
	copilot = {
		name = "copilot",
		module = "blink-cmp-copilot",
		score_offset = 100,
		async = true,
	},
	dadbod = {
		name = "Dadbod",
		module = "vim_dadbod_completion.blink",
	},
}

if #bibliography_files > 0 then
	providers.bibtex = {
		name = "bibtex",
		module = "blink.compat.source",
	}
end

return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = dependencies,
	version = "*",
	opts = {
		keymap = {
			preset = "default",
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<M-j>"] = { "select_next", "fallback" },
			["<M-k>"] = { "select_prev", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = vim.list_extend(default_sources, { "task_metadata" }),
			providers = providers,
		},
		cmdline = {
			enabled = true,
			keymap = nil, -- Inherits from top level keymap
			sources = function()
				local type = vim.fn.getcmdtype()
				-- Search forward and backward
				if type == "/" or type == "?" then
					return { "buffer" }
				end
				-- Commands
				if type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			menu = {
				draw = {
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}
