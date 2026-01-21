local open_floating_preview = vim.lsp.util.open_floating_preview

---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}

	local border = "single"
	local max_width = 60
	local padding_x = 1

	opts.border = opts.border or border
	opts.max_width = opts.max_width or max_width

	if type(contents) == "table" then
		local padding = string.rep(" ", padding_x)

		for x, line in ipairs(contents) do
			contents[x] = padding .. line .. padding
		end
	end

	local bufnr, winid = open_floating_preview(contents, syntax, opts, ...)

	if winid and vim.api.nvim_win_is_valid(winid) then
		vim.api.nvim_set_option_value("linebreak", true, { win = winid })
	end
	return bufnr, winid
end

local diagnostic_window = {
	source = true,
	header = "",
	prefix = "",
}
vim.diagnostic.config({ float = diagnostic_window })
