local M = {
	buf = nil,
	win = nil,
}

M.params = {
	width = 160,
	height = 40,
	border = "single",
}

function M.toggle()
	local buf = vim.api.nvim_create_buf(false, true)
	if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
		buf = M.buf
	end

	local col = math.floor((vim.api.nvim_get_option("columns") - M.params.width) / 2)
	local row = math.floor((vim.api.nvim_get_option("lines") - M.params.height) / 2)

	local opts = {
		relative = "editor",
		width = M.params.width,
		height = M.params.height,
		col = col,
		row = row,
		style = "minimal",
		border = M.params.border,
	}

	if M.win and vim.api.nvim_win_is_valid(M.win) then
		vim.api.nvim_win_close(M.win, false)
		M.win = nil
	else
		M.win = vim.api.nvim_open_win(buf, true, opts)
	end

	if not M.buf or not vim.api.nvim_buf_is_valid(M.buf) then
		vim.cmd("term")
		M.buf = vim.api.nvim_win_get_buf(M.win)
		vim.opt_local.buflisted = false
	end
end

function M.setup(params)
	if params then
		for key, value in pairs(params) do
			if M.params[key] then
				M.params[key] = value
			end
		end
	end

	vim.api.nvim_create_user_command("Terminal", function()
		M.toggle()
	end, {})
end
return M
