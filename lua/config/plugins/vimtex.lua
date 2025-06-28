return {
	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			-- Change to javelin
			vim.g.vimtex_view_method = "zathura"
		end,
	},
}
