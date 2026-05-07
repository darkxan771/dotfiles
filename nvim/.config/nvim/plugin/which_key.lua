vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

require("which-key").setup({
	filter = function(mapping)
		return mapping.desc and mapping.desc ~= "which_key_ignore"
	end,
	win = {
		no_overlap = false,
		height = 15,
	},
})
require("which-key").add({
	{ "<leader>c", group = "Code" },
	{ "[", group = "Previous" },
	{ "]", group = "Next" },
	{ "<leader>g", group = "Git" },
	{ "<leader>l", group = "LaTeX" },
	{ "<leader>s", group = "Snacks" },
	{ "<leader>t", group = "Toggle" },
	{ "<leader>u", group = "Update" },
	{ "gr", group = "LSP" },
})

vim.keymap.set("n", "<leader>?", "<cmd>lua require('which-key').show()<cr>", { silent = true, desc = "Show key map" })
