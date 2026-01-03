local function verbose()
	local ok, out = pcall(vim.fn.execute, "Neoformat")

	if not ok then
		return
	end

	local split = vim.split(out, "\n", { plain = true })
	local lines = {}

	for _, line in ipairs(split) do
		line = (line:gsub("%s+$", ""))

		if line ~= "" then
			table.insert(lines, line)
		end
	end

	if lines[#lines] ~= "Neoformat: no change necessary" then
		return
	end

	local regex = "^Neoformat: executable: .+ is not an executable$"

	for x = 1, #lines - 1 do
		if not lines[x]:match(regex) then
			return
		end
	end

	lines[#lines] = "Neoformat: no formatters available"

	local msg = table.concat(lines, "\n") .. "\n"
	vim.notify(msg, vim.log.levels.WARN, { title = "Neoformat" })
end

return {
	"sbdchd/neoformat",

	lazy = true,
	cmd = "Neoformat",

	init = function()
		vim.g.neoformat_try_node_exe = 1
		vim.g.neoformat_basic_format_retab = 1
		vim.g.neoformat_basic_format_trim = 1

		vim.g.neoformat_verbose = 1
		local catch_verbose = true

		if not catch_verbose then
			vim.cmd([[autocmd BufWritePre * Neoformat]])
			return
		end
		local group_name = "NeoformatFiltered"
		local group = vim.api.nvim_create_augroup(group_name, { clear = true })

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = group,
			pattern = "*",
			callback = verbose,
		})
		vim.api.nvim_create_user_command(group_name, verbose, {})
	end,
}
