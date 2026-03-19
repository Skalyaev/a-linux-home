return {
	"kevinhwang91/nvim-ufo",

	dependencies = { "kevinhwang91/promise-async" },

	lazy = true,
	event = "BufEnter",

	init = function()
		vim.opt.foldlevel = 42
		vim.opt.foldlevelstart = 42
		vim.opt.foldcolumn = "1"
	end,

	config = function()
		local ufo = require("ufo")
		ufo.setup({ open_fold_hl_timeout = 200 })

		vim.keymap.set("n", "za", "zc")
		vim.keymap.set("n", "ze", "zo")
		vim.keymap.set("n", "ZA", "zC")
		vim.keymap.set("n", "ZE", "zO")
		vim.keymap.set("n", "<leader>za", ufo.closeAllFolds)
		vim.keymap.set("n", "<leader>ze", ufo.openAllFolds)
	end,
	--PROBLEM: autoformat causes unfolding
}
