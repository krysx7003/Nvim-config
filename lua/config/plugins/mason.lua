return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"debugpy",
				"flake8",
				"isort",
				"mypy",
				"pylint",
				"lua-language-server",
				"codelldb",
				"clangd",
				"clang-format",
				"basedpyright",
				"ruff",
			},
		})
	end,
}
