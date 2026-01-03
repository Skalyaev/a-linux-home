local servers = {
	lua_ls = "lsp.lua",
	bashls = "lsp.bash",
	rust_analyzer = "lsp.rust",
	ccls = "lsp.c",
	pyright = "lsp.python.pyright",
	ruff = "lsp.python.ruff",
	dockerls = "lsp.docker",
	ts_ls = "lsp.typescript",
}

return {
	"neovim/nvim-lspconfig",

	dependencies = { "hrsh7th/nvim-cmp" },

	init = function()
		local server_names = vim.tbl_keys(servers)
		table.sort(server_names)

		for _, lsp in ipairs(server_names) do
			vim.lsp.config[lsp] = require(servers[lsp])
			vim.lsp.enable(lsp)
		end
	end,

	config = function()
		local cmp = require("cmp_nvim_lsp")
		vim.lsp.config.capabilities = cmp.default_capabilities()
	end,
}
