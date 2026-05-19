def transparent [] {
  let gc = (open ~/dotfiles/ghostty/.config/ghostty/config) 
  if ($gc | str contains "background-opacity = 1") {
     $gc | str replace "background-opacity = 1" "background-opacity = 0.6" 
     | save -f ~/dotfiles/ghostty/.config/ghostty/config
  } else {
     $gc | str replace "background-opacity = 0.6" "background-opacity = 1" 
     | save -f ~/dotfiles/ghostty/.config/ghostty/config
  }
  osascript ~/dotfiles/ghostty/.config/ghostty/reload.scpt 
  | ignore
  let nc = (open ~/dotfiles/nvim/.config/nvim/plugin/colors.lua)
  if ($nc | str contains "enabled = true") {
    $nc | str replace "enabled = true" "enabled = false"
    | save -f ~/dotfiles/nvim/.config/nvim/plugin/colors.lua
  } else {
    $nc | str replace "enabled = false" "enabled = true"
    | save -f ~/dotfiles/nvim/.config/nvim/plugin/colors.lua
  }
}
