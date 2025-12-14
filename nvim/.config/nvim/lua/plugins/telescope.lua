return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"crispgm/telescope-heading.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
	config = function()
		require("telescope").setup({
			extensions = {
				["file_browser"] = {
					no_ignore = true,
					follow_symlinks = true,
					attach_mappings = function(_, map)
						local fb_actions = require("telescope._extensions.file_browser.actions")

						-- Toggle hidden files
						map("i", "<C-h>", fb_actions.toggle_hidden) -- insert mode
						map("n", "<C-h>", fb_actions.toggle_hidden) -- normal mode

						return true
					end,
				},
				["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				["heading"] = { treesitter = true },
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("file_browser")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("heading")
		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>ft", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fh", ":Telescope heading<CR>", { desc = "Telescope headings" })
		vim.keymap.set("n", "<leader>fy", ":Telescope file_browser<CR>", { desc = "Telescope browser" })
	end,
}
