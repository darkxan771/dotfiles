export PATH=/opt/homebrew/bin/:/Users/meliot/.local/bin/:$PATH
export PS1="$"
export EDITOR=nvim
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export MANPAGER="nvim +Man!"

HISTSIZE=100000

autoload -U colors && colors
autoload -U compinit && compinit


function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

eval "$(_MARIMO_COMPLETE=zsh_source marimo)"

# OPTIONS

  setopt correct                   
  setopt extendedglob             
  setopt numericglobsort          
  setopt nobeep                  
  setopt appendhistory          
  setopt histignorealldups     
  setopt autocd               
  setopt inc_append_history  


# ALIASES

alias v="nvim"
alias ls="eza --icons"
alias ll="eza -lh --icons --git"
alias la="eza -lah --icons --git"
alias cat="bat"
alias rm="rm -rf"
alias mv="mv -i"
