$env.config.buffer_editor = 'nvim'
$env.config.show_banner = false
$env.EDITOR = "nvim"
$env.MANPAGER = "nvim +Man!"
$env.HOMEBREW_NO_ENV_HINTS = 1
$env.XDG_CONFIG_HOME = "/Users/meliot/.config/"

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
path add "/Users/meliot/.duckdb/cli/latest"

alias ff = fastfetch
alias astro = astroterm -C -u -m -c --city=Paris
alias pokemon = pokemon-colorscripts -r 
alias matrix = cmatrix
alias home = cd ~
alias dotfiles = cd ~/dotfiles
alias weather = http get wttr.in/tours

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

$env.list-colors = """
aztec, apathy, black-metal, caroline, catppuccin, cupertino, dracula, eldritch,
forest, gotham, horizon, kanagawa, lime, material, nord, nordlight, rose, 
roselight, nova, solar, swamp, tarot, tokyo, unicorn
"""

def colors [] { 
    echo $env.list-colors
}

def "colors current" [] {
    tinty current | tinty info
}

source ~/.config/nushell/colors.nu

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

# TELEVISION
mkdir ($nu.data-dir | path join "vendor/autoload")
tv init nu | save -f ($nu.data-dir | path join "vendor/autoload/tv.nu")

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

# SKIM
def skim [args] { 
  /Applications/Skim.app/Contents/MacOS/Skim $args ;
}

# NVIM
alias v = nvim
alias scratch = nvim ~/notes/scratch.md
alias smail = nvim ~/notes/mail.md

# CARAPACE
source ($nu.cache-dir)/carapace.nu

# GIT
source ~/.config/nushell/create_git.nu

ff
