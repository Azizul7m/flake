return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true } },
			heading = { enabled = false },
			icons = { enabled = true },
			indent = { enabled = true },
			pipe_table = { enabled = true },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
		end,
	},

	{
		"hedyhli/markdown-toc.nvim",
		ft = "markdown", -- Lazy load on markdown files
		cmd = { "Mtoc" }, -- Lazy load on command
		main = "mtoc", -- Ensures lazy loading points to the correct lua module
		opts = {
			fences = {
				enabled = true, -- Required for auto-updating and removing
				start_text = "start toc",
				end_text = "end toc",
			},
			auto_update = {
				enabled = true, -- Only update the TOC when explicitly requested
				events = { "BufWritePre" },
				pattern = "*.{md,mdown,mkd,mkdn,markdown,mdwn}",
			},
		},
		config = function(_, opts)
			require("mtoc").setup(opts)
		end,
	},

	{
		"arminveres/md-pdf.nvim",
		branch = "main", -- you can assume that main is somewhat stable until releases will be made
		lazy = true,
		---@type md-pdf.config
		opts = {
			margins = "1.5cm",
			highlight = "tango",
			toc = false,
			-- Render a dedicated title page (and keep ToC on a separate page)
			title_page = false,
			ignore_viewer_state = true,
			fonts = {
				main_font = "Noto Sans",
				sans_font = "Noto Sans",
				mono_font = "Iosevka",
				math_font = nil,
			},
			-- Prevent document front matter from enabling Pandoc's generated TOC.
			pandoc_user_args = { "--metadata", "toc:false" },
		},
		config = function(_, opts)
			require("md-pdf").setup(opts)
		end,
		keys = {
			{
				"gp",
				function()
					require("md-pdf").convert_md_to_pdf()
				end,
				desc = "Markdown preview",
			},
		},
	},
}
