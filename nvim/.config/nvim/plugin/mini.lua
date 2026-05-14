vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",
})

require("mini.comment").setup({
	mappings = {
		comment = "",
		comment_line = "gc",
		comment_visual = "gc",
		textobject = "",
	},
})

require("mini.pairs").setup()
require("mini.icons").setup()
-- require("mini.files").setup()
--
-- vim.keymap.set(
-- 	"n",
-- 	"<leader>ty",
-- 	":lua if not MiniFiles.close() then MiniFiles.open() end<CR>",
-- 	{ desc = "Toggle MiniFiles", silent = true }
-- )

local snippets = require("mini.snippets")
local gen_loader = snippets.gen_loader
snippets.setup({
	snippets = { gen_loader.from_lang() },
})

local path = vim.fn.stdpath("config") .. "/colors/palette.json"
local json_str = table.concat(vim.fn.readfile(path), "\n")

local pal = vim.json.decode(json_str)

require("mini.base16").setup({
	palette = pal,
})
