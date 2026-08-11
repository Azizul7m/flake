local M = {}

local vaults = {
	vim.fn.expand("~/.notes"),
	vim.fn.expand("~/.notes/work"),
}

local function shell_escape(value)
	return vim.fn.shellescape(value)
end

local function files()
	local result = {}
	local seen = {}
	for _, vault in ipairs(vaults) do
		if vim.fn.isdirectory(vault) == 1 then
			local output = vim.fn.system("rg --files -g '*.md' " .. shell_escape(vault))
			for file in output:gmatch("[^\n]+") do
				if not seen[file] then
					seen[file] = true
					table.insert(result, file)
				end
			end
		end
	end
	return result
end

local function date_from_task(text)
	return text:match("@due%((%d%d%d%d%-%d%d%-%d%d)%)")
		or text:match("📅%s*(%d%d%d%d%-%d%d%-%d%d)")
		or text:match("due:%s*(%d%d%d%d%-%d%d%-%d%d)")
end

local function duration_from_task(text)
	local hours, minutes = text:match("@time%((%d+):(%d%d)%)")
	return (tonumber(hours) or 0) * 60 + (tonumber(minutes) or 0)
end

local function format_duration(minutes)
	return string.format("%02d:%02d", math.floor(minutes / 60), minutes % 60)
end

local function parse_tasks(filter)
	local tasks = {}
	for _, file in ipairs(files()) do
		local lines = vim.fn.readfile(file)
		for lnum, line in ipairs(lines) do
			local state, text = line:match("^%s*[-*+] %[(.)%]%s+(.+)$")
			if state and state ~= "x" and state ~= "X" then
				local due = date_from_task(text)
				if not filter or filter(due, text) then
					table.insert(tasks, {
						file = file,
						lnum = lnum,
						line = line,
						text = text,
						due = due,
						duration = duration_from_task(text),
					})
				end
			end
		end
	end
	return tasks
end

local function today()
	return os.date("%Y-%m-%d")
end

local function add_minutes(date, days)
	local year, month, day = date:match("(%d+)%-(%d+)%-(%d+)")
	return os.date("%Y-%m-%d", os.time({ year = year, month = month, day = day }) + days * 86400)
end

local function open_task(task)
	vim.cmd("edit " .. vim.fn.fnameescape(task.file))
	vim.api.nvim_win_set_cursor(0, { task.lnum, 0 })
	vim.cmd("normal! zz")
end

function M.open(filter, title)
	local tasks = parse_tasks(filter)
	table.sort(tasks, function(a, b)
		return (a.due or "9999-99-99") < (b.due or "9999-99-99")
	end)

	local lines = { "# " .. title, "", "  Enter/o: open task    r: refresh    q: close", "" }
	if #tasks == 0 then
		table.insert(lines, "No open tasks found.")
	else
		for _, task in ipairs(tasks) do
			local due = task.due or "no date"
			local duration = task.duration > 0 and ("  ⏱ " .. format_duration(task.duration)) or ""
			table.insert(lines, string.format("- %s  |  %s%s", task.text, due, duration))
		end
	end

	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	vim.bo[buf].filetype = "markdown"
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].modifiable = false
	vim.api.nvim_set_current_buf(buf)

	local function refresh()
		vim.api.nvim_buf_delete(buf, { force = true })
		M.open(filter, title)
	end
	local function select()
		local index = vim.api.nvim_win_get_cursor(0)[1] - 4
		if tasks[index] then
			open_task(tasks[index])
		end
	end
	vim.keymap.set("n", "<CR>", select, { buffer = buf, silent = true })
	vim.keymap.set("n", "o", select, { buffer = buf, silent = true })
	vim.keymap.set("n", "r", refresh, { buffer = buf, silent = true })
	vim.keymap.set("n", "q", "<cmd>bd!<CR>", { buffer = buf, silent = true })
end

function M.today()
	local date = today()
	M.open(function(due)
		return due == date or not due
	end, "Agenda · Today (" .. date .. ")")
end

function M.week()
	local start = today()
	local finish = add_minutes(start, 7)
	M.open(function(due)
		return not due or (due >= start and due <= finish)
	end, "Agenda · Next 7 Days")
end

function M.all()
	M.open(nil, "Agenda · All Open Tasks")
