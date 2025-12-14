return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.comment").setup({
			mappings = {
				comment = "",
				comment_line = "gc",
				comment_visual = "gc",
				textobject = "",
			},
		})
		require("mini.surround").setup({
			highlight_duration = 1500,
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding

				suffix_last = "", -- Suffix to search with "prev" method
				suffix_next = "", -- Suffix to search with "next" method
			},
			-- custom_surroundings = {
			-- 	B = {
			-- 		output = function(_, text)
			-- 			return "\\textbf{" .. text .. "}"
			-- 		end,
			-- 	},
			-- 	E = {
			-- 		output = function(_, text)
			-- 			return "\\emph{" .. text .. "}"
			-- 		end,
			-- 	},
			-- },
		})
		require("mini.pairs").setup()
		require("mini.icons").setup()
		require("mini.files").setup()
		-- vim.api.nvim_create_autocmd("FileType", {
		-- 	pattern = "tex",
		-- 	callback = function()
		-- 		-- Surround selection with \textbf{}
		-- 		vim.keymap.set("v", "<D-b>", function()
		-- 			require("mini.surround").add("B")
		-- 		end, { buffer = true, desc = "Bold text" })
		--
		-- 		-- Cmd+I for italics, if you want
		-- 		vim.keymap.set("v", "<D-e>", function()
		-- 			require("mini.surround").add("E")
		-- 		end, { buffer = true, desc = "Emphasize" })
		-- 	end,
		-- })
	end,
}
