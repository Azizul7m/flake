local M = {}

M.find_directory = function(directory, prompt_title)
	return function()
		local ok, builtin = pcall(require, "telescope.builtin")
		if not ok then
			vim.notify("Telescope is not loaded", vim.log.levels.ERROR)
			return
		end
		local config_dir = vim.fn.expand(directory)
		builtin.find_files({ cwd = config_dir, prompt_title = prompt_title })
	end
end

return M
