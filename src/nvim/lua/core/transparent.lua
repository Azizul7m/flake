local function apply_transparent()
	vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "WinSeparator", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
end

_G.apply_transparent = apply_transparent
apply_transparent()

vim.api.nvim_create_autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup("TransparentBackground", { clear = true }),
	callback = apply_transparent,
})

-- Re-apply transparency when the generated theme file changes
local theme_file = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
if not _G._transparent_theme_watcher then
	local uv = vim.uv or vim.loop
	_G._transparent_theme_watcher = uv.new_fs_event()
	_G._transparent_theme_watcher:start(theme_file, {}, vim.schedule_wrap(function()
		-- Defer to allow the theme to finish applying first
		vim.defer_fn(apply_transparent, 20)
	end))
end
