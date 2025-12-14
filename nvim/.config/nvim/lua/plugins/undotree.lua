return {
	"jiaoshijie/undotree",
	---@module 'undotree.collector'
	---@type UndoTreeCollector.Opts
	opts = {},
	keys = { -- load the plugin only when using its keybinding:
		{
			"<leader>u",
			"<cmd>lua require('undotree').toggle()<cr>",
			desc = "Open the undo tree",
		},
	},
}
