return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "texlab" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Information", buffer = bufnr })
				vim.keymap.set("n", "<leader>l", vim.lsp.buf.definition, { desc = "Definition", buffer = bufnr })
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action", buffer = bufnr })
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Diagnostic" })
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, { desc = "Rename Variable", buffer = bufnr })
			end

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "lua-language-server" },
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
				on_attach = on_attach,
				cmd = { "pyright-langserver", "--stdio" },
			})
			vim.lsp.config("texlab", {
				settings = {
					hover = {
						preview = false,
					},
				},
			})
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("texlab")
		end,
	},
}
