return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			preset = {
				---@type snacks.dashboard.Item[]
				keys = {
					{ icon = " ", key = "F", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{ icon = " ", key = "N", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "G",
						desc = "Find Text",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = " ",
						key = "R",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "C",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "S", desc = "Restore Session", section = "session" },
					{
						icon = "󰒲 ",
						key = "L",
						desc = "Lazy",
						action = ":Lazy",
						enabled = package.loaded.lazy ~= nil,
					},
					{ icon = " ", key = "Q", desc = "Quit", action = ":qa" },
				},
			},
		},
		explorer = { enabled = true },
		image = {
			enabled = true,
			SNACKS_GHOSTTY = true,
			math = { enabled = false },
		},
		input = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>ss",
			function()
				Snacks.picker.smart()
			end,
			desc = "Snacks Smart Find Files",
		},
		{
			"<leader>sf",
			function()
				Snacks.picker.files()
			end,
			desc = "Snacks Find Files",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Snacks Buffers",
		},
		{
			"<leader>sg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Snacks Grep",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>st",
			function()
				Snacks.terminal.open()
			end,
			desc = "Snacks Terminal",
		},
		{
			"<leader>se",
			function()
				Snacks.explorer.open()
			end,
			desc = "Snacks File Explorer",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Snacks Diagnostics",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Snacks Keymaps",
		},
		{
			"<leader>sz",
			function()
				Snacks.zen()
			end,
			desc = "Toggle Zen Mode",
		},
	},
}
