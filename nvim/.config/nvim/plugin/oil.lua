vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/malewicz1337/oil-git.nvim",
})

require("oil").setup({
	default_file_explorer = true,
	use_default_keymaps = false,
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	columns = { "icon" },
	float = { padding = 10, border = "rounded" },
	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<CR>"] = "actions.select",
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
		["<C-s>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-c>"] = { "actions.close", mode = "n" },
		["<C-l>"] = "actions.refresh",
		["-"] = { "actions.parent", mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["gx"] = "actions.open_external",
		["g."] = { "actions.toggle_hidden", mode = "n" },
	},
})
require("oil-git").setup()

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>to", "<CMD>lua require('oil').toggle_float()<CR>", { desc = "Toggle oil floating window" })
