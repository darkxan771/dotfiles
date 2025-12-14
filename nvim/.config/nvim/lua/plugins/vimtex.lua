return {
	{
		"lervag/vimtex",
		init = function()
			vim.g.vimtex_compiler_latexmk_engines = {
				_ = "-xelatex",
			}
			vim.g.vimtex_compiler_latexmk = {
				executable = "latexmk",
				options = {
					"-xelatex",
					"-shell-escape",
					"-file-line-error",
					"-synctex=1",
					"-interaction=nonstopmode",
				},
			}
			vim.g.vimtex_toc_config = {
				layer_status = {
					content = 1,
					label = 0,
					todo = 0,
					include = 0,
				},
				show_help = 0,
			}
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sync = 1
			vim.g.vimtex_view_skim_activate = 1
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "tex", "latex" },
				callback = function()
					vim.wo.conceallevel = 0
					vim.wo.concealcursor = ""
				end,
			})
		end,
	},
}
