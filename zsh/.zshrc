export PATH=/Library/Frameworks/Python.framework/Versions/3.14/bin/:/opt/homebrew/bin/:/Users/meliot/.local/bin/:/opt/homebrew/lib/ruby/gems/3.4.0/bin/:$PATH
export PS1="$"
export EDITOR=nvim

autoload -Uz compinit
compinit

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
