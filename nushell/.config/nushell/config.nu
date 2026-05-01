$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
$env.EDITOR = "nvim"
$env.MANPAGER = "nvim +Man!"

# PATH
use std/util "path add"
path add "/opt/homebrew/bin"
path add "/opt/homebrew/opt/openjdk/bin"
path add "/opt/homebrew/opt/ruby/bin"
path add "/opt/homebrew/lib/ruby/gems/3.4.0/bin"
path add "/usr/local/bin"
path add "~/.cargo/bin"
path add "/Library/Tex/texbin"
path add "/Library/Frameworks/Python.framework/Versions/3.14/bin"
path add "~/.local/bin"
path add "/Users/meliot/Library/Application Support/nushell/nupm/plugins/bin"

alias ff = fastfetch
alias astro = astroterm -C -u -m -c --city=Paris
alias pokemon = pokemon-colorscripts -r 
alias matrix = cmatrix
alias home = cd ~

# PALETTE
source ~/.config/nushell/create_palette.nu
let base16_theme = {
    separator: $base03
    leading_trailing_space_bg: $base04
    header: $base0B
    datetime: $base0E
    filesize: $base0D
    row_index: $base0C
    bool: $base08
    int: $base0B
    duration: $base08
    range: $base08
    float: $base08
    string: $base04
    nothing: $base08
    binary: $base08
    cell-path: $base08
    hints: dark_gray
    shape_garbage: { fg: $base07 bg: $base08 attr: b }
    shape_bool: $base0D
    shape_int: { fg: $base0E attr: b }
    shape_float: { fg: $base0E attr: b }
    shape_range: { fg: $base0A attr: b }
    shape_internalcall: { fg: $base0C attr: b }
    shape_external: $base0C
    shape_externalarg: { fg: $base0B attr: b }
    shape_literal: $base0D
    shape_operator: $base0A
    shape_signature: { fg: $base0B attr: b }
    shape_string: $base0B
    shape_filepath: $base0D
    shape_globpattern: { fg: $base0D attr: b }
    shape_variable: $base0E
    shape_flag: { fg: $base0D attr: b }
    shape_custom: { attr: b }
}

$env.config.color_config = $base16_theme
$env.config.ls.use_ls_colors = true
$env.config.use_ansi_coloring = true
$env.LS_COLORS = (vivid generate ansi)

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

# ZOXIDE
source ~/.zoxide.nu

# STARSHIP
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# UPDATES
def update-python [] {
    pip3 list --outdated --format=json
    | from json
    | get name
    | each {|p| pip3 install -U $p }
}

alias update-brew = brew upgrade
alias update-latex = sudo tlmgr update --all

# NVIM
alias v = nvim
alias scratch = nvim ~/notes/scratch.md
alias smail = nvim ~/notes/mail.md

# CARAPACE
source ($nu.cache-dir)/carapace.nu

def aztec [] {
    tinty apply base16-aztec
}
def "aztec info" [] {
    tinty info base16-aztec
}
def apathy [] { 
    tinty apply base16-apathy
}
def "apathy info" [] { 
    tinty info base16-apathy
}
def black-metal [] {
    tinty apply base16-black-metal
}
def "black-metal info" [] {
    tinty info base16-black-metal
}
def caroline [] {
    tinty apply base16-caroline
}
def "caroline info" [] {
    tinty info base16-caroline
}
def catppuccin [] {
    tinty apply base16-catppuccin-frappe
}
def "catppuccin info" [] {
    tinty info base16-catppuccin-frappe
}
def cupertino [] {
    tinty apply base16-cupertino
}
def "cupertino info" [] {
    tinty info base16-cupertino
}
def dracula [] {
    tinty apply base16-dracula
}
def "dracula info" [] {
    tinty info base16-dracula
}
def eldritch [] {
    tinty apply base16-eldritch
}
def "eldritch info" [] {
    tinty info base16-eldritch
}
def forest [] {
    tinty apply base16-everforest
}
def "forest info" [] {
    tinty info base16-everforest
}
def gotham [] {
    tinty apply base16-gotham
}
def "gotham info" [] {
    tinty info base16-gotham
}
def horizon [] {
    tinty apply base16-horizon-dark
}
def "horizon info" [] {
    tinty info base16-horizon-dark
}
def kanagawa [] {
    tinty apply base16-kanagawa
}
def "kanagawa info" [] {
    tinty info base16-kanagawa
}
def lime [] {
    tinty apply base16-lime
}
def "lime info" [] {
    tinty info base16-lime
}
def material [] {
    tinty apply base16-material-palenight
}
def "material info" [] {
    tinty info base16-material-palenight
}
def nord [] {
    tinty apply base16-nord
}
def "nord info" [] {
    tinty info base16-nord
}
def nordlight [] {
    tinty apply base16-nord-light
}
def "nordlight info" [] {
    tinty info base16-nord-light
}
def rose [] {
    tinty apply base16-rose-pine-moon
}
def "rose info" [] {
    tinty info base16-rose-pine-moon
}
def roselight [] {
    tinty apply base16-rose-pine-dawn
}
def "roselight info" [] {
    tinty info base16-rose-pine-dawn
}
def nova [] {
    tinty apply base16-nova
}
def "nova info" [] {
    tinty info base16-nova
}
def solar [] {
    tinty apply base16-solarized-light
}
def "solar info" [] {
    tinty info base16-solarized-light
}
def swamp [] {
    tinty apply base16-swamp-dark
}
def "swamp info" [] {
    tinty info base16-swamp-dark
}
def tarot [] {
    tinty apply base16-tarot
}
def "tarot info" [] {
    tinty info base16-tarot
}
def tokyo [] {
    tinty apply base16-tokyo-night-storm
}
def "tokyo info" [] {
    tinty info base16-tokyo-night-storm
}
def unicorn [] {
    tinty apply base16-uwunicorn
}
def "unicorn info" [] {
    tinty info base16-uwunicorn
}
alias weather = http get wttr.in/tours

$env.list-colors = """
aztec, apathy, black-metal, caroline, catppuccin, cupertino, dracula, eldritch,
forest, gotham, horizon, kanagawa, lime, material, nord, nordlight, rose, 
roselight, nova, solar, swamp, tarot, tokyo, unicorn
"""

def colors [ ] { 
    echo $env.list-colors
}

def "colors current" [] {
    tinty current | tinty info
}

ff
