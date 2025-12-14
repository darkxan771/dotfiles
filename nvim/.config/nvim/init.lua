vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.del("n", "gc")
vim.keymap.del("n", "gcc")

require("config.options")
require("config.lazy")
require("config.keymap")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 1500 })
	end,
})
