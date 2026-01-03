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

		vim.keymap.set("n", "ze", ufo.openFoldsExceptKinds)
		vim.keymap.set("n", "za", ufo.closeFoldsWith)
		vim.keymap.set("n", "<leader>ze", ufo.openAllFolds)
		vim.keymap.set("n", "<leader>za", ufo.closeAllFolds)
	end,
	--PROBLEM: autoformat causes unfolding
}
