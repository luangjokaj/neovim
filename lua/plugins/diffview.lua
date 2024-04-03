return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({})
		vim.keymap.set("n", "<leader>do", ":DiffviewOpen<CR>")
		vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory<CR>")
		vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR>")
	end,
}
