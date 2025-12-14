return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.isort.with({
					extra_args = { "--profile", "black" },
				}),
				null_ls.builtins.formatting.black.with({
					extra_args = { "--preview", "--line-length=80" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })

		-- Autoformat on save for any filetype supported by none-ls
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.py", "*.lua", "*.rs", "*.c", "*.cpp", "*.js", "*.ts", "*.html", "*.css" },
			callback = function()
				vim.lsp.buf.format({
					async = false,
					filter = function(client)
						return client.name == "null-ls" or client.name == "none-ls"
					end,
				})
			end,
		})
	end,
}
