local function slugify(title)
	title = title:lower()
	title = title:gsub("[^%w%s%-]", "")
	title = title:gsub("%s+", "-")
	return title
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "md", "obsidian" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
		vim.opt_local.conceallevel = 2
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2

		vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownToc<CR>", {
			buffer = true,
			noremap = true,
			silent = true,
			desc = "Insert markdown TOC",
		})
	end,
})

vim.api.nvim_create_user_command("MarkdownToc", function()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local toc = {}

	for _, line in ipairs(lines) do
		local level, title = line:match("^(#{1,6})%s+(.-)%s*$")
		if level and title then
			local anchor = slugify(title)
			table.insert(toc, string.rep("  ", #level - 1) .. "- [" .. title .. "](#" .. anchor .. ")")
		end
	end

	if #toc == 0 then
		vim.notify("No markdown headings found", vim.log.levels.INFO)
		return
	end

	local cursor = vim.api.nvim_win_get_cursor(0)
	local insert_lines = { "", "## Table of Contents", "" }
	for _, item in ipairs(toc) do
		table.insert(insert_lines, item)
	end
	table.insert(insert_lines, "")

	vim.api.nvim_buf_set_lines(0, cursor[1] - 1, cursor[1] - 1, false, insert_lines)
end, {
	desc = "Insert a Markdown table of contents",
})

return {
	"mzlogin/vim-markdown-toc",
	ft = { "markdown", "md" },
	config = function()
		vim.g.vmt_list_item_char = "-"
		vim.g.vmt_fence_text = "```"
		vim.g.vmt_fence_closing_text = "```"
	end,
}
