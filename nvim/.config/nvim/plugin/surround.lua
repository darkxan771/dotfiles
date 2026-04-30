vim.pack.add({
	"https://github.com/kylechui/nvim-surround",
})

vim.keymap.set("v", "(", "c()<Esc>P", { desc = "Surround with ()", noremap = true, silent = true })
vim.keymap.set("v", "{", "c{}<Esc>P", { desc = "Surround with {}", noremap = true, silent = true })
vim.keymap.set("v", "[", "c[]<Esc>P", { desc = "Surround with []", noremap = true, silent = true })
vim.keymap.set("v", '"', 'c""<Esc>P', { desc = 'Surround with ""', noremap = true, silent = true })
vim.keymap.set("v", "$", "c$$<Esc>P", { desc = "Surround with $...$", noremap = true, silent = true })
