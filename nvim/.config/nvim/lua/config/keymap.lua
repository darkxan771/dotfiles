return {
	vim.keymap.set("n", "<C-s>", ":%s/", { desc = "Find and replace" }),
	vim.keymap.set("n", "<C-j>", ":cnext<CR>", { desc = "Next quickfix" }),
	vim.keymap.set("n", "<C-k>", ":cprevious<CR>", { desc = "Previous quickfix" }),
	vim.keymap.set("n", "gp", "$", { desc = "Go to the end of line", noremap = true }),
	vim.keymap.set("n", "go", "0", { desc = "Go to the beginning of line", noremap = true }),
	vim.keymap.set("n", "dp", "d$", { desc = "Delete to the end of line", noremap = true }),
	vim.keymap.set("n", "do", "d0", { desc = "Delete to the beginning of line", noremap = true }),
	vim.keymap.set({ "n", "i", "v" }, "<C-t>", ":tabnew<CR>", { silent = true }),
	vim.keymap.set({ "n", "i", "v" }, "<C-S-t>", ":tabclose<CR>", { silent = true }),
	vim.keymap.set({ "n" }, "gb", ":bnext<CR>", { desc = "Go the next buffer" }),
	vim.keymap.set({ "n" }, "gB", ":bprev<CR>", { desc = "Go the previous buffer" }),
	vim.keymap.set("v", "y", "ygv<Esc>", { noremap = true }),
	vim.keymap.set("v", "(", "c()<Esc>P", { desc = "Surround with ()", noremap = true, silent = true }),
	vim.keymap.set("v", "{", "c{}<Esc>P", { desc = "Surround with {}", noremap = true, silent = true }),
	vim.keymap.set("v", "[", "c[]<Esc>P", { desc = "Surround with []", noremap = true, silent = true }),
	vim.keymap.set("v", '"', 'c""<Esc>P', { desc = 'Surround with ""', noremap = true, silent = true }),
	vim.keymap.set("v", "$", "c$$<Esc>P", { desc = "Surround with $...$", noremap = true, silent = true }),
	vim.keymap.set("n", "<leader>td", ":TodoTelescope<CR>", { desc = "Todo list" }),
	vim.keymap.set("n", "<leader>cl", "<C-w>j:q<CR>", { desc = "Close log", noremap = true, silent = true }),
	vim.keymap.set(
		"n",
		"<leader>cd",
		'o""""""<Esc>2hi<CR><CR><Esc>ki',
		{ desc = "Insert Python documentation", silent = true, noremap = true }
	),
	vim.keymap.set("n", "<D-s>", ":wa<CR>", { desc = "Save all", noremap = true }),
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "tex",
		callback = function()
			vim.keymap.set(
				"v",
				"<D-b>",
				"c\\textbf{}<Esc>P",
				{ buffer = true, desc = "Bold text", silent = true, noremap = true }
			)
			vim.keymap.set(
				"v",
				"<D-e>",
				"c\\emph{}<Esc>P",
				{ buffer = true, desc = "Emphasize text", silent = true, noremap = true }
			)
		end,
	}),
}
