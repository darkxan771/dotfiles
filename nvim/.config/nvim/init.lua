vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("vim._core.ui2").enable({})

-- HIGHLIGHT YANK
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 1500 })
	end,
})

-- AUTOCOMPLETE COMMAND LINE
vim.api.nvim_create_autocmd("CmdlineChanged", {
	pattern = ":",
	callback = function()
		vim.fn.wildtrigger()
	end,
})

-- DIAGNOSTICS, TREESITTER AND LSP
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
	callback = function(args)
		local client_id = args.data.client_id
		if not client_id then
			return
		end

		local client = vim.lsp.get_client_by_id(client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client_id, args.buf, {
				autotrigger = true,
			})
		end
		vim.keymap.set("n", "K", "<Nop>", { buffer = args.buf, desc = "which_key_ignore" })
	end,
})

vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main", build = ":TSUpdate" },
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/christoomey/vim-tmux-navigator",
})

vim.diagnostic.config({
	underline = false,
	signs = {
		active = true,
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰟃",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	virtual_text = true,
	float = {
		border = "rounded",
		format = function(diagnostic)
			return string.format("%s (%s)", diagnostic.message, diagnostic.source)
		end,
	},
})
require("nvim-treesitter").install({
	"bash",
	"css",
	"html",
	"javascript",
	"json",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"scss",
	"svelte",
	"toml",
	"tsx",
	"typst",
	"vue",
	"yaml",
})

require("mason").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
vim.lsp.config("pyright", {
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
})
vim.lsp.enable("pyright")
-- vim.lsp.enable("basedpyright")
-- vim.lsp.enable("pylsp")
vim.lsp.enable("jsonls")
vim.lsp.enable("tombi")
vim.lsp.config("cssls", {
	capabilities = capabilities,
})
vim.lsp.enable("cssls")
vim.lsp.config("html", {
	capabilities = capabilities,
})
vim.lsp.enable("html")
vim.lsp.config("nushell", {
	cmd = { "nu", "--lsp" },
	filetypes = { "nu" },
	root_dir = function(bufnr, on_dir)
		on_dir(vim.fs.root(bufnr, { ".git" }) or vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)))
	end,
})
vim.lsp.enable("nushell")
vim.lsp.enable("texlab")
vim.lsp.config("ruff", {
	init_options = {
		settings = {
			lineLength = 80,
			configuration = {
				format = {
					["quote-style"] = "double",
				},
			},
		},
	},
})
vim.lsp.enable("ruff")
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
vim.lsp.enable("lua_ls")
vim.lsp.enable("stylua")
vim.lsp.enable("yamlls")

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function(args)
		local bt = vim.bo[args.buf].buftype
		local ft = vim.bo[args.buf].filetype

		if bt == "prompt" or ft:match("snacks") then
			vim.bo[args.buf].omnifunc = nil
			vim.bo[args.buf].completefunc = nil
			vim.opt_local.complete = ""
			vim.opt_local.completeopt = "noselect"
		end
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py",
	callback = function()
		vim.lsp.buf.code_action({
			context = { only = { "source.fixAll.ruff" } },
			apply = true,
		})
		vim.lsp.buf.format({
			filter = function(client)
				return client.name == "ruff"
			end,
		})
	end,
})

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.html", "*.css", "*.lua", "*.json" },
	callback = function()
		vim.lsp.buf.format({
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
	end,
})

require("config.remove")
require("config.keymap")
require("config.accents")

-- UPDATE
vim.keymap.set("n", "<leader>uu", "<cmd>lua vim.pack.update()<cr>", { desc = "Update all packages" })
vim.keymap.set("n", "<leader>um", "<cmd>Mason<cr>", { desc = "Update Mason" })
vim.keymap.set("n", "<leader>ur", "<cmd>restart<cr>", { desc = "Restart" })
