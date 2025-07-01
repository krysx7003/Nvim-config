return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		vim.keymap.set("n", "<C-_>", function()
			require("Comment.api").toggle.linewise.current()
		end)

		vim.keymap.set("v", "<C-_>", function()
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false) -- Exit visual mode first
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end, { desc = "Toggle comment selection" })
	end,
}
