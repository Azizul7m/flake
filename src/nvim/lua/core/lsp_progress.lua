local M = {}

local progress = {}
local frames = { "-", "\\", "|", "/" }

local function redraw_statusline()
	vim.cmd("redrawstatus")
end

local function update(token_progress, value)
	token_progress.title = value.title or token_progress.title
	token_progress.message = value.message or token_progress.message
	token_progress.percentage = value.percentage or token_progress.percentage
end

local function format_token(token_progress)
	if token_progress.percentage then
		return string.format("%s %d%%", token_progress.client_name, token_progress.percentage)
	end

	return token_progress.client_name
end

function M.status(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	local messages = {}
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		for _, token_progress in pairs(progress[client.id] or {}) do
			table.insert(messages, format_token(token_progress))
		end
	end

	if #messages == 0 then
		return ""
	end

	table.sort(messages)
	local frame = frames[(math.floor(vim.loop.now() / 120) % #frames) + 1]
	return frame .. " " .. table.concat(messages, " ")
end

function M.setup()
	local group = vim.api.nvim_create_augroup("my.lsp.config", { clear = true })

	vim.api.nvim_create_autocmd("LspProgress", {
		group = group,
		callback = function(ev)
			local value = ev.data.params.value
			local client_id = ev.data.client_id
			local token = ev.data.params.token
			local client = vim.lsp.get_client_by_id(client_id)

			if not client then
				return
			end

			progress[client_id] = progress[client_id] or {}

			if value.kind == "begin" then
				progress[client_id][token] = {
					client_name = client.name,
					title = value.title,
					message = value.message,
					percentage = value.percentage,
				}
				redraw_statusline()
				return
			end

			local token_progress = progress[client_id][token]
			if not token_progress then
				return
			end

			if value.kind == "report" then
				update(token_progress, value)
			else
				progress[client_id][token] = nil
				if not next(progress[client_id]) then
					progress[client_id] = nil
				end
			end

			redraw_statusline()
		end,
	})
end

return M
