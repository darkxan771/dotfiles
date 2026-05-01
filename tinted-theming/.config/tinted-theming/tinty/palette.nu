# NEOVIM
let current = (tinty current)
tinty list --json | from json | where id == $current | get palette
| transpose key value 
| each { |row| { $row.key: $row.value.hex_str } }
| reduce { |acc, item| $acc | merge $item }
| save -f ~/.config/nvim/colors/palette.json

# NUSHELL
let palette = open ~/.config/nvim/colors/palette.json
$palette | transpose key value 
| each { |row| $"let ($row.key) = \"($row.value)\"" }
| str join "\n"
| save -f ~/.config/nushell/create_palette.nu

# SUBLIME TEXT
let st = $current + ".sublime-theme"
let scs = $current + ".sublime-color-scheme"
open `~/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings` 
| from json | update theme $st | update color_scheme $scs 
| to json  
| save -f `~/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings` 

# QUTEBROWSER
let template = (open ~/.qutebrowser/colors_template.py)
let colors = (open ~/.config/nushell/create_palette.nu | str replace --all "let " "")
$colors + $template | save -f ~/.qutebrowser/colors.py

# LAZYGIT
let lazy = "~/.local/share/tinted-theming/tinty/repos/tinted-lazygit/themes/" + $current + ".yml"
let table1 = ($lazy | path expand | open)
let table2 = (open ~/.config/lazygit/template.yml)
$table1 | append $table2 | to yaml | str replace "- gui" "gui" 
| str replace "- os" "os" |save -f ~/.config/lazygit/config.yml 


