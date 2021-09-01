# Created by newuser for 5.8
echo "~/.zshrc is loaded"

autoload -Uz colors
colors

autoload -U compinit
compinit

autoload -U promptinit
promptinit

#alias
alias ls='ls -GF'
alias ll='ls -la'
alias la='ls -a'
alias vi='nvim'
alias g='git'

#QuickLook
alias ql='qlmanage -p "$@" >&/dev/null'

#prompt
prompt adam2

# Load syntax-highlighting and auto-suggestions (installed by homebrew)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# airdrop share command installed by gem
alias ad='terminal-share -service airdrop -video'

#use python installed by pyenv
#export PYENV_ROOT="/usr/local/var/pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -path)"
eval "$(pyenv init -)"
