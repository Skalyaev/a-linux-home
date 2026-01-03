local bash_files = {
	[".bash_env"] = "bash",
	[".bash_welcome"] = "bash",
}

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	lazy = true,
	event = "BufEnter",

	init = function()
		vim.filetype.add({ filename = bash_files })
	end,

	config = function()
		vim.cmd([[TSUpdate]])

		require("nvim-treesitter.configs").setup({
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = true,
		})
	end,
}
