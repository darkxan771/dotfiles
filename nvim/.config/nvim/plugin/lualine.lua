vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/akinsho/bufferline.nvim",
})

require("lualine").setup({
	options = { theme = "auto" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location", "os.date('%X')" },
	},
	highlights = {
		integrations = {
			lualine = true,
		},
	},
})

local bufferline = require("bufferline")
bufferline.setup({
	options = {
		mode = "tabs",
		style_preset = bufferline.style_preset.minimal,
		show_buffer_icons = false,
		show_buffer_close_icons = false,
		always_show_bufferline = false,
		auto_toggle_bufferline = true,
	},
})
