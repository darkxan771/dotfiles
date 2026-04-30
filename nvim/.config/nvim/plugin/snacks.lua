vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

local Snacks = require("snacks")

Snacks.setup({
	animate = { enabled = true },
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	dim = { enabled = true },
	explorer = { enabled = true, replace_netrw = true },
	image = {
		enabled = true,
		SNACKS_GHOSTTY = true,
		math = { enabled = false },
	},
	indent = { enabled = true },
	input = { enabled = true },
	layout = { enabled = true },
	notifier = { enabled = true },
	picker = {
		enabled = true,
		ui_select = true,
		buftype = "prompt",
		sources = {
			files = {
				hidden = true,
				cmd = "fd",
			},
			grep = {
				hidden = true,
				cmd = "rg",
				regex = true,
			},
		},
		win = {
			input = {
				keys = {
					["J"] = { "preview_scroll_down", mode = { "i", "n" } },
					["K"] = { "preview_scroll_up", mode = { "i", "n" } },
					["H"] = { "preview_scroll_left", mode = { "i", "n" } },
					["L"] = { "preview_scroll_right", mode = { "i", "n" } },
				},
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scratch = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	terminal = { enabled = true },
	toggle = { enabled = true },
	words = { enabled = true },
	zen = { enabled = true },
})

vim.keymap.set("n", "<leader>ss", function()
	Snacks.picker.smart()
end, { desc = "Snacks Smart Find Files" })
vim.keymap.set("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Snacks Help" })
vim.keymap.set("n", "<leader>sf", function()
	Snacks.picker.files()
end, { desc = "Snacks Find Files" })
vim.keymap.set("n", "<leader>sb", function()
	Snacks.picker.buffers({ layout = "ivy" })
end, { desc = "Snacks Buffers" })
vim.keymap.set("n", "<leader>sy", function()
	Snacks.picker.lsp_symbols()
end, { desc = "Snacks Symbols" })
vim.keymap.set("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Snacks Grep" })
vim.keymap.set("n", "<leader>si", function()
	Snacks.picker.git_status()
end, { desc = "Snacks Git Status" })
vim.keymap.set("n", "<leader>sk", function()
	Snacks.picker.keymaps({ layout = "vertical" })
end, { desc = "Snacks Keymaps" })
vim.keymap.set("n", "<leader>sn", function()
	Snacks.terminal.open()
end, { desc = "Snacks NuShell" })
vim.keymap.set("n", "<leader>st", function()
	Snacks.picker.todo_comments({ layout = "ivy" })
end, { desc = "Snacks Todo" })
vim.keymap.set("n", "<leader>se", function()
	Snacks.explorer.open()
end, { desc = "Snacks File Explorer" })
vim.keymap.set("n", "<leader>sd", function()
	Snacks.picker.diagnostics({ layout = "ivy" })
end, { desc = "Snacks Diagnostics" })
vim.keymap.set("n", "<leader>sz", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })
