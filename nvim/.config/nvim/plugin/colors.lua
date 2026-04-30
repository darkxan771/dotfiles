vim.pack.add({
	"https://github.com/brenoprata10/nvim-highlight-colors",
	"https://github.com/folke/todo-comments.nvim",
	"https://github.com/tinted-theming/tinted-nvim",
})

require("nvim-highlight-colors").setup({})
require("todo-comments").setup()
require("tinted-nvim").setup({
	apply_scheme_on_startup = true,
})
vim.cmd([[colorscheme tinted-nvim-colors-file]])
