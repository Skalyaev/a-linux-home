vim.api.nvim_create_autocmd("CursorHold", {

	callback = function()
		local cursor = vim.api.nvim_win_get_cursor(0)
		local lnum = cursor[1] - 1

		local count = vim.diagnostic.get(0, { lnum = lnum })
		local scope = (#count > 0) and "line" or "buffer"

		vim.diagnostic.open_float(nil, { scope = scope })
	end,
})
