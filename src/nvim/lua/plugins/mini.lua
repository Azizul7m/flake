return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	version = "*",
	config = function()
		require("mini.pairs").setup()
		require("core.lsp_progress").setup()
		local statusline = require("mini.statusline")
		statusline.setup({
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 40 })
					local diff = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
					local lsp_progress = MiniStatusline.is_truncated(120) and "" or require("core.lsp_progress").status()
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location = MiniStatusline.section_location({ trunc_width = 75 })
					local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp_progress ~= "" and lsp_progress or lsp } },
						"%<",
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=",
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
						{ hl = mode_hl, strings = { search, location } },
					})
				end,
			},
		})
		require("mini.comment").setup()
		require("mini.align").setup()
		require("mini.pick").setup()
		require("mini.surround").setup()
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "l",
				go_out = "h",
				go_out_plus = "H",
				go_in_plus = "<CR>",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
			windows = {
				preview = true,
			},
		})
	end,
}
