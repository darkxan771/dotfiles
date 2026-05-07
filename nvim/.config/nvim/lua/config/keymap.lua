return {
	-- INDENT
	vim.keymap.set("v", "<", "<gv"),
	vim.keymap.set("v", ">", ">gv"),
	vim.keymap.set("n", "<C-q>", "<C-v>", { desc = "Blockwise Visual Mode" }),
	-- MOTIONS
	vim.keymap.set("n", "<C-s>", ":%s/", { desc = "Find and replace" }),
	vim.keymap.set("n", "gp", "$", { desc = "Go to the end of line", noremap = true }),
	vim.keymap.set("n", "go", "0", { desc = "Go to the beginning of line", noremap = true }),
	vim.keymap.set("n", "dp", "d$", { desc = "Delete to the end of line", noremap = true }),
	vim.keymap.set("n", "do", "d0", { desc = "Delete to the beginning of line", noremap = true }),
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down", silent = true }),
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up", silent = true }),
	-- WINDOWS / TABS
	vim.keymap.set({ "n", "i", "v" }, "<C-t>", "<cmd>tabnew<CR>", { desc = "New Tab", silent = true }),
	vim.keymap.set("n", "]t", "<cmd>tabnext<CR>", { desc = "Next Tab", silent = true }),
	vim.keymap.set("n", "[t", "<cmd>tabnext<CR>", { desc = "Previous Tab", silent = true }),
	vim.keymap.set("n", "<C-x>", "<cmd>split<CR>", { desc = "Split window horizontally", silent = true }),
	vim.keymap.set("n", "<C-v>", "<cmd>vsplit<CR>", { desc = "Split window vertically", silent = true }),
	vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height", silent = true }),
	vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height", silent = true }),
	vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width", silent = true }),
	vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width", silent = true }),
	-- CODE ACTIONS
	vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic" }),
	vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover" }),
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Code Action" }),
	vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "LSP: Definition" }),
	vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "LSP: Format File" }),
	vim.keymap.set("n", "<leader>ck", vim.lsp.buf.hover, { desc = "LSP: Hover Information" }),
	vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "LSP: Rename Variable" }),
	vim.keymap.set("n", "<leader>cs", vim.lsp.buf.document_symbol, { desc = "LSP: Document Symbols" }),
	-- MISC
	vim.keymap.set("v", "y", "ygv<Esc>", { noremap = true }),
}
