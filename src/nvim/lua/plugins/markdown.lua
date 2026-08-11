local find_notes = require("core.utils").find_directory("~/.notes", "Notes")

local function set_markdown_keymaps(bufnr)
	vim.keymap.set("n", "<leader>fn", find_notes, {
		buffer = bufnr,
		desc = "Find Notes",
	})
	vim.keymap.set("n", "gp", function()
		require("md-pdf").convert_md_to_pdf()
	end, {
		buffer = bufnr,
		desc = "Markdown preview",
	})
end

return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "obsidian" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {
			completions = { lsp = { enabled = true } },
			heading = {
				enabled = true,
				setext = true,
				sign = false,
				left_pad = 1,
				right_pad = 1,
				render_modes = true,
				position = "eol",
			},
			icons = { enabled = true },
			indent = { enabled = true },
			pipe_table = { enabled = true },
			-- Add padding to the right of various icons so they don't touch text
			bullet = {
				right_pad = 1,
			},
			checkbox = {
				left_pad = 0,
				right_pad = 2,
			},
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
			local group = vim.api.nvim_create_augroup("markdown_buffer_keymaps", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "obsidian" },
				group = group,
				callback = function(event)
					set_markdown_keymaps(event.buf)
				end,
			})
			if vim.tbl_contains({ "markdown", "obsidian" }, vim.bo.filetype) then
				set_markdown_keymaps(vim.api.nvim_get_current_buf())
			end
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
		ft = { "markdown", "obsidian" },
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
	},
	{
		"bullets-vim/bullets.vim",
		ft = {
			"markdown",
			"text",
			"tex",
			"plaintex",
			"norg",
		},
	},
}
