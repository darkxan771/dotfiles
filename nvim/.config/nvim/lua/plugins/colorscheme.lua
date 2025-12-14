return {
	-- Catppuccin
	-- {
	-- 	"catppuccin/nvim",
	-- 	lazy = false,
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("catppuccin-frappe")
	-- 		require("catppuccin").setup({ auto_integrations = true })
	-- 	end,
	-- },

	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "storm",
			})
			vim.cmd.colorscheme("tokyonight")
			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#565f89" })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#565f89" })
		end,
	},
}
