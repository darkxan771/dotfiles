return {
	"rmagatti/auto-session",
	lazy = false,
	keys = { { "<leader>fs", "<cmd>AutoSession search<CR>", desc = "Session search" } },
	opts = {
		suppressed_dirs = { "~/", "~/Downloads" },
		session_lens = {
			picker = "telescope",
			buftypes_to_ignore = {},
			load_on_setup = true,
			picker_opts = { border = true },
			previewer = false,
		},
	},
}
