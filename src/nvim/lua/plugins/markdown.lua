local function export_with_pandoc(format)
	local input = vim.api.nvim_buf_get_name(0)
	if input == "" then
		vim.notify("Save the file before exporting", vim.log.levels.WARN)
		return
	end

	vim.cmd("write")

	local output = vim.fn.fnamemodify(input, ":r") .. "." .. format
	local cmd = { "pandoc", input, "--citeproc", "-o", output }

	if format == "pdf" then
		table.insert(cmd, 3, "--pdf-engine=xelatex")
	end

	vim.system(cmd, { text = true }, function(result)
		vim.schedule(function()
			if result.code == 0 then
				vim.notify("Exported " .. output, vim.log.levels.INFO)
			else
				local message = result.stderr ~= "" and result.stderr or result.stdout
				vim.notify("Pandoc export failed:\n" .. message, vim.log.levels.ERROR)
			end
		end)
	end)
end

local function update_frontmatter_field(field, value)
	local bufnr = vim.api.nvim_get_current_buf()
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

	if lines[1] ~= "---" then
		vim.notify("Current file has no YAML frontmatter", vim.log.levels.WARN)
		return
	end

	local end_idx
	for i = 2, #lines do
		if lines[i] == "---" then
			end_idx = i
			break
		end
	end

	if not end_idx then
		vim.notify("Could not find the end of YAML frontmatter", vim.log.levels.ERROR)
		return
	end

	local pattern = "^" .. vim.pesc(field) .. ":"
	for i = 2, end_idx - 1 do
		if lines[i]:match(pattern) then
			lines[i] = field .. ": " .. value
			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
			vim.notify("Updated " .. field .. " to " .. value, vim.log.levels.INFO)
			return
		end
	end

	table.insert(lines, end_idx, field .. ": " .. value)
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
	vim.notify("Added " .. field .. " to frontmatter", vim.log.levels.INFO)
end

local bibliography_candidates = {
	vim.fn.expand("~/references.bib"),
	vim.fn.expand("~/.notes/references.bib"),
}
local default_bibliography = ""
for _, path in ipairs(bibliography_candidates) do
	if vim.fn.filereadable(path) == 1 then
		default_bibliography = path
		break
	end
end

return {
	{
		"nvim-lua/plenary.nvim",
		ft = { "markdown", "pandoc", "quarto" },
		config = function()
			local map = vim.keymap.set
			local opts = { silent = true }

			pcall(vim.api.nvim_del_user_command, "PaperDocx")
			pcall(vim.api.nvim_del_user_command, "PaperPdf")
			pcall(vim.api.nvim_del_user_command, "PaperSetBib")
			pcall(vim.api.nvim_del_user_command, "PaperSetCsl")

			vim.api.nvim_create_user_command("PaperDocx", function()
				export_with_pandoc("docx")
			end, { desc = "Export current paper to DOCX with Pandoc" })

			vim.api.nvim_create_user_command("PaperPdf", function()
				export_with_pandoc("pdf")
			end, { desc = "Export current paper to PDF with Pandoc" })

			vim.api.nvim_create_user_command("PaperSetBib", function(command_opts)
				update_frontmatter_field("bibliography", command_opts.args)
			end, {
				nargs = 1,
				complete = "file",
				desc = "Set bibliography path in YAML frontmatter",
			})

			vim.api.nvim_create_user_command("PaperSetCsl", function(command_opts)
				update_frontmatter_field("csl", command_opts.args)
			end, {
				nargs = 1,
				complete = "file",
				desc = "Set CSL path in YAML frontmatter",
			})

			map("n", "<leader>md", "<cmd>PaperDocx<CR>", vim.tbl_extend("force", opts, { desc = "Export DOCX" }))
			map("n", "<leader>mp", "<cmd>PaperPdf<CR>", vim.tbl_extend("force", opts, { desc = "Export PDF" }))
			map("n", "<leader>mb", function()
				vim.ui.input({ prompt = "Bibliography path: ", default = default_bibliography }, function(input)
					if input and input ~= "" then
						update_frontmatter_field("bibliography", input)
					end
				end)
			end, vim.tbl_extend("force", opts, { desc = "Set bibliography" }))
			map("n", "<leader>mc", function()
				vim.ui.input({
					prompt = "CSL path: ",
					default = "",
				}, function(input)
					if input and input ~= "" then
						update_frontmatter_field("csl", input)
					end
				end)
			end, vim.tbl_extend("force", opts, { desc = "Set CSL" }))
		end,
	},

	{
		"jbyuki/nabla.nvim",
		ft = { "markdown", "tex" },
		keys = {
			{ "<leader>tp", function() require("nabla").popup() end, desc = "Preview LaTeX" },
		},
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			buffers = {
				-- set to false to disable the otter completion source
				set_filetype = true,
				-- write to otter-internal-buffer
				write_to_disk = false,
			},
		},
	},
	{
		-- Make sure to set this up properly if you have lazy=true
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			file_types = { "markdown", "Avante" },
		},
		ft = { "markdown", "Avante" },
		config = function()
			require("render-markdown").setup({
				completions = { lsp = { enabled = true } },
			})
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app && npm install",
		config = function()
			vim.g.mkdp_auto_start = 0 -- Don't auto-start preview
		end,
	},
	{
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown",
		config = function()
			require("markdown-plus").setup({
				-- Your custom configuration here
			})
		end,
	},
	{
		"jbuck95/nvim-sioyek-highlights",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = true,
	},
	{
		"alexxGmZ/Md2Pdf",
		cmd = "Md2Pdf",
		config = function()
			require("Md2Pdf").setup({
				pdf_engine = "xelatex",
				--		yaml_template_path = vim.fn.expand("~/.local/share/pandoc/templates/eisvogel.latex"),
			})
		end,
	},
}
