return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"html",
					"javascript",
					"norg",
					"scss",
					"svelte",
					"tsx",
					"typst",
					"vue",
					"json",
					"latex",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"regex",
					"toml",
					"yaml",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
