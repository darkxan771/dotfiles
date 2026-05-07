require("sshfs"):setup()
require("duckdb"):setup()
require("starship"):setup({
	config_file = "~/.config/starship_yazi.toml",
})
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})
