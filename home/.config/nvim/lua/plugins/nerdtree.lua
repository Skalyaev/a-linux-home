return {
	"preservim/nerdtree",

	lazy = true,
	cmd = "NERDTreeToggle",

	init = function()
		vim.g.NERDTreeWinSize = 20
		vim.g.NERDTreeMinimalUI = 1
		vim.g.NERDTreeShowHidden = 1
		vim.g.NERDTreeCascadeSingleChildDir = 0
		vim.g.NERDTreeBookmarksFile = "/dev/null"

		vim.keymap.set("n", "²", ":NERDTreeToggle<CR>")
		vim.keymap.set("n", "<M-²>", ":NERDTreeFocus<CR>")
	end,
}
