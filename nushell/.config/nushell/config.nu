# config.nu
#
# Installed by:
# version = "0.108.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
$env.EDITOR = "nvim"

# YAZI
def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# PATH
use std/util "path add"
path add "/opt/homebrew/bin"
path add "/opt/homebrew/opt/openjdk/bin"
path add "/opt/homebrew/opt/ruby/bin"
path add "/opt/homebrew/lib/ruby/gems/3.4.0/bin"
path add "/usr/local/bin"
path add "~/.cargo/bin"
path add "/Library/Tex/texbin"
path add "/Library/Frameworks/Python.framework/Versions/3.13/bin"
path add "~/.local/bin"
path add "/Users/meliot/Library/Application Support/nushell/nupm/plugins/bin"

# ZOXIDE
source ~/.zoxide.nu

# STARSHIP
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# PIP UPDATE
def pip-update-all [] {
    pip3 list --outdated --format=json
    | from json
    | get name
    | each {|p| pip3 install -U $p }
}

# CARAPACE
source ($nu.cache-dir)/carapace.nu