end

local function task_line()
	local line = vim.api.nvim_get_current_line()
	if not line:match("^%s*[-*+] %[[^xX]%]") then
		vim.notify("Place the cursor on an open Markdown task", vim.log.levels.WARN)
		return nil
	end
	return line
end

local function set_line(line)
	vim.api.nvim_set_current_line(line)
	vim.cmd("update")
end

function M.start()
	local line = task_line()
	if not line then
		return
	end
	if line:match("@started%(") then
		vim.notify("This task is already running", vim.log.levels.INFO)
		return
	end
	set_line(line .. " @started(" .. os.date("%Y-%m-%dT%H:%M") .. ")")
	vim.notify("Timer started")
end

function M.stop()
	local line = task_line()
	if not line then
		return
	end
	local started = line:match("@started%(([^)]+)%)")
	if not started then
		vim.notify("This task has no active timer", vim.log.levels.WARN)
		return
	end
	local year, month, day, hour, minute = started:match("(%d+)%-(%d+)%-(%d+)T(%d+):(%d+)")
	local start_time = os.time({ year = year, month = month, day = day, hour = hour, min = minute })
	local elapsed = math.max(1, math.floor((os.time() - start_time) / 60))
	local old = line:match("@time%((%d+):(%d%d)%)")
	local total = 0
	if old then
		local h, m = old:match("(%d+):(%d%d)")
		total = tonumber(h) * 60 + tonumber(m)
		line = line:gsub("%s*@time%(%d+:%d%d%)", "")
	end
	line = line:gsub("%s*@started%([^)]*%)", "")
	set_line(line .. " @time(" .. format_duration(total + elapsed) .. ")")
	vim.notify("Timer stopped: +" .. format_duration(elapsed) .. " (total " .. format_duration(total + elapsed) .. ")")
end

function M.schedule()
	local line = task_line()
	if not line then
		return
	end
	vim.ui.input({ prompt = "Due date (YYYY-MM-DD): ", default = today() }, function(date)
		if not date or date == "" then
			return
		end
		line = line:gsub("%s*@due%([^)]*%)", "")
		set_line(line .. " @due(" .. date .. ")")
	end)
end

function M.completion_source()
	return {
		name = "task_metadata",
		enabled = function()
			return vim.bo.filetype == "markdown" or vim.bo.filetype == "obsidian"
		end,
		get_trigger_characters = function()
			return { "@" }
		end,
		get_completions = function(_, _, callback)
			local today_date = os.date("%Y-%m-%d")
			local tomorrow_date = os.date("%Y-%m-%d", os.time() + 86400)
			callback({
				is_incomplete_backward = false,
				is_incomplete_forward = false,
				items = {
					{
						label = "@due(" .. today_date .. ")",
						insertText = "@due(" .. today_date .. ")",
						kind = vim.lsp.protocol.CompletionItemKind.Value,
					},
					{
						label = "@due(" .. tomorrow_date .. ")",
						insertText = "@due(" .. tomorrow_date .. ")",
						kind = vim.lsp.protocol.CompletionItemKind.Value,
					},
					{
						label = "@due(YYYY-MM-DD)",
						insertText = "@due()",
						kind = vim.lsp.protocol.CompletionItemKind.Keyword,
					},
					{
						label = "@priority(A)",
						insertText = "@priority()",
						kind = vim.lsp.protocol.CompletionItemKind.Keyword,
					},
					{
						label = "@time(HH:MM)",
						insertText = "@time()",
						kind = vim.lsp.protocol.CompletionItemKind.Keyword,
					},
					{
						label = "@context(work)",
						insertText = "@context()",
						kind = vim.lsp.protocol.CompletionItemKind.Keyword,
					},
				},
			})
		end,
	}
end

function M.new()
	return M.completion_source()
end

function M.setup()
	vim.api.nvim_create_user_command("Agenda", M.all, {})
	vim.api.nvim_create_user_command("AgendaToday", M.today, {})
	vim.api.nvim_create_user_command("AgendaWeek", M.week, {})
	vim.api.nvim_create_user_command("TaskStart", M.start, {})
	vim.api.nvim_create_user_command("TaskStop", M.stop, {})
	vim.api.nvim_create_user_command("TaskSchedule", M.schedule, {})
end

return M
