# NEOVIM
let current = (tinty current)
tinty list --json | from json | where id == $current | get palette
| transpose key value 
| each { |row| { $row.key: $row.value.hex_str } }
| reduce { |acc, item| $acc | merge $item }
| save -f ~/dotfiles/nvim/.config/nvim/colors/palette.json

# NUSHELL
let palette = open ~/dotfiles/nvim/.config/nvim/colors/palette.json
$palette | transpose key value 
| each { |row| $"let ($row.key) = \"($row.value)\"" }
| str join "\n"
| save -f ~/dotfiles/nushell/.config/nushell/create_palette.nu.tmp
mv -f ~/dotfiles/nushell/.config/nushell/create_palette.nu.tmp ~/dotfiles/nushell/.config/nushell/create_palette.nu

# SUBLIME TEXT
let st = $current + ".sublime-theme"
let scs = $current + ".sublime-color-scheme"
open `~/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings` 
| from json | update theme $st | update color_scheme $scs 
| to json  
| save -f `~/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings` 

# QUTEBROWSER
let template = (open ~/dotfiles/qutebrowser/.qutebrowser/colors_template.py)
let colors = (open ~/dotfiles/nushell/.config/nushell/create_palette.nu | str replace --all "let " "")
$colors + $template | save -f ~/dotfiles/qutebrowser/.qutebrowser/colors.py

# LAZYGIT
let lazy = "~/.local/share/tinted-theming/tinty/repos/tinted-lazygit/themes/" + $current + ".yml"
let table1 = ($lazy | path expand | open)
let table2 = (open ~/dotfiles/lazygit/.config/lazygit/template.yml)
$table1 | append $table2 | to yaml | str replace "- gui" "gui" 
| str replace "- os" "os" |save -f ~/dotfiles/lazygit/.config/lazygit/config.yml

# TMUX
source ~/dotfiles/nushell/.config/nushell/create_palette.nu
let new_color1 = (["fg=", $base0B] | str join)
let new_color2 = (["italics, fg=", $base0A] | str join )
open ~/dotfiles/tmux/.tmux.conf
| str replace --regex 'fg=#[0-9a-f]{6}' $new_color1
| str replace --regex 'italics, fg=#[0-9a-f]{6}' $new_color2
| save -f ~/dotfiles/tmux/.tmux.conf.tmp 
cp -f ~/dotfiles/tmux/.tmux.conf.tmp ~/dotfiles/tmux/.tmux.conf
tmux source-file ~/dotfiles/tmux/.tmux.conf
rm -f ~/dotfiles/tmux/.tmux.conf.tmp
